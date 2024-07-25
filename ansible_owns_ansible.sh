#Basic os commands to configure pre-ansible install
#Allow root
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
echo ""
echo ""
echo ""
echo ""
systemctl restart sshd
echo ""
echo ""
echo ""
echo ""
#Get ip and hostname to read into variable
hn=`hostname`
ips=`ifconfig | grep 192 | awk '{ print $2}'`
echo "IP and hostname being added to /etc/hosts $hnip : $hn"
echo "$ips     $hn" >> /etc/hosts
echo ""
echo ""
echo ""
echo ""
echo ""
echo "Enter you Mac IP address "
read ipsm
echo ""
echo ""
echo ""
echo "Enter your Mac hostname > "
read hnm
echo "$ipsm     $hnm" >> /etc/hosts
echo ""
echo ""
echo ""
echo "$hn" >> hosts
#Generate SSH Key
ssh-keygen -t rsa
echo ""
echo ""
echo ""
ssh-keyscan -H $hn >> ~/.ssh/known_hosts
echo ""
echo ""
echo ""
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
#add ansible 
dnf install ansible-core -y
echo ""
echo ""
echo ""
ansible-galaxy collection install ansible.posix
echo ""
echo ""
echo ""
#Ansible to setup user and download software
ansible-playbook -i hosts create_ansible.yml 
