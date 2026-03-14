sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install apache2 -y

sudo mkdir -p /var/www/site_10

echo "<html>
<head>
    <meta charset=\"UTF-8\">
    <title>Terraform Lab 3</title>
</head>
<body>
    <h1>Welcome! This is your web page on Terraform Lab 3 VM</h1>
</body>
</html>" | sudo tee /var/www/site_10/index.html

sudo chown -R www-data:www-data /var/www/site_10
sudo chmod -R 755 /var/www/site_10

sudo bash -c 'cat > /etc/apache2/sites-available/var10.local.conf <<EOL
<VirtualHost *:8008>
    ServerAdmin admin@var10.local
    ServerName var10.local
    DocumentRoot /var/www/site_10
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOL'

sudo bash -c 'echo "Listen 8008" >> /etc/apache2/ports.conf'

sudo a2ensite var10.local.conf
sudo systemctl restart apache2
sudo systemctl enable apache2