# 11 - Troubleshooting Common Issues

This guide collects the most frequent problems encountered during the lab build and their solutions.

## General Tips First
- Take VirtualBox snapshots after every major step (easy rollback)
- Always run commands as Administrator
- Restart VMs or host if something feels stuck
- Check Event Viewer (Windows Logs → System/Application) for errors

## Specific Issues & Fixes

**NAT/Internet adapter offline or "Unidentified network" on DC**
- Disable/enable the INTERNET adapter in ncpa.cpl
- Run `ipconfig /release "INTERNET"` then `/renew "INTERNET"`
- Confirm Settings → Network → Adapter 1 is **NAT** (not NAT Network)
- Delete any custom NAT Networks in Host Network Manager

**Client gets 169.254.x.x (APIPA) instead of 192.168.56.x**
- Ensure client Adapter 1 is **Host-only** (same as DC's INTERNAL-LAB)
- Check DHCP scope is active on DC
- Verify DHCP bindings only to INTERNAL-LAB adapter
- Run `ipconfig /renew` on client

**Domain join fails ("cannot find domain")**
- Client DNS must be 192.168.56.10 (DC)
- Run `ipconfig /flushdns` on client
- Check time sync: `w32tm /resync` on both VMs
- Ping DC01 by name from client

**GPO not applying**
- Run `gpupdate /force` on client
- Check `gpresult /r` → see if GPO is listed
- Ensure GPO linked to domain or correct OU
- Wait for replication (5–15 min) or reboot

**DHCP not handing out IPs**
- Scope activated? Right-click → Activate
- Bindings correct? Only INTERNAL-LAB checked
- Firewall blocking? Temporarily disable domain firewall: `Set-NetFirewallProfile -Profile Domain -Enabled False`

**Certificate auto-enrollment not working**
- Run `certutil -pulse` on client
- Confirm template published in certsrv.msc
- GPO enabled with both checkboxes
- Reboot client or wait 90 minutes for normal cycle

**Other quick resets**
- Network stack reset: `netsh int ip reset` then reboot
- DNS flush: `ipconfig /flushdns`
- VirtualBox restart: close/reopen program or reboot host PC

This lab involves many moving parts — troubleshooting is part of the learning!

Thanks for following the guide. Your homelab is now complete — great job!
