#!/bin/bash
set -e

echo "========================================================"
echo " Updating System"
echo "========================================================"

sudo apt update -y
sudo apt upgrade -y

echo "========================================================"
echo " Installing Required Packages"
echo "========================================================"

sudo apt install -y curl wget tar software-properties-common

echo "========================================================"
echo " Removing Old Node.js (if installed)"
echo "========================================================"

sudo apt remove -y nodejs npm || true

echo "========================================================"
echo " Installing Node.js 18 LTS"
echo "========================================================"

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

echo "========================================================"
echo " Installing Angular CLI 15"
echo "========================================================"

sudo npm install -g @angular/cli@15

echo "========================================================"
echo " Installing Prometheus Node Exporter v1.5.0"
echo "========================================================"

cd /tmp

wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz

tar -xzf node_exporter-1.5.0.linux-amd64.tar.gz

sudo mv node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin/

rm -rf node_exporter-1.5.0.linux-amd64*
echo "========================================================"
echo " Creating Node Exporter User"
echo "========================================================"

if ! id "node_exporter" >/dev/null 2>&1; then
    sudo useradd --no-create-home --shell /bin/false node_exporter
fi

echo "========================================================"
echo " Creating systemd Service"
echo "========================================================"

sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOF
[Unit]
Description=Prometheus Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

echo "========================================================"
echo " Starting Node Exporter"
echo "========================================================"

sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl restart node_exporter

echo "========================================================"
echo " Installation Completed Successfully"
echo "========================================================"

echo ""
echo "Node Version"
node -v

echo ""
echo "NPM Version"
npm -v

echo ""
echo "Angular Version"
ng version

echo ""
echo "Node Exporter Version"
/usr/local/bin/node_exporter --version

echo ""
echo "Node Exporter Service Status"
sudo systemctl status node_exporter --no-pager

echo ""
echo "Node Exporter URL"
echo "http://$(hostname -I | awk '{print $1}'):9100/metrics"