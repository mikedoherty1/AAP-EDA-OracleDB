# Ansible Automation Platform 

> ### Hands on build,  basic playbooks and builtin modules: To create VirtualBox VM's, configure Linux, Setup Oracle Database
> 
> ### \*Not meant to be efficient, basic playbooks for learning the how's / breakit and fixit.
> 
> ### Just some simple cmds and playbooks
> 
> Youtube video ( just copy paste of cmds below) extra items on breakfix and github integration

### VirtualBox

### Linux setup (RHEL & OEL)

### Setup and start Oracle DB (OEL)

## Integrate EDA for Oracle - In Progress

---

## My Setup / Whats Required:

## **Mac**: Create new user ansible "THERE ARE SOME HARDCODED PATHS"  - Section below what's hardcoded

### My setup (naming included)

MacBook Pro

1.  created new user **ansible** with admin priv, password = redhat (this password is used for practically everything) HomeLab easy
2.  enabled ssh ( System Settings > General > Remote Login > Click to enable and add **ansible** (mac user)
3.  Log into **ansible** for the remainder of operations
4.  Add passwordless sudo access to ansible
    1.  sudo dscl . -append /groups/wheel GroupMembership ansible
    2.  sudo vi /etc/sudoers 
        1.  add > ansible ALL = (ALL) ALL

---

## Whats Required:

1.  VirtualBox & Extension Pack found here: [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads) 
2.  RedHat 9.4 found here:  [https://access.redhat.com/downloads/content/rhel](https://access.redhat.com/downloads/content/rhel) > get Red Hat Enterprise Linux 9.4 Boot ISO 
3.  OracleLinux 7.8 found here: [https://yum.oracle.com/oracle-linux-isos.html](https://yum.oracle.com/oracle-linux-isos.html) > get OracleLinux-R7-U8-Server-x86\_64-dvd.iso

> 1.  `**Ansible & Oracle software will be automatically downloaded and deployed within execution of templates in AAP**`

> ```xml
> RedHat Account:  (Free)
> https://access.redhat.com 
> This will be used for OS and AAP
> VirtualBox install & Extension Pack (Install from VirtualBox gui, click three lines > Extensions > install
> Newtorking - Host-only Networks > Create > Name = HostNetwork
> Mask: 255.255.255.0 ; Lower Bound: 192.168.56.100 ; Upper Bound: 192.168.56.199
> ** Used on nic2
> Tools > Media > Optical disks > Add > select ISO's from Downloads
> ```

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

> ```html
> VirtualBox to create AAP server
> Machine > New
> Host Name: ansiblecontrol
> ISO Image: rhel-9.4-x86_64-boot.iso
> Type: Linux
> Version: Red Hat 9.x (64-bit)
> click > skip Unattended Installation
> Hardware: 
>      Base Memory = 8192
>      Processors = 4
> Hard Drive:
>      40GB
> Finish
> settings > Network > Adapter 2 > Enable Network Adaprter > Host-Only Network > OK
> Start
> ```

```html
- Install Red Hat Enterprise Linux 9.4
    - English > Continue
    - Security Profile > disable > Done
    - NETWORK & HOSTNAME > enable both adapters
            Use the 2nd interface IP 192.168.56.XXX - add this to mac /etc/hosts file
        Host Name:  ansiblecontrol > Apply > Done
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

**\*\* Reboot AAP server from intial install**

---

# AAP Setup - FYI: all passwords set to redhat for OS and AAP

> ssh [root@ansiblecontrol](mailto:root@control.local)
> 
> pwd to verify /root directory
> 
> Setup pre-reqs for ansible automation install
> 
> ```html
> dnf install git -y
> ```
> 
> 1.  git clone https://github.com/mikedoherty1/AnsibleAutomationPlatform-OracleDB.git
> 
>      Setup script to build / Install everything
> 
> 1.  `cd **AnsibleAutomationPlatform-OracleDB**`

# Two options on install

<table><tbody><tr><td>User ansible owns install</td><td>User root owns install</td></tr><tr><td>./ansible_owns_ansible.sh</td><td>./root_owns_ansible.sh</td></tr></tbody></table>

# Ansible Time

```
- from web broweser (chrome or firefox): https://ansiblecontrol
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

# Execution Environments (not required just something to do)

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

# Inventories (3)

*   From the left side under Resources: click Inventories > add
    *   name: HomeLab (Will be used for all Linux servers)
    *   Organization: HomeLab
*   save
*   From the left side under Resources: click Inventories > add
    *   name: MAC
    *   Organization: HomeLab
    *   To supress warning  > Add Variable > ansible\_python\_interpreter: auto\_silent
*   save

# Hosts (2)

*   From the left side under Resources: click Inventories > add
    *   name: `ansiblecontrol`
    *   Inventory: HomeLab
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

# Templates - Testing Connectivity

*   From the left side under Resources: click Templates >  edit > [**Demo Job Template**](https://control.local/#/templates/job_template/7)
    *   name: Test Connect
    *   Inventory: remove and click prompt
    *   Project: Demo Project
    *   Execution Environment: RHEL9
    *   Credentials: remove and click prompt
    *   Limit: click prompt
*   save
*   Launch

Run against all Inventories ....

To supress warning > edit > Add Variable > ansible\_python\_interpreter: auto\_silent 

\> save > launch

---

# Validation Complete

---

# Create project to add Basic Root Operations - Git Branch VirtualBox

*   From the left side under Resources: click Projects > add
    *   name: Basic Root Operations
    *   Organization: HomeLab
    *   Execution Environment: RHEL9
    *   Source Control Type: Git
    *   Source Control URL: `https://github.com/mikedoherty1/AnsibleAutomationPlatform-OracleDB.git`
    *   Source Control Branch/Tag/Commit: VirtualBox
*   All project will be created in /var/lib/awx/projects \*\*\*\*\*\*

# Create project to add OraBuild Git Branch

*   From the left side under Resources: click Projects > add
    *   name: Oracle Operations
    *   Organization: HomeLab
    *   Execution Environment: RHEL9
    *   Source Control Type: Git
    *   Source Control URL: `https://github.com/mikedoherty1/AnsibleAutomationPlatform-OracleDB.git`
    *   Source Control Branch/Tag/Commit: OraBuild
    *   Options: Clean

# Create Templates

> ```
> Templates
> - Name: asMac Create VM
> - Inventory: MAC
> - Project: Basic Root Operations
> - Execution Environment: RHEL9
>     - Playbook: CreateVirtualBoxVM.yml
>      - Credentials: MacAdmin
>      - Variables: 
> #There are 4 variable 
> #[vbvm | mem | ds | ostv ] this will fail if any are not provided
> #Virtual machine name
> vbvm:
> #Memory in MB i.e 8GB = 8192 * values used for Oracle build
> mem:
> #Disk space in MB 20GB = 40960 
> ds:
> #[OracleLinux-R7-U8-Server-x86_64-dvd.iso |  rhel-9.4-x86_64-boot.iso ]
> ostv:
>      Click > prompt on launch
>   - save
> ```

```
Templates
- Name: 01 Add Host & Passwordless SSH Access 
- Inventory: AAP
- Project: Basic Root Operations
- Execution Environment: RHEL9
     - Playbook: PasswordlessSSH4-AAP.yml
     - Credentials: RootAdmin
          - Variables:
# This adds entries in /etc/hosts file
#Target server you want to add  (USING LIMIT as SOURCE) IP 192.168.56.xxx
vbvmip: 192.168.56.xxx
#Virtual hostname
vbvm:
# Using aap_serv as Seperate Viarable to AAP Server to copy files
aap_serv: ansiblecontrol
Click > Limit
  - save
```

NOTE: After executing Template `asMac Create VM * you need to add New server to Hosts and add to` [**HomeLab**](https://ansiblecontrol/#/inventories/inventory/2/details) **Inventory**

```
- Name: 02 Mac Mount VirtualBox CD
- Inventory: MAC
- Project: Basic Root Operations
- Execution Environment: RHEL9
    - Playbook: VirtualBox_MacMount.yml
     - Credentials: MacAdmin
          - Variables: 
# Add fully qualified hostname - Server you want to mount ISO to 
vbvm:
  Click > prompt on launch
  - save
  
```

```


- Name: 03 Install GuestAddons DNF
- Inventory: HomeLab
- Project: Basic Root Operations
- Execution Environment: RHEL9
    - Playbook: VBox_GuestAddons_DNF.yml
     - Credentials: RootAdmin
  Click > Limit
  - save
```

```
Add Mac host information

- Name: 04 Install GuestAddons YUM
- Inventory: HomeLab
- Project: Basic Root Operations
- Execution Environment: RHEL9
    - Playbook: VBox_GuestAddons_YUM.yml
     - Credentials: RootAdmin
  Click > Limit
  - save
```

```
- Name: 05 Mac Un-Mount VirtualBox CD
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

## Add New host to inventory HomeLab

---

## Go Back to oel78 install and click reboot.

---

---

## Create Workflow to install all Basic root patches (RHEL or OEL)

# template workflow

```


- Templates > Add > Workflow Template
- Name: 00 Update Linux Hosts
- Organization: HomeLab
- Inventory: HomeLab
- Limit: check prompt on Launch
- Variables:  - check prompt on Launch
#Virtual VM Name
vbvm:
    
Save
start
Node Type:
Approval 
Name: VirtualBox and packages 
Save
   
VirtualBox and packages + On Sucess > 04 Mac Mount VirtualBox CD + On Sucess > 05 Install GuestAddons DNF + On Sucess > 07 Mac Un-Mount VirtualBox CD
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

# Oracle Time

---

# Create Templates  - **Oracle Operations**

```
Templates
- Launch
 01 Add Host & Passwordless SSH Access 
- Inventory: HomeLab
- Credentials: RootAdmin
          - Variables:
# This adds entries in /etc/hosts file
#Target server you want to add  (USING LIMIT as SOURCE) IP 192.168.56.xxx
vbvmip: 192.168.56.XXX
#Virtual hostname
vbvm: oraserv01.local
# Using aap_serv as Seperate Viarable to AAP Server to copy files
aap_serv: control.local
Limit: control.local
```

```
- Name: 08 Oracle Root OS
- Inventory: HomeLab
- Project: Oracle Operations
- Execution Environment: RHEL9
    - Playbook: Oracle_Root.yml
     - Credentials: RootAdmin
     - Variables: check prompt on Launch
    # Creating oracle user, set oracle password
    opass: oracle
    
     - Limit: prompt on launch
  - save
  - launch
```

```
- Name: 09 Get Oracle Binaries
- Inventory: AAP
- Project: Oracle Operations
- Execution Environment: RHEL9
    - Playbook: copy_hack.yml
     - Credentials: RootAdmin
- Variables:  - check prompt on Launch
#Virtual VM Name
vbvm:
    
  - save
  - launch
```

```
- Name: 10 asOracle Setup Binaries
- Inventory: HomeLab
- Project: Oracle Operations
- Execution Environment: RHEL9
    - Playbook: asOracle.yml
     - Credentials: OracleAdmin
- Variables:  - check prompt on Launch
#Virtual VM Name
vbvm:
    
  - Limit: prompt on launch
  - save
  - launch
```

```
- Name: 11 asOracle start DB and listener
- Inventory: HomeLab
- Project: Oracle Operations
- Execution Environment: RHEL9
    - Playbook: asOracle_Start_listener_DB.yml
     - Credentials: OracleAdmin
- Limit: prompt on launch
  - save
  - launch
```

---

# Next: EDA To monitor Oracle and automate corrective actions

```
Step 1:
Launch Template - 01 Add Host & Passwordless SSH Access 
Add Variables and Launch

Step 2 - Create Templates
- Name: Setup EDA Server 
- Inventory: HomeLab
- Project: Basic Root Operations
- Execution Environment: RHEL9
    - Playbook: SetupEDAServer.yml
     - Credentials: RootAdmin
     - Variables: 
aap_serv: ansiblecontrol
aap_ip: 192.168.56.22
inventory_ip: 192.168.56.23
     Click > prompt on launch
- Limit: prompt on launch
  - save
  
  * When executing limit to eventsansible
```

```
Step 2 - Create Templates
- Name: Install EDA 
- Inventory: HomeLab
- Project: Basic Root Operations
- Execution Environment: RHEL9
    - Playbook: SetupEDAServer.yml
     - Credentials: RootAdmin
  - save
  
 Launch > Then do below 
  
  ** This does not execute setup.sh as it always fails with no errors, stalls, will need to run setup.sh from ansiblecontrol server
```