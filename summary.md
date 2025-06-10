# 🛡️ UFW Firewall Setup Report  
## 📌 Script Overview 

---

This document provides a detailed analysis of the UFW (Uncomplicated Firewall) configuration script written in Bash. The script is designed to: 

    Update system packages
    Install and configure UFW
    Set secure default policies
    Allow essential services
    Enable the firewall
    Display the final status

------     

The script follows best practices for securing a Linux system using a basic but effective firewall strategy. 
**🧾 Script Details**  
**✅ Author:** Mahenazbanu 
**📅 Date:** June 6, 2025 
**🖥️ Target OS:** Debian-based Linux (e.g., ubuntu , Kali Linux) 
**🔧 Tools Used:** 
    apt: Package manager
    ufw: Uncomplicated Firewall
     

# 🧰 Step-by-Step Breakdown  
## 🔁 Step 1: System Update 

    **bash :** 
       sudo apt update && sudo apt upgrade -y
 
   **Purpose :** Ensures all installed packages are up-to-date.
   **Why Important :** Prevents exploitation through outdated software.
   **Effect :** Fetches latest package lists and upgrades installed packages without prompts (-y).
     

## ⚙️ Step 2: Install UFW 

    **bash :**
       sudo apt install ufw -y
 
   **Purpose :** Installs UFW if not already present.
   **Why Important :** UFW simplifies firewall management for beginners and administrators alike.
   **Effect :** Installs UFW with default configurations.
     

## 🛑 Step 3: Set Default Policies 

**bash :** 
  sudo ufw default deny incoming
  sudo ufw default allow outgoing
 
  **Purpose :** Sets secure default rules for traffic.
  **Why Important :** Denying all incoming traffic by default minimizes exposure to threats.
  **Effect :**  Blocks all unsolicited incoming connections. Allows all outgoing traffic (for normal internet use like browsing, updates, etc.).
        
🔒 Principle of least privilege applied here. 
     

## 🚪 Step 4: Allow Specific Ports 

    **bash :**
       sudo ufw allow 22     # SSH
       sudo ufw allow 80     # HTTP
       sudo ufw allow 443    # HTTPS
 
   **Purpose :** Allows necessary services to function while keeping the system secure.
   **Why Important :**
        Port 22 (SSH): Remote administration access
        Port 80 (HTTP): Web traffic (non-encrypted)
        Port 443 (HTTPS): Secure web traffic (encrypted)
         
           
##  Optional Services :
   
    **bash :**
    # sudo ufw allow 21     # FTP
    # sudo ufw allow 8080   # Custom app
     
These lines are commented out but can be enabled if needed.
     

## 🔥 Step 5: Enable the Firewall 

    **bash :**
       sudo ufw enable
 
   **Purpose :** Activates the firewall with the defined rules.
   **Why Important :** Without enabling, no rules take effect.
   **Effect :** Applies the configured rules immediately and persists across reboots.
     

## 📊 Step 6: Show Status 

     **bash :**
        sudo ufw status numbered
 
   **Purpose :** Displays current active firewall rules with numbers.
   **Why Important :** Provides visibility into which ports/services are allowed or blocked.

    **Output :**
     - Status: active

     To                         Action      From
     --                         ------      ----
    [ 1] 22/tcp                     ALLOW IN    Anywhere                  
    [ 2] 80/tcp                     ALLOW IN    Anywhere                  
    [ 3] 443/tcp                    ALLOW IN    Anywhere                  
    [ 4] 25/tcp                     DENY IN     Anywhere                  
    [ 5] Anywhere                   DENY IN     192.168.1.100             
    [ 6] 23/tcp                     DENY IN     Anywhere                  
    [ 7] 22                         ALLOW IN    Anywhere                  
    [ 8] 80                         ALLOW IN    Anywhere                  
    [ 9] 443                        ALLOW IN    Anywhere                  

---

# 🧠 How the Firewall Filters Traffic  

## Firewalls operate at the network layer  and filter traffic based on: 
**1. Port Numbers :**  
    Each service runs on a specific port (e.g., SSH → 22, HTTP → 80).
    The firewall allows or blocks traffic based on these ports.
     

**2. Direction :**  
    Inbound : Incoming traffic from external sources.
    Outbound : Traffic initiated from the system to outside networks.
     

**3. Default Policies :**  
      By setting:
       - default deny incoming
       - default allow outgoing
 We enforce a secure posture that only allows explicitly permitted services.
     

**4. Rules Evaluation :** 
    Rules are processed in order.
    First matching rule decides whether to allow or deny a packet.
     

## 🧩 Technical Summary of Traffic Filtering  :
|DIRECTION | POLICY | DESCRIPTION |
|----------|--------|-------------|
|Inbound | Deny All | Blocks unauthorized access|
|Outbound | Allow All | Permits normal user activity|
|Inbound | Allow Specific Ports | Only lets in known services (SSH, HTTP, HTTPS)|
 
 

**This ensures that :** 
    - Attackers cannot initiate connections to your machine.
    - You can still browse the web, connect via SSH, and serve websites securely.
     

## ✅ Final Notes 
✔️ Advantages of This Configuration: 
-    Simple and easy to understand.
-    Follows security best practices.
-    Can be extended easily with additional services.
     

## 🛠️ Tips for Future Enhancements: 
   -  Add logging: sudo ufw logging on
   -  Limit SSH login attempts with rate limiting:  
                   
    **bash :**
       sudo ufw limit 22/tcp

 - Use application profiles in /etc/ufw/applications.d/
     

## 📄 Conclusion  

- This script sets up a secure and minimal firewall environment suitable for most servers and personal systems running Debian-based distributions like Kali Linux. It balances usability and security by allowing essential services while denying unnecessary exposure. By applying the principle of least privilege and maintaining strict control over inbound traffic, this configuration helps protect against common network attacks. 
