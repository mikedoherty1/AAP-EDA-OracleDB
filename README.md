# Purpose - Step by Step Ansible Automation Platform 

### To install (AAP)(EDA)(Oracle) , To Configure AAP (), and To Build (Oracle)

> ### This is not a hands off build, this is a step by step on how to build automation
> 
> ###      \*Not meant to be efficient, steps are purposeful individualized for build practice.
> 
> ###      Allot if items are hard coded (MAYBE FIXED) , was not meant to be awesome scripting just simple cmds

---

### My exact setup (naming included)

*   MacBook Pro, created new user ansible with admin priv, password = redhat, enabled ssh.
*   all software was installed in ansible account (VirtualBox) https://www.virtualbox.org
*   Installed latest Oracle VM VirtualBox Extension Pack
*   Newtorking - Host-only Networks on Adapter 2 \* Important as hard coded VboxManage to search IP here
    *   Mask: 255.255.255.0 ; Lower Bound: 192.168.56.100 ; Upper Bound: 192.168.56.199

*   Linux Software Used  
    RedHat 9.4 found here:  https://access.redhat.com/downloads/content/rhel > get Red Hat Enterprise Linux 9.4 Boot ISO 
    *   Used for AAP,EDA
*   OracleLinux 7.8 found here: https://yum.oracle.com/oracle-linux-isos.html > get OracleLinux-R7-U8-Server-x86\_64-dvd.iso
    *   Used for database builds  
          
         
*   Configure AAP Control :
    *   8192 MB RAM
    *   40 GB Disk space
    *   Networking \* Host-only Network on Adapter 2
        *   This will be hard coded when finding Linux host ip's via VirtualBox for dynamic ansible Inventory
*   all other nodes I used default minimums

# Screen shots of build can be found in: Ansible\_Control\_Server\_Build.md

```
- Start OS install
    - RHEL9.4 (used for AAP) Host Name: **control.local**
    - enable Network Adapter 2
    	Use  Host-only Networks   
    - all passwords set = redhat
    - root user: Allow root SSH login with password
- Connect to RedHat
  - If you do not already, signup for personal account ** REQUIRED
    - These credentials will be used when installing Automation Platform
- Software Selection:
  - Minimal Install > Select Standard
        - Begin Install
```

\--  
Login into newly built rhel9.4 server: **control.local**

*   local mac terminal ssh root@control.local \* can get ip from linux console > ifconfig |grep 192
*   \*\* Recommend adding control.local to mac /etc/hosts file \*\*
*   all operations done as root user

```
    mkdir -p /root/git
```

*   Install git

```
    dnf install git -y
```

*   Change to directory for git clone

```
    cd /root/git
```

*   Pull environemnt cmds for setup

```
git clone https://github.com/mikedoherty1/AAP-EDA-OracleDB.git
```

*   cd into directory

```
cd AAP-EDA-OracleDB
```

*   Execute step0.sh  
    \-- This will prompt for read in variables and configure, install and download software
    *   ./step0.sh
        *   This will ask a couple questions and setup the necessary settings to install ansible platform
        *   \\
            *   When asked about key and phrases just hit return
            *   when validating passwordless ssh, type yes when propmted, then type exit to go back to original session
*   Install Ansible./s
    *   ./step1.sh

# ansible time

# Step 1

```
- from web broweser: https://control.local
```

Proceed to your\_ip\_adress (unsafe)

```
Login: admin
Password: redhat
```

# Step 2

\--  
click username/password  
put in your RedHat subscription and click: Get Subscription

# Step 3

\--  
Select your Subscription; then click next to finsih. All done you know have AAP running

# Validate its all working

# Step 1 - Execution Environments

*   From the left side under Administration: click Execution Environments > copy Default execution environment
    *   edit your copy
    *   change name: RHEL9
    *   edit image change
    *   from: registry.redhat.io/ansible-automation-platform-24/ee-supported-rhel8:latest
    *   to: registry.redhat.io/ansible-automation-platform-24/ee-supported-rhel9:latest
*   Pull: Only pull if not present
*   save

# Step 2 - Organizations

*   From the left side under Access: click Organizations > add
    *   name: HomeLab
    *   Execution Environment: RHEL9
*   save

# Step 3a - Users

*   From the left side under Access: click Users > add
    *   first name: HomeLabRoot
    *   username: root
    *   password: redhat
    *   User Type: System Adminstrator
    *   Organization: HomeLab
*   save

# Step 3b - Users

*   From the left side under Access: click Users > add
    *   first name: HomeLabMc
    *   username: ansible
    *   password: redhat
    *   User Type: System Adminstrator
    *   Organization: HomeLab
*   save

# Step 4a - Inventories

*   From the left side under Resources: click Inventories > add
    *   name: AAP
    *   Organization: HomeLab
*   save

# Step 4b - Inventories

*   From the left side under Resources: click Inventories > add
    *   name: MAC
    *   Organization: HomeLab
*   save
*   \\

# Step 4c - Inventories

*   From the left side under Resources: click Inventories > add
    *   name: HomeLab
    *   Organization: HomeLab
*   save

# Step 5a - Hosts

*   From the left side under Resources: click Inventories > add
    *   name: control.local
    *   Inventory: AAP
*   save
*   \\

# Step 5b - Hosts

*   From the left side under Resources: click Inventories > add
    *   name: whatevery\_your\_mac\_hostname
    *   Inventory: MAC
*   save
*   \\

# Step 6a - Credentials

*   From the left side under Resources: click Credentials > add
    *   name: RootAdmin
    *   Organization: HomeLab
    *   Credential Type: Machine
    *   username: root
    *   password: redhat
*   save
*   \\

# Step 6b - Credentials

*   From the left side under Resources: click Credentials > add
    *   name: MacAdmin
    *   Organization: HomeLab
    *   Credential Type: Machine
    *   username: ansible
    *   password: redhat
    *   Privilege Escalation Method: sudo
    *   Privilege Escalation Password: redhat
*   save

# Step 7 - Projects

*   From the left side under Resources: click Projects > copy > then edit
    *   name: Hello
    *   Organization: HomeLab
    *   Execution Environment: RHEL9
*   save
*   sync

# Step 8a - Templates

*   From the left side under Resources: click Templates > copy > hello > edit
    *   name: Linux Hello
    *   Inventory: AAP
    *   Project: Hello
    *   Execution Environment: RHEL9
    *   Credentials: RootAdmin
*   save
*   Launch

# Step 8b - Templates

*   From the left side under Resources: click Templates > copy > hello > edit
    *   name: Mac Hello
    *   Inventory: MAC
    *   Project: Hello
    *   Execution Environment: RHEL9
    *   Credentials: MacAdmin
*   save
*   Launch

# ansible validation complete

*   \\

# Create project to add GuestInstall

*   From the left side under Resources: click Projects > add
    *   name: GuestInstall
    *   Organization: HomeLab
    *   Execution Environment: RHEL9
    *   Source Control Type: Git
    *   Source Control URL: https://github.com/mikedoherty1/AAP-EDA-OracleDB.git
    *   Source Control Branch/Tag/Commit: VirtualBox
    *   Options: Clean
*   All project will be created in /var/lib/awx/projects \*\*\*\*\*\*

# Create Templates from Project GuestInstall

```
- Name: Install GuestAddons DNF
- Inventory: HomeLab
- Project: GuestInstall
- Execution Environment: RHEL9
    - Playbook: VBox_GuestAddons_rhel.yml
     - Credentials: RootAdmin
  - save
```

# Next Template

```
- Name: Install GuestAddons OEL 7.8
- Inventory: HomeLab
- Project: GuestInstall
- Execution Environment: RHEL9
    - Playbook: VBox_GuestAddons_oel78.yml
     - Credentials: RootAdmin
  - save
```

# Next Template

```
- Name: MacMount
- Inventory: MAC
- Project: GuestInstall
- Execution Environment: RHEL9
    - Playbook: VirtualBox_MacMount.yml
     - Credentials: MacAdmin
  - save
```

# Next Template

```
- Name: Mac_un_Mount
- Inventory: MAC
- Project: GuestInstall
- Execution Environment: RHEL9
    - Playbook: VirtualBox_Mac_UnMount.yml
     - Credentials: MacAdmin
  - save
```

# Next Template

```
- Name: AddNewVM2Control.Local
- Inventory: AAP
- Project: GuestInstall
- Execution Environment: RHEL9
    - Playbook: AddToHostsFile.yml
     - Credentials: RootAdmin
  - save
```

# Create Oracle VBox Server

*   \\
*   Configure server with the following
    *   8192 MB RAM
    *   40 GB Disk space
    *   Networking \* Add Bridge Adaptor and/or Host-only Netowk
    *   Start OS install
        *   oel7.8 (DB Server) Host Name: dbserver.local
        *   make sure all networks added are enabled
            *   When Server is being built you can run AddNewVM2Control.Local, put IP from above and hostname
        *   Software Selection:
        *   Minimal Install  
            \- Begin Install

# Launch AddNewVM2Control.Local

```
- Variables will prompt at launch
    - vbvmip: 192.168.56.???
    - vbname: <name_of_VBoxVM>
```

\*\* When Oracle server completes cont....

# Add hosts to HomeLab Inventory

# Step 5b - Hosts

*   From the left side under Resources: click Inventories > add
    *   name:
    *   Inventory: HomeLab
*   save
*   From the left side under Resources: click Templates > edit > hello > edit
    *   Change Inventory = HomeLab
*   save
*   Launch

# Create template workflow from newly created templates to add virtualbox guest software to VM

```
- Add  Workflow Template
- Name: Install Addon Linux Host
- Organization: HomeLab
- Limit: check prompt on Launch
    - Variables: check prompt on Launch
    Add: vbvm:
```

*   save
*   Please click the Start button to begin.
*   Start
*   Select > MacMount > Next > Save
*   \\
    *   On Sucess > Install GuestAddons DNF > Next > Save > On Sucess > Mac\_un\_Mount > Next > Save  
        \- + On Failure > Install GuestAddons OEL 7.8 > Next > Save > On Sucess > Mac\_un\_Mount > Next > Save
*   save
*   Launch
*   Limit:
*   Variable: vbvm:

# Create project to add Oracle

*   \\

copy GuestAddons > edit  
Name: Oracle Build  
Source Control Branch/Tag/Commit: OraBuild  
Save

Template  
Add  
Name: Oracle Build step 1 - root

# EDA Server Build

*   \\
*   \\

# EDA to execute tasks for OracleDB