echo "Installation process of Auditbeat started successfully"
echo "Download and installation of the GPG Key"
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "Installation of apt-transport-https"
sudo apt-get install apt-transport-https
echo "Saving the repository definition to /etc/apt/sources.list.d/elastic-7.x.list"
echo "deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
echo "Installation of Auditbeat"
sudo apt-get update && sudo apt-get install auditbeat=7.10.2
echo "Configuration of AuditBeat in progress"
cd /beats/auditbeat/
rm /etc/auditbeat/auditbeat.yml
cp /beats/auditbeat/Auditbeat.yml /etc/auditbeat/auditbeat.yml
echo "Configuration completed successfully!"
