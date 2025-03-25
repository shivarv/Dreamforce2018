echo "Client ID: $SFDC_PROD_CLIENTID"
echo "Username: $SFDC_PROD_USER"
echo "server key test1 : $SFDC_SERVER_KEY"
mkdir -p keys
chmod +w keys
echo $SFDC_SERVER_KEY > keys/servernew.key
sfdx force:auth:jwt:grant -i "$SFDC_PROD_CLIENTID" -f keys/server.key -o "$SFDC_PROD_USER" --set-default-dev-hub -a devhub3
echo "Authentication successful!"