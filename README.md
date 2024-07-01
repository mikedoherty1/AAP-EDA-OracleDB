# Purpose - how to guide for AAP, EDA (GUI) automates installs, OS configurations, and DB build
- This is not a hands off build, this is a step by step on how to build automation
   -    *Not meant to be efficient, steps are purposeful individualized for build practice.
   -    Allot if items are hard coded naming, was not meant to be awesome scripting just simple cmds
### My laptop setup
- mac, created new user ansible with admin priv, password redhat, enabled ssh.
- all software was installed in ansible account (VirtualBox) https://www.virtualbox.org
- Installed latest Oracle VM VirtualBox Extension Pack
- Newtorking - Host-only Networks
- Mask: 255.255.255.0 ; Lower Bound: 192.168.56.100 ; Upper Bound: 192.168.56.199
   -
- Pre-requisits 
      - rhel9.4 & oel7.8 server used to install ansible automation control and oracleDB
        - RedHat Linux found here https://access.redhat.com/downloads/content/rhel > get Red Hat Enterprise Linux 9.4 Boot ISO
        - Oracle Linux found here https://yum.oracle.com/oracle-linux-isos.html > get OracleLinux-R7-U8-Server-x86_64-dvd.iso
	- I used Oracle VirtualBox but anthing can be used (OpenShift, Proxmox etc) https://www.virtualbox.org/wiki/Downloads
- Configure Service with the following
      - 8192 MB RAM
      - 40 GB Disk space
      - Networking * Host-only Network on Adapter 2
  		- This will be hard coded when finding Linux host ip's via VirtualBox for dynamic ansible Inventory
  -
# Screen shots of build can be found in: Ansible_Control_Server_Build.md    
    - Start OS install
        - RHEL9.4 (used for AAP) Host Name - control.local
        - make sure all networks added are enabled
        - all passwords set = redhat
          - root user: Allow root SSH login with password
    - Connect to RedHat
      - If you do not already, signup for personal account ** REQUIRED
        - These credentials will be used when installing Automation Platform
    - Software Selection:
      - Minimal Install > Select Standard
            - Begin Install
--
Login into newly built rhel9.4 server: control.local
  - local mac terminal ssh root@control.local * can get ip from linux console > ifconfig |grep 192
  - ** Recommend adding control.local to mac /etc/hosts file and adding mac host/ip to control.local **
  - all operations done as root user

```
	mkdir -p /root/git
```

-    Install git
    
```
	dnf install git -y
```
- Change to directory for git clone
```
	cd /root/git
```
- Pull environemnt cmds for setup
```
git clone https://github.com/mikedoherty1/AAP-EDA-OracleDB.git
```
- cd into directory
```
cd AAP-EDA-OracleDB
```
- Execute step0.sh
  -- This will prompt for read in variables and configure, install and download software
   - ./step0.sh
     - This will ask a couple questions and setup the necessary settings to install ansible platform
     - * When asked about key and phrases just hit return
       * when validating passwordless ssh, type yes when propmted, then type exit to go back to original session
- Install Ansible./s   
   - ./step1.sh

# ansible time
- Setting up the gui
# Screen shots of build can be found in: Automation-Control_Images.md

 # Step 1
    - from web broweser: https://control.local


    Proceed to your_ip_adress (unsafe)

    Login: admin
    Password: redhat
    


 # Step 2
 --
click username/password
put in your RedHat subscription and click: Get Subscription 



 # Step 3
--
Select your Subscription; then click next to finsih.  All done you know have AAP running



# Validate its all working
 # Step 1 - Execution Environments
- From the left side under Administration: click Execution Environments > copy Default execution environment
  - edit your copy
  - change name: RHEL9
  - edit image change
  - from: registry.redhat.io/ansible-automation-platform-24/ee-supported-rhel8:latest
  - to: registry.redhat.io/ansible-automation-platform-24/ee-supported-rhel9:latest
- Pull: Only pull if not present
- save

 # Step 2 - Organizations
- From the left side under Access: click Organizations > add 
  - name: HomeLab
  - Execution Environment: RHEL9
- save

 # Step 3a - Users
- From the left side under Access: click Users > add 
  - first name: HomeLabRoot
  - username: root
  - password: redhat
  - User Type: System Adminstrator
  - Organization: HomeLab
- save
 
 # Step 3b - Users
- From the left side under Access: click Users > add 
  - first name: HomeLabMc
  - username: ansible
  - password: redhat
  - User Type: System Adminstrator
  - Organization: HomeLab
- save


 # Step 4a - Inventories
- From the left side under Resources: click Inventories > add 
  -  name: AAP
  - Organization: HomeLab
- save
 
 # Step 4b - Inventories
- From the left side under Resources: click Inventories > add 
  -  name: MAC
  - Organization: HomeLab
- save
- 
 # Step 5a - Hosts
- From the left side under Resources: click Inventories > add 
  -  name: control.local
  - Inventory: AAP
- save
- 
 # Step 5b - Hosts
- From the left side under Resources: click Inventories > add 
  -  name: whatevery_your_mac_hostname
  - Inventory: MAC
- save
- 
 # Step 6a - Credentials
- From the left side under Resources: click Credentials > add 
  -  name: RootAdmin
  - Organization: HomeLab
  - Credential Type: Machine
  - username: root
  - password: redhat
- save
- 
  # Step 6b - Credentials
- From the left side under Resources: click Credentials > add 
  -  name: MacAdmin
  - Organization: HomeLab
  - Credential Type: Machine
  - username: ansible
  - password: redhat
  - Privilege Escalation Method: sudo
  - Privilege Escalation Password: redhat
- save

 # Step 7 - Projects
- From the left side under Resources: click Projects > copy > then edit 
  -  name: Hello
  - Organization: HomeLab
  - Execution Environment: RHEL9
- save
- sync

 # Step 8a - Templates
- From the left side under Resources: click Templates > copy > hello > edit
  -  name: Hello
  - Inventory: AAP
  - Project: Hello
  - Execution Environment: RHEL9
  - Credentials: RootAdmin
- save
- Launch
 
# Step 8b - Templates
- From the left side under Resources: click Templates > copy > hello > edit
  -  name: Mac Hello
  - Inventory: MAC
  - Project: Hello
  - Execution Environment: RHEL9
  - Credentials: MacAdmin
- save
- Launch

 # ansible validation complete
 -
 # Create project to add GuestInstall so Mac can read VM/IP for dynamic inventory
- From the left side under Resources: click Projects > add
	- name: GuestInstall
	- Organization: HomeLab
	- Execution Environment: RHEL9
   	- Source Control Type: Git
   	- Source Control URL: https://github.com/mikedoherty1/AAP-EDA-OracleDB.git
   	- Source Control Branch/Tag/Commit: VirtualBox
   	- Options: Clean
- All project will be created in /var/lib/awx/projects ****** 

# Create Templates from Project GuestInstall
	- Name: GuestAddons
 	- Inventory: AAP
  	- Project: GuestInstall
   	- Execution Environment: RHEL9
    	- Playbook: VirtualBox_GuestAddons.yml
     	- Credentials: RootAdmin
      - save

- 2nd of 3 templates
	- Name: MacMount
 	- Inventory: MAC
  	- Project: GuestInstall
   	- Execution Environment: RHEL9
    	- Playbook: VirtualBox_MacMount.yml
     	- Credentials: MacAdmin
      - save
   	 
- Last template
	- Name: Mac_un_Mount
 	- Inventory: MAC
  	- Project: GuestInstall
   	- Execution Environment: RHEL9
    	- Playbook: VirtualBox_Mac_UnMount.yml
     	- Credentials: MacAdmin
      - save
   	 
   # Create template workflow from newly created templates to add virtualbox guest software to VM
  	- Add  Workflow Template
  	- Name: Install Addon Linux Host
  	- Organization: HomeLab
  - save
  - Please click the Start button to begin.
  - Start
  - Select > MacMount
  - + On Sucess > GuestAddons
    + On Sucess > Mac_un_Mount
- save
- Launch

 # Oracle DB server build
 -
 # Screen shots of build can be found in: Ansible_Control_Server_Build.md    
 - Configure server with the following
      - 8192 MB RAM
      - 40 GB Disk space
      - Networking * Add Bridge Adaptor and/or Host-only Netowk
    - Start OS install
        - oel7.8 (DB Server) Host Name - dbserver.local
        - make sure all networks added are enabled
          	* Use IP address to login on ternminal (makes life easier)
          - click configure on all enabled netwrok devices
          - Ethernet > Link Negotiation = Automatic
          - General > also click Automatically connect to this network when available
        - all passwords set = redhat (I know)
          - root user: Allow root SSH login with password

    - Software Selection:
      - Minimal Install > Select Standard
            - Begin Install


# VirtualBox specific * In-order to obtain ip's from VBoxManage to dynamically build ansible inventory
     - Manual setup (ansible-playbook, setup_VBGuest.yml (not written yet))
	- yum install kernel-devel -y
 	- yum install bzip2 -y 
  	- yum install gcc -y
  	- click on VBox console > devices > Insert Guest Additions CD Images ..
   	- mkdir -p /media/cdrom
    	- mount /dev/cdrom /media/cdrom
	- sh VBoxLinuxAdditions.run
 - If error it's becuase it booted in UEK kernel, reboot and select oel7.8 (top choice)
	- mount /dev/cdrom /media/cdrom
	- sh VBoxLinuxAdditions.run
 - From local host terminal
 	-  VBoxManage guestproperty get dbserver.local /VirtualBox/GuestInfo/Net/0/V4/IP
  	-  VBoxManage guestproperty get dbserver.local /VirtualBox/GuestInfo/Net/1/V4/IP
   	-  VBoxManage guestproperty get dbserver.local /VirtualBox/GuestInfo/Net/2/V4/IP
   	-  VBoxManage guestproperty get dbserver.local /VirtualBox/GuestInfo/Net/3/V4/IP
- Ip's will be displayed and you can now create dynamic inventory of all your servers


 # EDA Server Build
 -
 # Ansible to automate OracleDB build
 -
 # EDA to execute tasks for OracleDB
