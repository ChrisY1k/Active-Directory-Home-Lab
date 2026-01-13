# 03 - Domain Controller Setup (Windows Server 2022)

Goal: Install Windows Server 2022 on the VM and prepare it as the foundation for the Domain Controller.

## Step-by-Step

1. **Create the VM in VirtualBox**
   - New → Name: DC01
   - ISO: Select your Windows Server 2022 Evaluation ISO
   - Type: Microsoft Windows → Version: Windows 2022 (64-bit)
   - RAM: 4096–8192 MB (4–8 GB)
   - CPU: 2–4 cores
   - Hard disk: Create new VDI, dynamically allocated, 80–100 GB
   - Enable EFI (recommended)

2. **Configure Network Adapters (before first boot)**
   - Settings → Network
   - **Adapter 1**: Enable → Attached to: **NAT** → Adapter Type: Intel PRO/1000 MT Desktop
   - **Adapter 2**: Enable → Attached to: **Host-only Adapter** → Name: your Host-only network (e.g. VirtualBox Host-Only Ethernet Adapter)

3. **Install Windows Server 2022**
   - Start VM → boot from ISO
   - Language → Install now
   - Skip product key ("I don't have a product key")
   - Choose **Windows Server 2022 Standard Evaluation (Desktop Experience)**
   - Custom install → select disk → Next
   - Set Administrator password during first setup (strong, e.g. P@ssw0rdLab2025!)

4. **Post-install Setup**
   - Install **Guest Additions** (Devices → Insert Guest Additions CD → run setup.exe → reboot)
   - Rename computer: Settings → System → About → Rename this PC → DC01 → restart
   - Set static IP on **INTERNAL-LAB** adapter (ncpa.cpl → right-click adapter → Properties → IPv4):
     - IP: 192.168.56.10
     - Subnet: 255.255.255.0
     - Gateway: leave blank
     - DNS: 192.168.56.10 (itself – will become DNS after promotion)

5. **Verify**
   - `ipconfig /all` → confirm:
     - INTERNET (NAT): ~10.0.2.15, gateway 10.0.2.2
     - INTERNAL-LAB: 192.168.56.10, no gateway
   - `ping 8.8.8.8` → should work (internet via NAT)

**Common Issue**: NAT adapter "Unidentified network" → disable/enable in ncpa.cpl or restart VM.

Next: [04-promote-to-domain-controller.md](04-promote-to-domain-controller.md)
