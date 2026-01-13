# 10 - Active Directory Certificate Services (AD CS)

Goal: Install and configure an Enterprise Root CA on DC01, duplicate templates, and set up basic auto-enrollment via GPO.

## Step-by-Step

1. **Install AD CS Role**
   - Server Manager → Manage → Add Roles and Features
   - Role-based → Next → select server → Next
   - Server Roles → check **Active Directory Certificate Services** → Add Features
   - Role Services → check **Certification Authority** (add Web Enrollment for browser access if wanted)
   - Next → Install

2. **Configure the CA**
   - After install → yellow flag → **Configure Active Directory Certificate Services**
   - Credentials: use Domain Admin → Next
   - Role Services: Certification Authority → Next
   - Setup Type: **Enterprise CA** → Next
   - CA Type: **Root CA** (single-server lab) → Next
   - Private Key: **Create a new private key** → Next (use defaults: RSA 2048/4096, SHA256)
   - CA Name: accept default (e.g. homelab-DC01-CA) → Next
   - Validity Period: 5–10 years (lab) → Next
   - Database locations: defaults → Next → Configure → wait → Close

3. **Duplicate & Publish a Computer Template**
   - Tools → **Certificate Templates** (certtmpl.msc)
   - Right-click **Computer** → **Duplicate Template**
   - Compatibility: Windows Server 2016 / Windows 10 → Next
   - General tab: Name **LabComputerCert** → OK
   - Security tab: Add **Domain Computers** → give **Read**, **Enroll**, **Autoenroll** permissions
   - Extensions tab: ensure **Client Authentication** is included
   - OK to save
   - In certsrv.msc → right-click **Certificate Templates** → **New** → **Certificate Template to Issue** → select **LabComputerCert** → OK

4. **Create GPO for Auto-Enrollment**
   - Group Policy Management (gpmc.msc)
   - Right-click domain (homelab.int) → **Create a GPO...** → Name: **Cert Auto-Enrollment**
   - Right-click GPO → **Edit**
   - Computer Configuration → Policies → Windows Settings → Security Settings → Public Key Policies
   - Double-click **Certificate Services Client - Auto-Enrollment**
   - Configuration Model: **Enabled**
   - Check both boxes (renew/update)
   - OK → close editor

5. **Apply & Test**
   - On WIN11-01 → CMD as admin → `gpupdate /force`
   - Wait 1–5 min or reboot
   - Run `certutil -pulse` to trigger
   - Open `certmgr.msc` → Personal → Certificates → look for a computer certificate issued by your CA (to WIN11-01$)

**Common Issues & Fixes**
- Templates not visible → run `certutil -installdefaulttemplates` → restart certtmpl.msc
- No cert after gpupdate → ensure GPO linked to domain, client rebooted, and template published

Next: [11-troubleshooting.md](11-troubleshooting.md)
