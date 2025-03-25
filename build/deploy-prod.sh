#Convert to MDAPI format for deployment to prod
echo "Converting to MDAPI format..."
sfdx project convert source --output-dir deploy_prod
#Deploy to prod & run all tests
echo "Deploying to production & running all tests..."
sfdx force:mdapi:deploy -u $SFDC_PROD_USER -d deploy_prod/ -w 5 -l RunAllTestsInOrg