# 05 - DHCP, Routing & NAT Configuration

Goal: Set up DHCP on the DC for clients, enable routing/NAT so clients get internet through the DC.

## Step-by-Step

1. **Install DHCP Role on DC01**
   - Open **Server Manager** → **Manage** → **Add Roles and Features**
   - Role-based → Next → select your server → Next
   - Server Roles → check **DHCP Server** → Add Features when prompted → Next → Install
   - After install → yellow flag in Server Manager → **Complete DHCP configuration**
     - Use default credentials (Administrator) → Authorize → Finish

2. **Create DHCP Scope**
   - Tools → **DHCP**
   - Expand IPv4 → right-click your server name → **New Scope**
   - Name: **Lab-Scope**
   - Start IP: **192.168.56.50**
   - End IP: **192.168.56.150**
   - Subnet mask: **255.255.255.0**
   - Exclusions: none (for lab)
   - Lease duration: default
   - Router (default gateway): **192.168.56.10** (the DC itself)
   - DNS server: **192.168.56.10**
   - Domain name: **homelab.int**
   - Activate the scope → Finish

3. **Verify DHCP Bindings (Important – Prevents Wrong Interface)**
   - In DHCP console → right-click server name → **Properties**
   - **Bindings** tab → ensure **only** the INTERNAL-LAB adapter (192.168.56.10) is checked
   - Uncheck the NAT/INTERNET adapter → Apply → OK

4. **Enable Routing & NAT on DC**
   - PowerShell as Administrator:
     ```powershell
     Install-WindowsFeature -Name Routing -IncludeManagementTools

Open Routing and Remote Access (Tools → Routing and Remote Access)
Right-click server name (DC01) → Configure and Enable Routing and Remote Access
Next → choose NAT → Next
Public interface: select your INTERNET (NAT) adapter
Next → Finish (service starts automatically)

Verify on DC
ipconfig /all → confirm:
INTERNET (NAT): ~10.0.2.15, gateway 10.0.2.2
INTERNAL-LAB: 192.168.56.10, no gateway

DHCP console → expand scope → Address Leases (empty until client connects)

Next: [06-client-setup-join-domain.md](06-client-setup-join-domain.md)
