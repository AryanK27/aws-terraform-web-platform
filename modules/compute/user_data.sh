#!/bin/bash

yum install nginx -y

cat > /usr/share/nginx/html/index.html <<'HTML'
${index_html}
HTML


systemctl start nginx 
systemctl enable nginx
