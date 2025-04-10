#!/bin/bash

yum install nginx -y
systemctl start nginx
echo '<html><body><h1>Imagem do S3</h1><img src="https://julianorib-teste.s3.us-east-1.amazonaws.com/bike2.jpg" alt="Imagem"></body></html>' > /usr/share/nginx/html/index.html
