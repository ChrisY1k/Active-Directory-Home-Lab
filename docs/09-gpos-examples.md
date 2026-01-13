# 09 - Group Policy Objects (GPOs) Examples

Goal: Create and apply basic Group Policies to enforce settings across the domain, such as desktop restrictions or startup behavior.

## Step-by-Step

1. **Open Group Policy Management**
   - On DC01 → Tools → **Group Policy Management** (gpmc.msc)

2. **Create a New GPO**
   - Expand Forest → Domains → homelab.int
   - Right-click the domain name (homelab.int) → **Create a GPO in this domain, and Link it here...**
   - Name: **Standard User Settings** (or any descriptive name)
   - Click **OK**

3. **Edit the GPO**
   - Right-click the new GPO → **Edit**
   - In Group Policy Management Editor:
     - **Computer Configuration** → **Policies** → **Administrative Templates** → **System** → **Logon**
       - Double-click **Always wait for the network at computer startup and logon** → Enabled → OK
     - **User Configuration** → **Policies** → **Administrative Templates** → **Desktop**
       - Double-click **Hide and disable all items on the desktop** → Enabled → OK (demo only – fun to test)

4. **Link & Apply the GPO**
   - Close the editor
   - The GPO is already linked to the domain (applies to all users/computers unless filtered)
   - On WIN11-01 client → open CMD as admin → run:
gpupdate /force
text- Log out/in or reboot client to see changes

5. **Verify**
- On client → log in as domain user → desktop should be empty (if you enabled hide items)
- Run `gpresult /r` → confirm your GPO appears under "Applied Group Policy Objects"

**Common Issues & Fixes**
- GPO not applying → run `gpupdate /force` on client, check Event Viewer (Group Policy log) for errors
- Wrong scope → ensure GPO is linked to domain or correct OU
- Test on OU first → link GPO to Employees OU instead of domain for safer testing

Next: [10-ad-certificate-services.md](10-ad-certificate-services.md)
