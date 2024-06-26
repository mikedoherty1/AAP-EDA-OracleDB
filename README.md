# Purpose - how to guide for AAP, EDA (GUI) automates installs, OS configurations, and DB build
- This is not a hands off build, this is a step by step on how to build automation
   -    *Not meant to be efficient, steps are purposeful individualized for build practice.   
   - Pre-requisits 
      - rhel9.4 & oel7.8 server used to install ansible automation control and oracleDB
	- Oracle Linux found here https://yum.oracle.com/oracle-linux-isos.html > get OracleLinux-R7-U8-Server-x86_64-dvd.iso
      - 8192 MB RAM
      - 40 GB Disk space
      - Networking * Add Bridge Adaptor and/or Host-only Netowk
    
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
  
  
Login into newly built rhel9.4 server: control.local
  - Recommend using local host terminal or putty (if you do not remember IP) from console:     ifconfig |grep inet
  - all operations done as root user
    - mkdir -p /root/git
    - dnf install git -y
    - cd /root/git
    - git clone https://github.com/mikedoherty1/AAP-EDA-OracleDB.git
    - cd AAP-EDA-OracleDB

- Execute step0.sh
  -- This will prompt for read in variables and configure, install and download software
   - ./step0.sh
     - This will ask a couple questions and setup the necessary settings to install ansible platform
     - * When asked about key and phrases just hit return
       * when validating passwordless ssh, type yes when propmted, then type exit to go back to original session
- Install Ansible./s   
   - ./step1.sh
    
     - 
# ansible time
- Setting up the gui

 # Step 1
    - from web broweser: https://your_ip_adress or if added to local host /etc/hosts https://control.local


    Proceed to your_ip_adress (unsafe)

    Login: admin
    Password: redhat
    
<img width="618" alt="Screenshot 2024-06-26 at 11 27 26 AM" src="https://github.com/mikedoherty1/server_prep/assets/145161084/e8adea15-cae6-41cc-b988-80e30972ee0c">

 # Step 2
 --
click username/password
put in your RedHat subscription and click: Get Subscription 

<img width="946" alt="Screenshot 2024-06-26 at 11 27 49 AM" src="https://github.com/mikedoherty1/server_prep/assets/145161084/05f48cd8-b861-4789-bc79-4b92550866a8">

 # Step 3
--
Select your Subscription; then click next to finsih.  All done you know have AAP running

<img width="802" alt="Screenshot 2024-06-26 at 11 30 03 AM" src="https://github.com/mikedoherty1/server_prep/assets/145161084/9445b05d-9d28-439c-84a5-1540997b881d">

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
  -  name: hostname of system running ansible automation platform (fully qualified, run hostname on host if needed)
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
 # Oracle DB server build
 -
 # EDA Server Build
 -
 # Ansible to automate OracleDB build
 -
 # EDA to execute tasks for OracleDB
