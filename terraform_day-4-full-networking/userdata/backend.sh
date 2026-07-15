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

sudo apt install -y openjdk-17-jdk maven wget curl tar

echo "========================================================"
echo " Configuring JAVA_HOME"
echo "========================================================"

JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))

if ! grep -q "JAVA_HOME" /etc/environment; then
    echo "JAVA_HOME=$JAVA_HOME" | sudo tee -a /etc/environment
fi

export JAVA_HOME=$JAVA_HOME

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
echo " Creating Node Exporter Service"
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
echo "Java Version"
java -version

echo ""
echo "Javac Version"
javac -version

echo ""
echo "Maven Version"
mvn -version

echo ""
echo "JAVA_HOME"
echo "$JAVA_HOME"

echo ""
echo "Node Exporter Version"
/usr/local/bin/node_exporter --version

echo ""
echo "Node Exporter Service Status"
sudo systemctl status node_exporter --no-pager

echo ""
echo "Node Exporter Metrics URL"
echo "http://$(hostname -I | awk '{print $1}'):9100/metrics"