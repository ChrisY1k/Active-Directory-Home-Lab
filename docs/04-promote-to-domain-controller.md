# 04 - Promote Server to Domain Controller

Goal: Install Active Directory Domain Services and promote DC01 to domain controller for homelab.int.

## Step-by-Step

1. **Install AD DS + DNS Roles**
   - Server Manager → Manage → Add Roles and Features
   - Role-based → Next → select server → Next
   - Server Roles → check **Active Directory Domain Services** → Add Features
   - Also check **DNS Server** (usually added automatically)
   - Next → Install → wait

2. **Promote to Domain Controller**
   - After install → yellow flag in Server Manager → **Promote this server to a domain controller**
   - Deployment: **Add a new forest**
   - Root domain name: **homelab.int**
   - Next → set DSRM password (same as admin or stronger)
   - Next through warnings (ignore DNS delegation in lab)
   - Install → server reboots automatically

3. **Post-reboot**
   - Log in as **homelab\Administrator**
   - Server Manager → Tools → **Active Directory Users and Computers** → confirm domain homelab.int appears
   - Tools → **DNS** → expand server → forward lookup zones → homelab.int should exist

**Common Issue**: Promotion fails with password error → ensure password meets complexity or temporarily disable policy (lab only).

Next: [05-dhcp-routing-nat.md](05-dhcp-routing-nat.md)
