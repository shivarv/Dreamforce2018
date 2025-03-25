echo "Client ID: $SFDC_PROD_CLIENTID"
echo "Username: $SFDC_PROD_USER"
echo "server key : $SFDC_SERVER_KEY"

sfdx force:auth:jwt:grant -i "$SFDC_PROD_CLIENTID" -f "$SFDC_SERVER_KEY" -o "$SFDC_PROD_USER" --set-default-dev-hub -a devhub3

echo "Authentication successful!"