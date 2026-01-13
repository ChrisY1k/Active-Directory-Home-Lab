# 05 - DHCP, Routing & NAT Configuration

Goal: Set up DHCP on DC for clients, enable routing so clients get internet through DC.

## Step-by-Step

1. **Install DHCP Role**
   - Server Manager → Manage → Add Roles → check **DHCP Server** → Install
   - After install → yellow flag → **Complete DHCP configuration** → authorize using admin credentials

2. **Create Scope**
   - Tools → DHCP → expand IPv4 → right-click server → **New Scope**
   - Name: Lab-Scope
   - Start: 192.168.56.50
   - End: 192.168.56.150
   - Subnet: 255.255.255.0
   - Router (gateway): **192.168.56.10** (DC itself)
   - DNS server: **192.168.56.10**
   - Domain name: homelab.int
   - Activate scope

3. **Enable Routing & NAT on DC**
   - PowerShell (admin):
   - - Tools → **Routing and Remote Access** → right-click server → **Configure and Enable Routing and Remote Access**
- Choose **NAT** → Next
- Public interface: select **INTERNET** (NAT adapter)
- Next → Finish → service starts

4. **Verify on DC**
- `ipconfig /all` → confirm both adapters correct
- DHCP console → expand scope → Address Leases (empty until client connects)

**Common Issue**: Clients get 169.254.x.x → ensure DHCP bound only to INTERNAL-LAB (DHCP Properties → Bindings tab).

Next: [06-client-setup-join-domain.md](06-client-setup-join-domain.md)
