# Purpose - how to guide for AAP, EDA (GUI) automates installs, OS configurations, and DB build
- This is not a hands off build, this is a step by step on how to build automation
   -    *Not meant to be efficient, steps are purposeful individualized for build practice.
   -    Allot if items are hard coded naming, was not meant to be awesome scripting just simple cmds  
   - Pre-requisits 
      - rhel9.4 & oel7.8 server used to install ansible automation control and oracleDB
        - RedHat Linux found here https://access.redhat.com/downloads/content/rhel > get Red Hat Enterprise Linux 9.4 Boot ISO
        - Oracle Linux found here https://yum.oracle.com/oracle-linux-isos.html > get OracleLinux-R7-U8-Server-x86_64-dvd.iso
	- I used Oracle VirtualBox but anthing can be used (OpenShift, Proxmox etc) https://www.virtualbox.org/wiki/Downloads
- Configure Service with the following
      - 8192 MB RAM
      - 40 GB Disk space
      - Networking * Add Bridge Adaptor and/or Host-only Netowk
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
  - Recommend using local host terminal or putty (if you do not remember IP) from console:     ifconfig |grep inet
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
   - add entries into /etc/hosts ; From mac
```
	ifconfig |grep inet 
```

- Get fully gualified hostname
```
	hostname
```
- Add to local host; add IP hostname
```
	sudo vi /etc/hosts
```
# Results
## 192.168.56.12	control.local

- Copy ip/hostname ; From Mac ; Add entry to control.local
```
	vi /etc/hosts
```

   - might need to enable ssh login into mac >system>general>sharing>remotelogin 
     - 
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

 # Step 3 - Users
- From the left side under Access: click Users > add 
  - first name: HomeLabRoot
  - username: root
  - password: redhat
  - User Type: System Adminstrator
  - Organization: HomeLab
- save

 # Step 4 - Inventories
- From the left side under Resources: click Inventories > add 
  -  name: AAP
  - Organization: HomeLab
- save

 # Step 5 - Hosts
- From the left side under Resources: click Inventories > add 
  -  name: control.local
  - Inventory: AAP
- save

 # Step 6 - Credentials
- From the left side under Resources: click Credentials > add 
  -  name: RootAdmin
  - Organization: HomeLab
  - Credential Type: Machine
  - username: root
  - password: redhat
- save

 # Step 7 - Projects
- From the left side under Resources: click Projects > copy > then edit 
  -  name: Hello
  - Organization: HomeLab
  - Execution Environment: RHEL9
- save
- sync

 # Step 7 - Templates
- From the left side under Resources: click Templates > add
  -  name: Run Hello
  - Inventory: AAP
  - Project: Hello
  - Execution Environment: RHEL9
  - Credentials: RootAdmin
- save
- Launch

 # ansible validation complete
 -
 # Create project to add GuestInstall so Mac can read VM/IP for dynamic inventory
 -  git clone -b VirtualBox https://github.com/mikedoherty1/AAP-EDA-OracleDB.git
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
