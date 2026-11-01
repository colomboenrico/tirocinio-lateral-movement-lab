echo "Installation process of PacketBeat started successfully"
echo "Download and installation of the GPG Key"
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "Installation of apt-transport-https"
sudo apt-get install apt-transport-https
echo "Saving the repository definition to /etc/apt/sources.list.d/elastic-7.x.list"
echo "deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
echo "Installation of PacketBeat"
sudo apt-get update && sudo apt-get install packetbeat=7.12.1
echo "Configuration of PacketBeat in progress"
cd /beats/packetbeat/
sudo rm /etc/packetbeat/packetbeat.yml
sudo cp packetbeat.yml /etc/packetbeat/packetbeat.yml
echo "Configuration completed successfully!"
