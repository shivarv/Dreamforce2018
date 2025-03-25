echo "Making Dir with permission."

mkdir -p deploy_prod
# Ensure it has the right permissions
chmod -R 755 deploy_prod
#Convert to MDAPI format for deployment to prod
echo "Converting to MDAPI format..."
sfdx project convert source --output-dir deploy_prod

# Ensure correct permissions
echo "Setting permissions for deploy_prod..."
chmod -R 755 deploy_prod

# Verify that the conversion was successful
echo "Checking contents of deploy_prod..."
ls -la deploy_prod

# Deploy to production & run all tests
echo "Deploying to production & running all tests..."
sfdx project deploy start -u prodOrg --metadata-dir deploy_prod --test-level RunAllTestsInOrg --wait 5