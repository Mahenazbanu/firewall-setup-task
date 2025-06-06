#!/bin/bash

# ╔════════════════════════════════════╗
# ║    UFW Firewall Setup for Linux.         ║
# ║      Author: Mahenazbanu                 ║
# ║      Date: 6 June ,2025                  ║
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

# ========== STEP 4: ALLOW SPECIFIC PORTS ==========
echo "🚪 Allowing essential ports..."
sudo ufw allow 22     # SSH
sudo ufw allow 80     # HTTP
sudo ufw allow 443    # HTTPS

# Optional: You can add more services like FTP or custom ports below
# sudo ufw allow 21     # FTP
# sudo ufw allow 8080   # Custom app

# ========== STEP 5: ENABLE THE FIREWALL ==========
echo "🔥 Enabling the firewall..."
sudo ufw enable

# ========== STEP 6: SHOW STATUS ==========
echo "📊 Displaying current firewall status..."
sudo ufw status numbered

echo -e "\n✅ Firewall setup complete."
