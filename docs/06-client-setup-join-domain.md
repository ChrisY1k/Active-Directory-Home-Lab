# 06 - Client Setup & Domain Join

Goal: Install Windows 11 Enterprise, join it to homelab.int domain.

## Step-by-Step

1. **Create WIN11-01 VM**
   - New → Name: WIN11-01
   - ISO: Windows 11 Enterprise Evaluation
   - RAM: 4–6 GB
   - CPU: 2 cores
   - Disk: 60 GB dynamic
   - Network: **Adapter 1** → Host-only (same as DC's INTERNAL-LAB)

2. **Install Windows 11**
   - Boot → install Enterprise edition
   - Create local admin account (temporary)
   - Install Guest Additions → reboot

3. **Join Domain**
   - Settings → System → About → **Join a domain**
   - Domain: **homelab.int**
   - Use domain admin credentials (homelab\Administrator)
   - Restart

4. **Verify**
   - After reboot → log in with domain account
   - `whoami` → should show homelab\username
   - `ipconfig /all` → IP in 192.168.56.50–150, gateway & DNS = 192.168.56.10
   - `ping DC01` & `ping 8.8.8.8` → both work

**Common Issue**: Join fails → check DNS points to DC (192.168.56.10), time sync between VMs.

Next: [07-powershell-user-automation.md](07-powershell-user-automation.md)
