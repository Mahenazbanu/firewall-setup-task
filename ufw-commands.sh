#!/bin/bash

# ╔════════════════════════════════════╗
# ║    UFW Firewall Setup for Linux      ║
# ║      Author: Mahenazbanu             ║
# ║      Date: 6 June 2025               ║
# ╚════════════════════════════════════╝

# ========== STEP 1: SYSTEM UPDATE ==========
echo "🔄 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# ========== STEP 2: INSTALL UFW ==========
echo "🔧 Installing UFW if not already installed..."
sudo apt install ufw -y

# ========== STEP 3: SET DEFAULT POLICIES ==========
echo "🔐 Setting default firewall policies..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw default deny routed

# ========== STEP 4: ALLOW SPECIFIC PORTS ==========
echo "🚪 Allowing essential ports..."
sudo ufw allow 22/tcp    # SSH
sudo ufw allow 80/tcp    # HTTP
sudo ufw allow 443/tcp   # HTTPS

# Optional: Uncomment below if needed
# sudo ufw allow 21/tcp    # FTP
# sudo ufw allow 8080/tcp  # Custom App

# ========== STEP 5: BLOCK UNSAFE SERVICES ==========
echo "🛑 Blocking insecure or unused services..."
sudo ufw deny 25/tcp     # Block SMTP (optional)
sudo ufw deny 23/tcp     # Block Telnet

# Optional: Block traffic from a specific IP
# sudo ufw deny from 192.168.1.100

# ========== STEP 6: ENABLE THE FIREWALL ==========
echo "🔥 Enabling the firewall..."
sudo ufw enable

# ========== STEP 7: SHOW STATUS ==========
echo "📊 Displaying current firewall status..."
sudo ufw status numbered

echo -e "\n✅ Firewall setup complete."

# View active rules
sudo ufw status verbose

# List all rules with numbers
sudo ufw status numbered

# View saved rule file
sudo cat /etc/ufw/user.rules
