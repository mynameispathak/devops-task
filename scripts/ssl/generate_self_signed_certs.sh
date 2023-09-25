#!/bin/bash

mkdir ./app/config/ssl_cert
cd ./app/config/ssl_cert

# Generate private key
openssl genpkey -algorithm RSA -out server.key

# Generate self-signed certificate
openssl req -new -key server.key -out server.csr
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt -subj="/C=US/ST=State/L=City/O=Organization/OU=Organizational Unit/CN=example.com"