#!/bin/bash

yum install nginx -y
systemctl start nginx


echo '<html><body><h1>Imagem do S3</h1><img src="https://julianorib-infra-aws.s3.us-east-1.amazonaws.com/bike" alt="Imagem"></body></html>' > /usr/share/nginx/html/index.html
