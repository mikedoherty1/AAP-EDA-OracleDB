#A bunch of cmds to configure and install AAP 
#Downloading software for AAP
echo " Downloading software for AAP ;
this should take no longer than 5 minutes (pending internet speeds - AAP Software, special build to automate inventory config"
#Just some space for screen message
echo "



"
wget --header="Host: drive.usercontent.google.com" --header="User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36" --header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" --header="Accept-Language: en-US,en;q=0.9" --header="Cookie: OGPC=19037049-1:; OGP=-19037049:; AEC=AVYB7coX6XKbOwpPEVnKBZQzvtPAWNWqyrnTrUfC2xgoKuBF9H2OchM5kA; SID=g.a000lwjUZPrNzSXvgtPbQOfDH5SF_morBIaCbvB3xErcedpsrF7nmAFT9yVpdaLmC6wE4tLxDQACgYKAfUSARISFQHGX2MizZ513bXQS0XZGgwp4b9RKxoVAUF8yKrWA7bp23QNwtwUYFr5UQdB0076; __Secure-1PSID=g.a000lwjUZPrNzSXvgtPbQOfDH5SF_morBIaCbvB3xErcedpsrF7nbeEHerPRgYQ6aF4TTkbC1wACgYKAVYSARISFQHGX2MiNARZncrivdARLOpnv5PBVRoVAUF8yKrOK3SjW_T_FiZvMrFscyGi0076; __Secure-3PSID=g.a000lwjUZPrNzSXvgtPbQOfDH5SF_morBIaCbvB3xErcedpsrF7nFQydgA6VYWfqxATYuf3BPAACgYKAVcSARISFQHGX2MiZ7baNN2V-cwW7dhDMM3FyRoVAUF8yKropp_4OyaHs1eHcaVnDKJu0076; HSID=AYMGmXB6xLhSDD6t6; SSID=AWYBI5RsvpvULfUV1; APISID=_sPYHxv51G_maMVD/AK8yniczduDvGffcD; SAPISID=lXSCjYI9CdzGslBd/AH-n5I3CujmzxwaAb; __Secure-1PAPISID=lXSCjYI9CdzGslBd/AH-n5I3CujmzxwaAb; __Secure-3PAPISID=lXSCjYI9CdzGslBd/AH-n5I3CujmzxwaAb; __Secure-1PSIDTS=sidts-CjIB4E2dkdpsQblkHsAqEbQzq1_oceu0hnlT6FQEAxolIxBw2kNpjYgOW8CtKVgQRuUrERAA; __Secure-3PSIDTS=sidts-CjIB4E2dkdpsQblkHsAqEbQzq1_oceu0hnlT6FQEAxolIxBw2kNpjYgOW8CtKVgQRuUrERAA; SEARCH_SAMESITE=CgQIzJsB; NID=515=H_-m9G7q-eB7UsnfJBUVk6kuan6XUaugaAXFOH9kLBa_pe_Qag3aruatZ452Zy94hHCeXZuuBlc_x0toBwfWhM_Cs22QqaKhWBeyiPPmeUjPaqlhzK9U70oTQAPQrPTGkqWMP1zheJCcXpjAniPXunQv4UKcvMn9xxP-mvbF01F3FbxtVuD4koUeX6UvQGCHOLeJLsgkbvAOraopjw4w3iz4sfii5XOXb_SGq15oRCT2xpiI3uDc0J-2BccYn_dSHEfxY4ZNlBdHlwdQ8MYEumjggGRwqQq7VTMzQWj0O-lj5oTBHPlZLB4-n73dEC_F33r7LwYmI03LzplsIxJIKEO-ZjszCau5RBCpHv2IM8vwRuJ2XeFEmaY8GKqA6Z_tmzp_xr4893cKijrLFXXyHCKrv5qwlKCLcTS96ze-900jwob9TzAzTYBU_0QDtstqnEGj57ye-ywHUloCP7y9mK3uxbH33vrcBcXYa7F9hpIqTKz7nMoSXA9AdTiCH925B9fM0DZrHqd6V5ACNLZXh6vnkZPlmcoeA1vLK0XWsdrx_jtc-07NJXC5wczQt249C0-whowczAxLes6ht3pjpB_s6eJJpAjn2xkMBm4iKToeluB-SViMgwZ19ufsTKgMM1UDXon_es6CSCztcst0xD4yXPoW58h2nUs4cnmml7pFZZe9pf57tJOHS1nbvRZzMPDn1u25VMVL2q5le5xnQsckFMNQqF1IdQfBMeT5YfpZ9TdAWyGdLFlgjwsw03pYEhDLfrDq7UhWGEe1tUomKD46HtNy6WCNMocx_g4zNDM3dT_Q2X696WEGTdO1Kbcqk7E; SIDCC=AKEyXzUxYt9W5IfDgbiAgJqam2I3Ovz1jGGRg_w2wKbLuYsmyUPa-AC2iEWHbM9kw-BRgmH9Sg; __Secure-1PSIDCC=AKEyXzWZSd0duk37VFiE1fTBZNXYJncNTyZcflWUqMAEPwVh4m6G3Iik6JzD9n_FtFPTbHEVow; __Secure-3PSIDCC=AKEyXzVWhydSeYghC0rxyPwVwAbkaK8RKG3ct_lJMDMyaLOUtfK2CvAcojOFWC8RaqF7AkmE" --header="Connection: keep-alive" "https://drive.usercontent.google.com/download?id=1Smai5FuQGlTtit3yAz-I3C3cGn0Ct4_v&export=download&authuser=0&confirm=t&uuid=4a836e67-022f-4e2c-b971-acc327a6444a&at=APZUnTW3e0s-_j2oKQfM5cM1whZb:1720787608932" -c -O 'AAP-bundle-2.4-6.2-x86_64.tar.gz'
sleep 5
#dnf install git * required before running step0.sh
mkdir -p /root/software
#Basic os commands to configure pre-ansible install
#Allow root
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

systemctl restart sshd
clear
#Get ip and hostname to read into variable
ifconfig |grep inet
echo "copy paste ip to use"
read ips
clear
echo "copy paste fully qualified hostname"
hostname
read hn

echo "$ips     $hn" >> /etc/hosts
clear
echo "Enter you Mac IP address (ifconfig | grep inet)"
read ipsm
clear
echo "Enter your Mac fully qualified hostname (hostname) ??? > "
read hnm

echo "$ipsm     $hnm" >> /etc/hosts
clear
ssh-keygen -t rsa
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys

clear

sleep 1
mv AAP-bundle-2.4-6.2-x86_64.tar.gz /root/software

sleep 2
cd /root/software
#AAP
mkdir aap-bundle-2.4-6.2
cp AAP-bundle-2.4-6.2-x86_64.tar.gz aap-bundle-2.4-6.2
cd aap-bundle-2.4-6.2
tar -xzvf AAP-bundle-2.4-6.2-x86_64.tar.gz


echo "setup inventory file"
echo "#

Enter your RedHat subscription login
"
read REDHAT_UID

echo "

Enter your RedHat subscription password
"
read REDHAT_PWD
echo "

"

sed -i "s/change_host_name/$hn/g" /root/software/aap-bundle-2.4-6.2/inventory
sed -i "s/REDHAT_UID/$REDHAT_UID/g" /root/software/aap-bundle-2.4-6.2/inventory
sed -i "s/REDHAT_PWD/$REDHAT_PWD/g" /root/software/aap-bundle-2.4-6.2/inventory

/root/software/aap-bundle-2.4-6.2/setup.sh
clear

#Get Oracle
echo "all done goto chrome/firefox https://$ips or https://control.local"
echo "


" 
echo "Oracle download This should also take 15 minutes or less (pending internet speeds - Oracle software used to automate oel7.8 build via Ansible platform"
sleep 10
echo "


Download Oracle for new server DB build
"
wget --header="Host: drive.usercontent.google.com" --header="User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36" --header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" --header="Accept-Language: en-US,en;q=0.9" --header="Cookie: SEARCH_SAMESITE=CgQIvZoB; HSID=A8n_xFzOuHkXJBnT8; SSID=A-kbAKxclfedJCAbq; APISID=YgK3EkI4XfT5JwuZ/AQhc56qkaxzJ-vToX; SAPISID=3GvN0t4omAzCWagx/APrHiYgs3y0eE1ApU; __Secure-1PAPISID=3GvN0t4omAzCWagx/APrHiYgs3y0eE1ApU; __Secure-3PAPISID=3GvN0t4omAzCWagx/APrHiYgs3y0eE1ApU; SID=g.a000kAjUZBC8g8y3pnV3qpjQ9f5WXd_JOuibD7xzeHCmzGE6znXiPcxp4Lu3KRqBzU4uxp_ROgACgYKAQgSARISFQHGX2MiwL4ttK7tUuBv6TmIuYmpfhoVAUF8yKo_RQkHj0VwuNmNVi2TCwgl0076; __Secure-1PSID=g.a000kAjUZBC8g8y3pnV3qpjQ9f5WXd_JOuibD7xzeHCmzGE6znXiJFCR2OAGdRr0m5ZAO0LwagACgYKAeoSARISFQHGX2MiiPwnaBozfLd__xZZYP-6nhoVAUF8yKr9Rm5Crd-8lm1LVA1E3oh60076; __Secure-3PSID=g.a000kAjUZBC8g8y3pnV3qpjQ9f5WXd_JOuibD7xzeHCmzGE6znXiwLzEfe353Y2SPvdkuJwdEAACgYKAfkSARISFQHGX2MiLR2WbZTskNMCu14EzsW5XBoVAUF8yKpZwdU-jT0rhMT5rvjORIAB0076; AEC=AQTF6Hzde2ygoSLrnS7nuDripTY8LxGLQvzbveU3tX0RbheBaPm7nCVxNB8; __Secure-1PSIDTS=sidts-CjEB3EgAEhhVL7gXhtu5LZoQIb1ZwVV1Z8DroZeaoE--rSOoHp1y5HqU3fbcaJZVqKutEAA; __Secure-3PSIDTS=sidts-CjEB3EgAEhhVL7gXhtu5LZoQIb1ZwVV1Z8DroZeaoE--rSOoHp1y5HqU3fbcaJZVqKutEAA; NID=515=SxqiEjbWei6_78sPghhmPu9Lt6xjUHb4D_-SJI6JgWPXI2G8Mx16GQ97ylbOHvZuBm16JtH2NRF64UwyCVggxFrGmlgO2t0XLDWY-cv6rtuCngV1vNDu6QlVdCAtIAbz6b0HDe-_scMB7p5rckgNu71KG-9VsOq6euFweEA1STQzqoZ_GWH1ZohevpgTSYzkEpTKCaQFGKxbbGk9uzwkK-Mnqz54BO5G-6gN92Ba-Azw1fZo3fw5bp_QfBNPZC1cSDtNR0RrUIe9QbpgEfNf4b6NtMb73REf8ZFKTQl8upjZGzZ3s0M_Zzv0VbedCMesNtC8MBCNQ8oy23Sl07ioKg; 1P_JAR=2024-06-25-21; SIDCC=AKEyXzVwflS0jE_DpKk1G5rztBhXaVltFULdqEaW4oHLIb_4ClyC7_WDsazdmN9Sz_6iIzTeow; __Secure-1PSIDCC=AKEyXzUDun7mTYLy5KF7aU4ZXWzw_s9WSBODWl8KPXUZV95TiiTucm0xnUOcitrxYMzLw2mWsg; __Secure-3PSIDCC=AKEyXzUfDBJ8mCUU1mS0zej4MnteVWX6rOHPmquO__LmAaxLOrpoelgULh1ZECgvFxtkgbUz6Q" --header="Connection: keep-alive" "https://drive.usercontent.google.com/download?id=1xZGxmOtrLig4fNhhCMjoEzMRqcC0uXWe&export=download&authuser=0&confirm=t&uuid=7f0e4739-11fd-4745-bea1-3bbd3931917e&at=APZUnTVu0NZSW8oS8RMUUqC5Pke3:1719350987616" -c -O 'ora19c.tar.gz'

mv ora19c.tar.gz /root/software
mv /root/AnsibleAutomationPlatform-OracleDB/ora_bash_profile /root/software
mv /root/AnsibleAutomationPlatform-OracleDB/cp_ora.yml /root/software
mv /root/AnsibleAutomationPlatform-OracleDB/cp_eda.yml /root/software
mv /root/AnsibleAutomationPlatform-OracleDB/keys.yml /root/software
clear
#add ansible module
ansible-galaxy collection install ansible.posix
sleep 5
clear
echo "All steps complete, everything else will be done in Ansible Automation Platform
"

echo "


" 
echo "all done goto chrome/firefox https://$ips or https://control.local"