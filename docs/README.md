# Documentation Index – Active Directory Home Lab

This folder contains detailed, beginner-friendly step-by-step guides covering every major phase of building this Active Directory home lab in Oracle VirtualBox.

The guides are written in chronological order, with screenshots, commands, troubleshooting tips, and explanations of **why** each step matters — perfect for learning, replicating, or showcasing in interviews.

## Available Guides

| Order | Filename                          | Description                                                                 |
|-------|-----------------------------------|-----------------------------------------------------------------------------|
| 01    | [01-prerequisites.md](01-prerequisites.md)               | Hardware requirements, software downloads (ISOs), VirtualBox setup          |
| 02    | [02-virtualbox-networking.md](02-virtualbox-networking.md)           | Configuring Host-only & NAT adapters, removing conflicting NAT Networks     |
| 03    | [03-dc-setup-windows-server-2022.md](03-dc-setup-windows-server-2022.md) | Installing Windows Server 2022, initial config, Guest Additions             |
| 04    | [04-promote-to-domain-controller.md](04-promote-to-domain-controller.md) | Installing AD DS + DNS, promoting to DC, creating homelab.int domain       |
| 05    | [05-dhcp-routing-nat.md](05-dhcp-routing-nat.md)                  | Configuring DHCP scope, RRAS for NAT/routing, internet sharing to clients   |
| 06    | [06-client-setup-join-domain.md](06-client-setup-join-domain.md)          | Windows 11 client install, domain join, first login                         |
| 07    | [07-powershell-user-automation.md](07-powershell-user-automation.md)       | Creating users/groups with PowerShell, onboarding script walkthrough       |
| 08    | [08-file-share-permissions.md](08-file-share-permissions.md)            | Setting up HRDocs share, NTFS + share permissions, group-based access      |
| 09    | [09-gpos-examples.md](09-gpos-examples.md)                      | Basic GPOs (desktop restrictions, etc.), linking & testing                 |
| 10    | [10-ad-certificate-services.md](10-ad-certificate-services.md)            | Installing & configuring Enterprise Root CA, duplicating templates         |
| 11    | [11-troubleshooting.md](11-troubleshooting.md)                   | Common issues & fixes (offline NAT, unidentified network, DHCP conflicts, etc.) |

## How to Use These Guides
- Start from **01-prerequisites.md** and follow in order.
- Each guide includes:
  - Step-by-step instructions
  - Screenshots from the actual lab
  - Commands to copy-paste
  - Explanations of why the step matters (great for interviews!)
  - Troubleshooting notes for common pitfalls

Feel free to fork, adapt, or use these as a template for your own labs/portfolio projects.

Last updated: January 2026
