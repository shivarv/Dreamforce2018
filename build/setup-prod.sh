# Get the private key from the environment variable
echo "Setting up Production Connection..."
mkdir -p keys  # Create keys directory if it doesn't exist
echo "SFDC_SERVER_KEY"
echo "$SFDC_SERVER_KEY" | base64 --decode > keys/server.key
echo "SFDC_SERVER_KEY1"

echo "$SFDC_SERVER_KEY" | base64 --decode | openssl rsa -check
echo "SFDC_SERVER_KEY2"

echo "$SFDC_SERVER_KEY" | tr -d '\n' | base64 --decode > keys/server.key
echo "SFDC_SERVER_KEY3"

printf "%s" "$SFDC_SERVER_KEY" | base64 --decode > keys/server.key

chmod 600 keys/server.key

# Authenticate to salesforce
echo "Authenticating..."
sfdx force:auth:jwt:grant -i $SFDC_PROD_CLIENTID -f keys/server.key -u $SFDC_PROD_USER --set-default-dev-hub -a devhub3