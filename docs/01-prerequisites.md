# 01 - Prerequisites

Before building the lab, make sure you have everything ready.

## Hardware Requirements (Recommended Minimum)
- CPU: 4+ cores (i5/i7 or Ryzen 5+)
- RAM: 16 GB minimum (24–32 GB ideal)
- Storage: SSD with 200+ GB free (VMs take ~150 GB total)
- Host OS: Windows 10/11, macOS, or Linux (Windows easiest for beginners)

## Software Downloads (All Free/Evaluation)
1. **Oracle VM VirtualBox** (latest version)  
   - https://www.virtualbox.org  
   - Also download the **Extension Pack** (same page, same version)

2. **Windows Server 2022 Evaluation ISO** (180-day trial)  
   - https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022  
   - Choose **Windows Server 2022 Standard Evaluation (Desktop Experience)**

3. **Windows 11 Enterprise Evaluation ISO** (90-day trial, can be extended)  
   - https://www.microsoft.com/en-us/evalcenter/evaluate-windows-11-enterprise  
   - **Enterprise** version required (Home/Pro cannot join domains)

## VirtualBox Setup Tips
- Install VirtualBox + Extension Pack
- Enable hardware virtualization in BIOS/UEFI (VT-x/AMD-V)
- Take snapshots after every major step (easy rollback)

Next: [02-virtualbox-networking.md](02-virtualbox-networking.md)
