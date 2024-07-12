---

# Ansible Automation Platform (GUI)- Built from MacBook

### VirtualBox VM creation

### Linux setup (RHEL & OEL)

### Setup and start Oracle DB (OEL)

## Integrate EDA for Oracle - Part Deaux

> ### This is not a hands off build, how to build automation with some basic playbooks and builtin modules:
> 
> ### shell:copy:inline edit:Linux packages:add users:add hosts:projects:templates:GIT:Database etc.....
> 
> ### \*Not meant to be efficient, steps are purposeful individualized for build practice. (GUI stuff)
> 
> ### simple scripting and simple cmds

---

## My Setup / Whats Required:

Mac: Create new user ansible "THERE ARE SOME HARDCODED PATHS"  - Section below what's hardcoded

### My setup (naming included)

MacBook Pro

1.  created new user **ansible** with admin priv, password = redhat (this password is used for practically everything) HomeLab easy
2.  enabled ssh ( System Settings > General > Remote Login > Click to enable and add **ansible** (mac user)
3.  Log into **ansible** for the remainder of operations
4.  Add passwordless sudo access to ansible
    1.  sudo dscl . -append /groups/wheel GroupMembership ansible

---

## Whats Required:

1.  VirtualBox
2.  VirtualBox Extension Pack
3.  RedHat 9.4 found here:  [https://access.redhat.com/downloads/content/rhel](https://access.redhat.com/downloads/content/rhel ) \> get Red Hat Enterprise Linux 9.4 Boot ISO 
4.  OracleLinux 7.8 found here: [https://yum.oracle.com/oracle-linux-isos.html](https://yum.oracle.com/oracle-linux-isos.html ) \> get OracleLinux-R7-U8-Server-x86\_64-dvd.iso

> 1.  `**Ansible & Oracle software will be automatically downloaded and deployed within execution of templates in AAP**`

> easier when adding ISO as variable in template
> 
> ln -s /Users/ansible/Downloads/OracleLinux-R7-U8-Server-x86\_64-dvd.iso /Users/ansible/Downloads/oel78  
> ln -s /Users/ansible/Downloads/rhel-9.4-x86\_64-boot.iso /Users/ansible/Downloads/rhel94

RedHat Account:  (Free)

*   [https://access.redhat.com](https://access.redhat.com) 
    *   This will be used for OS and AAP

After VirtualBox install & Extension Pack (Install from VirtualBox gui, click three lines > Extensions > install

Newtorking - Host-only Networks > Create > Name = HostNetwork

*   Mask: 255.255.255.0 ; Lower Bound: 192.168.56.100 ; Upper Bound: 192.168.56.199
    *   \*\* Used on nic2

Tools > Media > Optical disks > Add > select ISO's from Downloads

\*\* Make sure you have enough space / RAM as each VM will be 30TB w/8GB RAM

---

**Hard Coded**

**VirtualBox Host-only Networks  Name = HostNetwork**

**HARDCODED PATHS**

/Users/ansible/VirtualBox\\ VMs/  
/usr/local/bin/VBoxManage  
/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso  
/Users/ansible/Downloads

**Coresponding playbooks found in branch ( VirtualBox )**

VirtualBox\_MacMount.yml  
VirtualBox\_Mac\_UnMount.yml  
CreateVirtualBoxVM.yml

---

### First VM setup Manual - all others are done via Ansible

> VirtualBox to create AAP server
> 
> Machine > New
> 
> Host Name: control.local
> 
> ISO Image: rhel-9.4-x86\_64-boot.iso
> 
> Type: Linux
> 
> Version: Red Hat 9.x (64-bit)
> 
> click > skip Unattended Installation
> 
> Hardware: 
> 
>      Base Memory = 8192
> 
>      Processors = 4
> 
> Hard Drive:
> 
>      40GB
> 
> Finish
> 
> settings > Network > Adapter 2 > Enable Network Adaprter > Host-Only Network > OK
> 
> Start

```
- Install Red Hat Enterprise Linux 9.4
    - English > Continue
    - Security Profile > disable > Done
    - NETWORK & HOSTNAME > enable both adapters
            Use the 2nd interface IP 192.168.56.XXX - add this to mac /etc/hosts file
        Host Name:  control.local > Apply > Done
    - KDUMP > Disable > Done
    - Installation Destination > Done 
    - Connect to Red Hat > 
        username
        password > Register > Done
    - Software Selection:
        Minimal Install > Select Standard > Done
    - Root Password
        Root Password = redhat
        Confirm = redhat > Done
    
    Begin Install
```

---

> While AAP server is being installed
> 
> From Mac > Terminal
> 
> hostname
> 
> ifconfig | grep inet (use 192.x.x.x or 10.0.0.x)
> 
> Add > IP    hostname  > etc/hosts
> 
> example: 
> 
> ###### \# Host Database
> 
> ###### \# localhost is used to configure the loopback interface
> 
> ###### \# when the system is booting.  Do not change this entry.
> 
> ###### 127.0.0.1 localhost
> 
> ###### 255.255.255.255 broadcasthost
> 
> ###### ::1             localhost
> 
> ###### 192.168.56.101    control.local
> 
> ###### 10.0.0.54     Mikes-MacBook-Pro.local

**\*\* Reboot AAP server from intial install**

---

# AAP Setup

> FYI: all passwords set to redhat for OS and AAP
> 
> ssh [root@control.local](mailto:root@control.local)  
> 
> pwd to verify /root directory
> 
> Setup pre-reqs for ansible automation install
> 
> 1.  `**dnf install git -y**`
> 2.  `**git clone**` `**https://github.com/mikedoherty1/AAP-EDA-OracleDB.git**`
> 
>      Setup script to build / Install everything
> 
> 1.  `**cd AAP-EDA-OracleDB**`
> 2.   `**./start.sh**`
> 
>    A couple read in prompts (copy and paste) , a couple hit returns and a type yes ......
> 
> Ansible Automation is Complete
> 
> \*\*\* Verify both hosts are in /etc/hosts 

# Ansible Time

```
- from web broweser (chrome or firefox): https://control.local
```

Proceed to your\_ip\_adress (unsafe)

```
Login: admin
Password: redhat

click username/password
put in your RedHat subscription and click: Get Subscription

Select your Subscription; then click next to finsih. All done you know have AAP running
```

---

# Validate its all working

# Execution Environments

*   From the left side under Administration: click Execution Environments > copy Default execution environment
    *   edit your copy
    *   change name: RHEL9
    *   edit image change
    *   from: registry.redhat.io/ansible-automation-platform-24/ee-supported-rhel8:latest
    *   to: registry.redhat.io/ansible-automation-platform-24/ee-supported-rhel9:latest
*   Pull: Only pull if not present
*   save

---

# Organizations

*   From the left side under Access: click Organizations > add
    *   name: HomeLab
    *   Execution Environment: RHEL9
*   save

---

# Users - (3)

*   From the left side under Access: click Users > add
    *   first name: HomeLabRoot
    *   username: root
    *   password: redhat
    *   User Type: System Adminstrator
    *   Organization: HomeLab
*   save
*   From the left side under Access: click Users > add
    *   first name: HomeLabMc
    *   username: ansible
    *   password: redhat
    *   User Type: System Adminstrator
    *   Organization: HomeLab
*   save
*   From the left side under Access: click Users > add
    *   first name: OraAdmin
    *   username: oracle
    *   password: oracle
    *   User Type: System Adminstrator
    *   Organization: HomeLab
*   save

# Inventories (3)

*   From the left side under Resources: click Inventories > add
    *   name: AAP
    *   Organization: HomeLab
*   save
*   From the left side under Resources: click Inventories > add
    *   name: MAC
    *   Organization: HomeLab
*   save
*   From the left side under Resources: click Inventories > add
    *   name: HomeLab (Will be used for all Linux servers)
    *   Organization: HomeLab
*   save

# Hosts (2)

*   From the left side under Resources: click Inventories > add
    *   name: control.local
    *   Inventory: AAP
*   save
*   From the left side under Resources: click Inventories > add
    *   name: whatevery\_your\_mac\_hostname
    *   Inventory: MAC
*   save

# Credentials (3)

*   From the left side under Resources: click Credentials > add
    *   name: RootAdmin
    *   Organization: HomeLab
    *   Credential Type: Machine
    *   username: root
    *   password: redhat
*   save
*   From the left side under Resources: click Credentials > add
    *   name: MacAdmin
    *   Organization: HomeLab
    *   Credential Type: Machine
    *   username: ansible
    *   password: redhat
    *   Privilege Escalation Method: sudo
    *   Privilege Escalation Password: redhat
*   save
*   From the left side under Resources: click Credentials > add
    *   name: OracleAdmin
    *   Organization: HomeLab
    *   Credential Type: Machine
    *   username: oracle
    *   password: oracle
    *   Privilege Escalation Method: sudo
    *   Privilege Escalation Password: oracle
*   save

# Projects

*   From the left side under Resources: click Projects > copy > then edit
    *   name: Hello
    *   Organization: HomeLab
    *   Execution Environment: RHEL9
*   save
*   sync

# Templates (2)

*   From the left side under Resources: click Templates > copy > hello > edit
    *   name: 9 Hello Linux
    *   Inventory: AAP
    *   Project: Hello
    *   Execution Environment: RHEL9
    *   Credentials: RootAdmin
*   save
*   Launch
*   From the left side under Resources: click Templates > copy > hello > edit
    *   name: 9 Hello Mac
    *   Inventory: MAC
    *   Project: Hello
    *   Execution Environment: RHEL9
    *   Credentials: MacAdmin
*   save
*   Launch

---

# Validation Complete

---

# Create project to add Basic Root Operations - Git Branch VirtualBox

*   From the left side under Resources: click Projects > add
    *   name: Basic Root Operations
    *   Organization: HomeLab
    *   Execution Environment: RHEL9
    *   Source Control Type: Git
    *   Source Control URL: https://github.com/mikedoherty1/AAP-EDA-OracleDB.git
    *   Source Control Branch/Tag/Commit: VirtualBox
    *   Options: Clean
*   All project will be created in /var/lib/awx/projects \*\*\*\*\*\*

# Create project to add OraBuild Git Branch

*   From the left side under Resources: click Projects > add
    *   name: Oracle Operations
    *   Organization: HomeLab
    *   Execution Environment: RHEL9
    *   Source Control Type: Git
    *   Source Control URL: https://github.com/mikedoherty1/AAP-EDA-OracleDB.git
    *   Source Control Branch/Tag/Commit: OraBuild
    *   Options: Clean

# Create Templates

> ```
> Templates
> - Name: 01 asMac Create VM
> - Inventory: MAC
> - Project: Basic Root Operations
> - Execution Environment: RHEL9
>     - Playbook: CreateVirtualBoxVM.yml
>      - Credentials: MacAdmin
>      - Variables: 
> #There are 4 variable 
> #[vbvm | mem | ds | ostv ] this will fail if any are not provided
> 
> #Virtual machine name
> vbvm:
> #Memory in MB i.e 8GB = 8192 * values used for Oracle build
> mem:
> #Disk space in MB 20GB = 40960 
> ds:
> #Add OS iso [rhel94, oel78] or
> #[OracleLinux-R7-U8-Server-x86_64-dvd.iso |  rhel-9.4-x86_64-boot.iso ]
> ostv:
>      Click > prompt on launch
>   - save
> ```

```
Templates
- Name: 02 Add VM 2 AAP Server
- Inventory: AAP
- Project: Basic Root Operations
- Execution Environment: RHEL9
     - Playbook: AddToHostsFile.yml
     - Credentials: RootAdmin
          - Variables:
# This adds entries in AAP servers /etc/hosts file
#Virtual Image IP 192.168.xxx.xxx
vbvmip:
#Virtual hostname
vbvm:
    Click >  prompt on launch
  - save
```

```
- Name: 03 SSH Auth Key
- Inventory: AAP
- Project: Basic Root Operations
- Execution Environment: RHEL9
    - Playbook: SetSSHAuth.yml
     - Credentials: RootAdmin
          - Variables: 
# Add fully qualified hostname
vbvm:
  Click > prompt on launch
  - save
```

```
- Name: 04 Mac Mount VirtualBox CD
- Inventory: MAC
- Project: Basic Root Operations
- Execution Environment: RHEL9
    - Playbook: VirtualBox_MacMount.yml
     - Credentials: MacAdmin
          - Variables: 
# Add fully qualified hostname
vbvm:
  Click > prompt on launch
  - save
  
```

---

```


- Name: 05 Install GuestAddons DNF
- Inventory: HomeLab
- Project: Basic Root Operations
- Execution Environment: RHEL9
    - Playbook: VBox_GuestAddons_dnf.yml
     - Credentials: RootAdmin
          - Variables: 
# Add fully qualified hostname
vbvm:
  Click > prompt on launch
  Click > Limit
  - save
```

```
Add Mac host information

- Name: 06 Install GuestAddons YUM
- Inventory: HomeLab
- Project: Basic Root Operations
- Execution Environment: RHEL9
    - Playbook: VBox_GuestAddons_oel78.yml
     - Credentials: RootAdmin
          - Variables: 
# Add fully qualified hostname
vbvm:
  Click > prompt on launch
  Click > Limit
  - save
```

```
- Name: 07 Mac Un-Mount VirtualBox CD
- Inventory: MAC
- Project: Basic Root Operations
- Execution Environment: RHEL9
    - Playbook: VirtualBox_Mac_UnMount.yml
     - Credentials: MacAdmin
          - Variables: 
# Add fully qualified hostname
vbvm:
  Click > prompt on launch
  - save
```

---

# Create Oracle Server

---

Template > Launch > `01 asMac Create VM`

> #There are 4 variable   
> #\[vbvm | mem | ds | ostv \] this will fail if any are not provided
> 
> #Virtual machine name  
> vbvm: oraserv01.local  
> #Memory in MB i.e 8GB = 8192  
> mem: 8192  
> #Disk space in MB 20GB = 20480  
> ds: 40960  
> #Add OS iso \[rhel94, oel78\] or  
> #\[OracleLinux-R7-U8-Server-x86\_64-dvd.iso |  rhel-9.4-x86\_64-boot.iso \]  
> ostv: oel78 

### First Boot is manual selection of software

```
- Install Oracle Linux 7.8
    - English > Continue
        - Installation Destination > Done 
        - Security Profile > disable > Done
        - NETWORK & HOSTNAME 
             - ethernet > On
                 - Configure
                     - Link Negotiation > Automatic
                     - General > Click Automatically connect to this network when available
             - Repeat for ethernet 2 
                         *** Note IP used on NIC2 as you can add to AAP while server is being built
                Host Name:  oraserv01.local > Apply > Done
    - KDUMP > Disable > Done
   
    
      Begin Install
    
    - Root Password
        Root Password = redhat
        Confirm = redhat > Done
```

---

## Launch template `02 Add VM 2 AAP Server`

> #Virtual Image IP 192.168.xxx.xxx  
> vbvmip: 192.168.65.103  
> #Virtual hostname  
> vbvm: oraserv01.local
> 
> ## Next > Launch

---

> # **Need To add new VM to AAP Hosts**
> 
> ### From the left side under Resources: click Inventories > add
> 
> ### name: control.local
> 
> ### Inventory: HomeLab
> 
> \*\* If not already you can add the following
> 
> Inventory > Add > Hosts
> 
> Add all missing Linux servers. 

## Go Back to oel78 install and click reboot.

---

# **Enable ssh - template**

> ### template `03 SSH Auth Key`
> 
> Launch
> 
> \# Add fully qualified hostname  
> vbvm: oraserv01.local
> 
> Next
> 
> Launch

---

## Create Workflow to install all Basic root patches (RHEL or OEL)

# template workflow

```
- Templates > Add > Workflow Template
- Name: Update Linux Hosts
- Organization: HomeLab
- Inventory: HomeLab
- Limit: check prompt on Launch
- Variables:  - check prompt on Launch
#Virtual VM Name
vbvm:
    
Save
start
04 Mac Mount VirtualBox CD Next > Save
                                + On Sucess > 05 Install GuestAddons DNF + On Sucess > 07 Mac Un-Mount VirtualBox CD
                                                                         + On Failure > 06 Install GuestAddons YUM + On Sucess > 07 Mac Un-Mount VirtualBox CD
Save
Launch
Limit = oraserv01.local

Variable:
#Virtual VM Name
vbvm: oraserv01.local

Next
Launch
```

# Create project to add Oracle

*   \\

copy GuestAddons > edit  
Name: **OraDB**  
Source Control Branch/Tag/Commit: **OraBuild**  
Save

### Add Template:

\- Name: **AddHost4Copy**  
\- Inventory: AAP  
\- Project: OraDB  
\- Execution Environment: RHEL9  
    - Playbook: AddDBHost\_Inventory.yml  
     - Credentials: RootAdmin  
  - save  
  - Launch  
          - Enter Variables  
              vbname: \<name\_of\_VBoxVM>

---

# Create Templates from Project OraDB

```
- Name: Oracle Root OS
- Inventory: HomeLab
- Project: OraDB
- Execution Environment: RHEL9
    - Playbook: Oracle_Root.yml
     - Credentials: RootAdmin
     - Variables: check prompt on Launch
        Add: opass:
     - Limit: prompt on launch
  - save
  - launch
```

---

# Create Oracle Admin user & Credential

# EDA Server Build

*   \\
*   \\

# EDA to execute tasks for OracleDB