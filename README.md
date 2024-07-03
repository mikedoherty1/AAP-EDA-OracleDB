# Oracle Build 

- Create Oracle user and Groups
- Create FileSystem
- get oracle binaries
- get starter DB
- relink
- startup DB
- veryify connection







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
  # Step 4c - Inventories
- From the left side under Resources: click Inventories > add 
  -  name: HomeLab
  - Organization: HomeLab
- save
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
  -  name: Linux Hello
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
 # Create project to add GuestInstall 
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
	- Name: Install GuestAddons DNF
 	- Inventory: HomeLab
  	- Project: GuestInstall
   	- Execution Environment: RHEL9
    	- Playbook: VBox_GuestAddons_rhel.yml
     	- Credentials: RootAdmin
      - save
# Next Template	
 	- Name: Install GuestAddons OEL 7.8
 	- Inventory: HomeLab
  	- Project: GuestInstall
   	- Execution Environment: RHEL9
    	- Playbook: VBox_GuestAddons_oel78.yml
     	- Credentials: RootAdmin
      - save
# Next Template
	- Name: MacMount
 	- Inventory: MAC
  	- Project: GuestInstall
   	- Execution Environment: RHEL9
    	- Playbook: VirtualBox_MacMount.yml
     	- Credentials: MacAdmin
      - save
# Next Template
	- Name: Mac_un_Mount
 	- Inventory: MAC
  	- Project: GuestInstall
   	- Execution Environment: RHEL9
    	- Playbook: VirtualBox_Mac_UnMount.yml
     	- Credentials: MacAdmin
      - save
# Next Template
	- Name: AddNewVM2Control.Local
 	- Inventory: AAP
  	- Project: GuestInstall
   	- Execution Environment: RHEL9
    	- Playbook: AddToHostsFile.yml
     	- Credentials: RootAdmin
      - save

# Create Oracle VBox Server
 -  
 - Configure server with the following
      - 8192 MB RAM
      - 40 GB Disk space
      - Networking * Add Bridge Adaptor and/or Host-only Netowk
    - Start OS install
        - oel7.8 (DB Server) Host Name: dbserver.local
        - make sure all networks added are enabled
          	- When Server is being built you can run AddNewVM2Control.Local, put IP from above and hostname
      - Software Selection:
      - Minimal Install 
            - Begin Install

# Launch AddNewVM2Control.Local
	- Variables will prompt at launch
 		- vbvmip: 192.168.56.???
   		- vbname: <name_of_VBoxVM>

** When Oracle server completes cont....

# Add  hosts to HomeLab Inventory
 # Step 5b - Hosts
- From the left side under Resources: click Inventories > add 
  -  name: <name_of_VBoxVM>
  - Inventory: HomeLab
- save

- From the left side under Resources: click Templates > edit > hello > edit
  -  Change Inventory = HomeLab
- save
- Launch



# Create template workflow from newly created templates to add virtualbox guest software to VM
  	- Add  Workflow Template
  	- Name: Install Addon Linux Host
  	- Organization: HomeLab
   	- Limit: check prompt on Launch
        - Variables: check prompt on Launch
		Add: vbvm:
  - save
  - Please click the Start button to begin.
  - Start
  - Select > MacMount > Next > Save
  - + On Sucess > Install GuestAddons DNF > Next > Save > On Sucess > Mac_un_Mount > Next > Save
  					- + On Failure > Install GuestAddons OEL 7.8 > Next > Save > On Sucess > Mac_un_Mount > Next > Save
- save
- Launch
- Limit: <name_of_VBoxVM>
- Variable: vbvm: <name_of_VBoxVM>

 # Create project to add Oracle
 -
 

