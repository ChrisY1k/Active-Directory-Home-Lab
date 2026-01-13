# 02 - VirtualBox Networking Configuration

This lab uses a **dual-NIC** Domain Controller with:
- NAT: Gives DC internet access
- Host-only: Private lab network (192.168.56.0/24) for clients

## Step-by-Step Setup

1. Open VirtualBox → **File** → **Host Network Manager**
2. **Host-only Networks** tab:
   - Click **Create** (or use existing)
   - Name: (leave default or call it "Lab-Internal")
   - IPv4 CIDR: **192.168.56.0/24**
   - **Uncheck** Enable DHCP Server (we'll use DHCP on the DC)
   - Click **Apply** → **Close**

3. **NAT Networks** tab:
   - Make sure there are **no** custom NAT Networks (delete any like "LabNetwork" if present)
   - We use the **built-in/default NAT** (no entry needed here)

4. For each VM (DC01 and WIN11-01) → Settings → Network:
   - **Adapter 1** (DC01 only):
     - Enable: checked
     - Attached to: **NAT**
     - Adapter Type: Intel PRO/1000 MT Desktop
   - **Adapter 2** (DC01 only):
     - Enable: checked
     - Attached to: **Host-only Adapter**
     - Name: the one you created (e.g. VirtualBox Host-Only Ethernet Adapter)
   - **WIN11-01**: Only Adapter 1 → Host-only (no NAT needed)

**Troubleshooting Tip**: If NAT doesn't assign 10.0.2.15 after VM start → disable/enable adapter in VM's ncpa.cpl.

Next: [03-dc-setup-windows-server-2022.md](03-dc-setup-windows-server-2022.md)
