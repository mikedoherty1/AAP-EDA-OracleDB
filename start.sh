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
ssh-keygen -t rsa
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys


clear

clear
#Get AAP
echo "This should take 5 minutes (pending internet speeds - AAP Software, special build to automate inventory config"
echo "



"
sleep 5
wget --header="Host: drive.usercontent.google.com" --header="User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36" --header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" --header="Accept-Language: en-US,en;q=0.9" --header="Cookie: SEARCH_SAMESITE=CgQIvZoB; HSID=A8n_xFzOuHkXJBnT8; SSID=A-kbAKxclfedJCAbq; APISID=YgK3EkI4XfT5JwuZ/AQhc56qkaxzJ-vToX; SAPISID=3GvN0t4omAzCWagx/APrHiYgs3y0eE1ApU; __Secure-1PAPISID=3GvN0t4omAzCWagx/APrHiYgs3y0eE1ApU; __Secure-3PAPISID=3GvN0t4omAzCWagx/APrHiYgs3y0eE1ApU; SID=g.a000kAjUZBC8g8y3pnV3qpjQ9f5WXd_JOuibD7xzeHCmzGE6znXiPcxp4Lu3KRqBzU4uxp_ROgACgYKAQgSARISFQHGX2MiwL4ttK7tUuBv6TmIuYmpfhoVAUF8yKo_RQkHj0VwuNmNVi2TCwgl0076; __Secure-1PSID=g.a000kAjUZBC8g8y3pnV3qpjQ9f5WXd_JOuibD7xzeHCmzGE6znXiJFCR2OAGdRr0m5ZAO0LwagACgYKAeoSARISFQHGX2MiiPwnaBozfLd__xZZYP-6nhoVAUF8yKr9Rm5Crd-8lm1LVA1E3oh60076; __Secure-3PSID=g.a000kAjUZBC8g8y3pnV3qpjQ9f5WXd_JOuibD7xzeHCmzGE6znXiwLzEfe353Y2SPvdkuJwdEAACgYKAfkSARISFQHGX2MiLR2WbZTskNMCu14EzsW5XBoVAUF8yKpZwdU-jT0rhMT5rvjORIAB0076; AEC=AQTF6Hzde2ygoSLrnS7nuDripTY8LxGLQvzbveU3tX0RbheBaPm7nCVxNB8; NID=515=SxqiEjbWei6_78sPghhmPu9Lt6xjUHb4D_-SJI6JgWPXI2G8Mx16GQ97ylbOHvZuBm16JtH2NRF64UwyCVggxFrGmlgO2t0XLDWY-cv6rtuCngV1vNDu6QlVdCAtIAbz6b0HDe-_scMB7p5rckgNu71KG-9VsOq6euFweEA1STQzqoZ_GWH1ZohevpgTSYzkEpTKCaQFGKxbbGk9uzwkK-Mnqz54BO5G-6gN92Ba-Azw1fZo3fw5bp_QfBNPZC1cSDtNR0RrUIe9QbpgEfNf4b6NtMb73REf8ZFKTQl8upjZGzZ3s0M_Zzv0VbedCMesNtC8MBCNQ8oy23Sl07ioKg; 1P_JAR=2024-06-25-21; __Secure-1PSIDTS=sidts-CjEB3EgAErI5OTfwHQiY1LvTMOOjDpIFcNEa-3vRewLLmWzIBSjWxqer5TRf-5SG8hfzEAA; __Secure-3PSIDTS=sidts-CjEB3EgAErI5OTfwHQiY1LvTMOOjDpIFcNEa-3vRewLLmWzIBSjWxqer5TRf-5SG8hfzEAA; SIDCC=AKEyXzXwgttmofv6G-noGOoSx_u7gIukVlGUzi8ZA45AnIm93o5cBH_AhEjpi-6zixZBsx58ig; __Secure-1PSIDCC=AKEyXzUf8fJtUlFfJSdyOrlndjpKj2wAGSt3oJDq_pdEI4wQIEKgI3S3bcWuqVG5zgYpq8b8yw; __Secure-3PSIDCC=AKEyXzW40soW03s39ZOIEcUH7y9Cu5c9C4dP8s281usj1HMYlE082308l5Pp-o0D9zri7r1aEg" --header="Connection: keep-alive" "https://drive.usercontent.google.com/download?id=1Smai5FuQGlTtit3yAz-I3C3cGn0Ct4_v&export=download&authuser=0&confirm=t&uuid=9ee7c145-4d35-45ce-a75e-8ed0032e3a40&at=APZUnTXvzMLV-iWZofHhHvvQDgAM:1719352355755" -c -O 'AAP-bundle-2.4-6.2-x86_64.tar.gz'

clear
echo "Download of software complete"
sleep 1
mv AAP-bundle-2.4-6.2-x86_64.tar.gz /root/software

echo "Complete"
sleep 2
cd /root/software
#AAP
mkdir aap-bundle-2.4-6.2
mv AAP-bundle-2.4-6.2-x86_64.tar.gz aap-bundle-2.4-6.2
cd aap-bundle-2.4-6.2
tar -xzvf AAP-bundle-2.4-6.2-x86_64.tar.gz
rm AAP-bundle-2.4-6.2-x86_64.tar.gz

echo "setup inventory file"
echo "

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
echo "all done goto chrome/firefox https:$ips"
#Get Oracle
echo "Ansible complete start working in GUI - This should also take 15 minutes (pending internet speeds - Oracle software used to automate oel7.8 build via Ansible platform"
sleep 10
echo "







Download Oracle for new server DB build
"
wget --header="Host: drive.usercontent.google.com" --header="User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36" --header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" --header="Accept-Language: en-US,en;q=0.9" --header="Cookie: SEARCH_SAMESITE=CgQIvZoB; HSID=A8n_xFzOuHkXJBnT8; SSID=A-kbAKxclfedJCAbq; APISID=YgK3EkI4XfT5JwuZ/AQhc56qkaxzJ-vToX; SAPISID=3GvN0t4omAzCWagx/APrHiYgs3y0eE1ApU; __Secure-1PAPISID=3GvN0t4omAzCWagx/APrHiYgs3y0eE1ApU; __Secure-3PAPISID=3GvN0t4omAzCWagx/APrHiYgs3y0eE1ApU; SID=g.a000kAjUZBC8g8y3pnV3qpjQ9f5WXd_JOuibD7xzeHCmzGE6znXiPcxp4Lu3KRqBzU4uxp_ROgACgYKAQgSARISFQHGX2MiwL4ttK7tUuBv6TmIuYmpfhoVAUF8yKo_RQkHj0VwuNmNVi2TCwgl0076; __Secure-1PSID=g.a000kAjUZBC8g8y3pnV3qpjQ9f5WXd_JOuibD7xzeHCmzGE6znXiJFCR2OAGdRr0m5ZAO0LwagACgYKAeoSARISFQHGX2MiiPwnaBozfLd__xZZYP-6nhoVAUF8yKr9Rm5Crd-8lm1LVA1E3oh60076; __Secure-3PSID=g.a000kAjUZBC8g8y3pnV3qpjQ9f5WXd_JOuibD7xzeHCmzGE6znXiwLzEfe353Y2SPvdkuJwdEAACgYKAfkSARISFQHGX2MiLR2WbZTskNMCu14EzsW5XBoVAUF8yKpZwdU-jT0rhMT5rvjORIAB0076; AEC=AQTF6Hzde2ygoSLrnS7nuDripTY8LxGLQvzbveU3tX0RbheBaPm7nCVxNB8; __Secure-1PSIDTS=sidts-CjEB3EgAEhhVL7gXhtu5LZoQIb1ZwVV1Z8DroZeaoE--rSOoHp1y5HqU3fbcaJZVqKutEAA; __Secure-3PSIDTS=sidts-CjEB3EgAEhhVL7gXhtu5LZoQIb1ZwVV1Z8DroZeaoE--rSOoHp1y5HqU3fbcaJZVqKutEAA; NID=515=SxqiEjbWei6_78sPghhmPu9Lt6xjUHb4D_-SJI6JgWPXI2G8Mx16GQ97ylbOHvZuBm16JtH2NRF64UwyCVggxFrGmlgO2t0XLDWY-cv6rtuCngV1vNDu6QlVdCAtIAbz6b0HDe-_scMB7p5rckgNu71KG-9VsOq6euFweEA1STQzqoZ_GWH1ZohevpgTSYzkEpTKCaQFGKxbbGk9uzwkK-Mnqz54BO5G-6gN92Ba-Azw1fZo3fw5bp_QfBNPZC1cSDtNR0RrUIe9QbpgEfNf4b6NtMb73REf8ZFKTQl8upjZGzZ3s0M_Zzv0VbedCMesNtC8MBCNQ8oy23Sl07ioKg; 1P_JAR=2024-06-25-21; SIDCC=AKEyXzVwflS0jE_DpKk1G5rztBhXaVltFULdqEaW4oHLIb_4ClyC7_WDsazdmN9Sz_6iIzTeow; __Secure-1PSIDCC=AKEyXzUDun7mTYLy5KF7aU4ZXWzw_s9WSBODWl8KPXUZV95TiiTucm0xnUOcitrxYMzLw2mWsg; __Secure-3PSIDCC=AKEyXzUfDBJ8mCUU1mS0zej4MnteVWX6rOHPmquO__LmAaxLOrpoelgULh1ZECgvFxtkgbUz6Q" --header="Connection: keep-alive" "https://drive.usercontent.google.com/download?id=1xZGxmOtrLig4fNhhCMjoEzMRqcC0uXWe&export=download&authuser=0&confirm=t&uuid=7f0e4739-11fd-4745-bea1-3bbd3931917e&at=APZUnTVu0NZSW8oS8RMUUqC5Pke3:1719350987616" -c -O 'ora19c.tar.gz'

mv ora19c.tar.gz /root/software
clear
echo "All OS steps complete, everything else will be done in Ansible Automation Platform


"