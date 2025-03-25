echo "Client ID: $SFDC_PROD_CLIENTID"
echo "Username: $SFDC_PROD_USER"
sfdx force:auth:jwt:grant -i "$SFDC_PROD_CLIENTID" -f keys/server.key -o "$SFDC_PROD_USER" --set-default-dev-hub -a devhub3

echo "Authentication successful!"