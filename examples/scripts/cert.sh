#！/bin/bash
echo "generate the local.key and local.crt"
currentPath=$pwd
if [ ! -d ../key ]; then 
    mkdir ../key
fi 
cd ../key/

openssl genrsa -out local.key 1024
openssl rsa -in local.key -pubout -out local.pem
openssl req -new -key local.key -out local.csr
openssl x509 -req -days 365 -in local.csr -signkey local.key -out local.crt

rm -rf local.pem
rm -rf local.csr
cd $currentPath

