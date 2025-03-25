echo "Client ID: $SFDC_CLIENT_ID"
echo "Username: $SFDC_USERNAME"
sfdx force:auth:jwt:grant -i "$SFDC_CLIENT_ID" -f keys/server.key -o "$SFDC_USERNAME" --set-default-dev-hub -a devhub3

echo "Authentication successful!"