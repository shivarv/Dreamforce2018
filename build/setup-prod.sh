# Get the private key from the environment variable
echo "Setting up Production Connection..."
mkdir -p keys  # Create keys directory if it doesn't exist

echo "SFDC_SERVER_KEY"
echo "SFDC_SERVER_KEY length: ${#SFDC_SERVER_KEY}"
echo "$SFDC_SERVER_KEY" > keys/raw_key.txt
cat -A keys/raw_key.txt

# Alternative decoding methods for debugging
echo "$SFDC_SERVER_KEY" | tr -d '\n' | base64 --decode > keys/server.key
echo "SFDC_SERVER_KEY3"

printf "%s" "$SFDC_SERVER_KEY" | base64 --decode > keys/server.key

# Ensure correct permissions
chmod 600 keys/server.key

# Debugging: Verify if the key exists and is not empty
if [ ! -s keys/server.key ]; then
    echo "Error: server.key is empty or missing."
    exit 1
fi

# Authenticate to Salesforce
echo "Authenticating..."
sfdx force:auth:jwt:grant -i "$SFDC_PROD_CLIENTID" -f keys/server.key -u "$SFDC_PROD_USER" --set-default-dev-hub -a devhub3

# Check if authentication succeeded
if [ $? -ne 0 ]; then
    echo "Error: Authentication failed."
    exit 1
fi

echo "Authentication successful!"