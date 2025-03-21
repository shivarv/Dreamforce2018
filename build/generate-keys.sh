#!/bin/zsh

echo "Generating certificates for use with CircleCI, press enter to continue"
read check1

# Generate private key with passphrase
openssl genrsa -des3 -passout pass:x -out server.pass.key 2048

# Remove passphrase from key
openssl rsa -passin pass:x -in server.pass.key -out server.key
rm server.pass.key

echo "Generating the server key, when prompted for a password, press enter"
echo "Press enter to continue"
read check2

# Generate CSR (Certificate Signing Request)
openssl req -new -key server.key -out server.csr

echo "Generating the certificate, press enter to continue"
read check3

# Generate Self-Signed Certificate (valid for 1 year)
openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt

# Convert Private Key to Base64 (Single Line)
echo "The key will now be encoded in BASE64 and displayed."
echo "Use this output as the value of SFDC_SERVER_KEY in CircleCI:"
echo ""
#base64 -w 0 server.key  # Linux (or use `base64 | tr -d '\n'` for macOS)
certutil -encode server.key server_key.b64 && type server_key.b64
echo ""

# Clean up unnecessary files
rm server.csr
#rm server.key

echo "Certificate and key generation complete."
echo "Please add 'server.crt' to your OAuth connected app in Salesforce."
