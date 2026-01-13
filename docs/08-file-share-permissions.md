# 08 - File Share Permissions & Access Control

Goal: Create a shared folder on the DC with group-based permissions so HR-FullAccess users can read/write, HR-ReadOnly users can only read, and others are denied access.

## Step-by-Step

1. **Create the Shared Folder on DC01**
   - Open File Explorer → go to C:\ → create folder **Shares** (optional parent)
   - Inside Shares → create **HRDocs**
   - Right-click **HRDocs** → **Properties** → **Sharing** tab → **Advanced Sharing**
   - Check **Share this folder**
   - Share name: **HRDocs**
   - Permissions → Remove **Everyone** → Add:
     - **HR-FullAccess** → Full Control
     - **HR-ReadOnly** → Read
   - Click **OK** → **Apply** → **Close**

2. **Set NTFS Permissions (More Granular Control)**
   - In HRDocs Properties → **Security** tab → **Advanced**
   - Disable inheritance → **Convert inherited permissions** (or Remove if you want clean slate)
   - Add permissions:
     - **HR-FullAccess** → Modify (or Full control), Applies to: This folder, subfolders and files
     - **HR-ReadOnly** → Read & execute, Applies to: This folder, subfolders and files
     - **SYSTEM** and **Administrators** → Full control (keep these)
   - Click **OK** → **Apply** → **Close**

3. **Test Access from Client (WIN11-01)**
   - Log in as a user in **HR-FullAccess** group (e.g. jlee)
   - Open File Explorer → type `\\DC01\HRDocs` (or `\\192.168.56.10\HRDocs`)
   - Create a test file (right-click → New → Text Document) → open and type something → save
   - Log out → log in as a **HR-ReadOnly** user
   - Try to open the share → should see files, but cannot edit/delete/create
   - Log in as a non-HR user (e.g. user001 not in either group) → should get "Access Denied"

**Common Issues & Fixes**
- "Access Denied" even for FullAccess → check both Share permissions **and** NTFS (both must allow)
- Share not visible → run `ipconfig /flushdns` on client, or use IP address `\\192.168.56.10\HRDocs`
- Permissions not applying → force GPO update on client: `gpupdate /force`

Next: [09-gpos-examples.md](09-gpos-examples.md)
