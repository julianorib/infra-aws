#!/bin/bash

yum install nginx -y
systemctl start nginx

hostname=$(hostname -s)
cat <<EOF | tee /usr/share/nginx/html/index.html
<html>
  <body>
    <h1>Imagem do S3</h1>
    <img src="https://${var.bucket_name}.s3.${var.region}.amazonaws.com/bike.jpg" width="300" height="300" alt="Imagem">
    <br>
    <h2>${hostname}</h2>
  </body>
</html>
EOF