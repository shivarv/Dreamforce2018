sfdx force:auth:jwt:grant -i "$SFDC_CLIENT_ID" -f keys/server.key -u "$SFDC_USERNAME" --set-default-dev-hub -a devhub3

echo "Authentication successful!"