#extract ansible and configure / run setup

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
hostname

echo "
Enter your hostname
"
read YOUR_HOST_NAME

sed -i "s/change_host_name/$YOUR_HOST_NAME/g" /root/software/aap-bundle-2.4-6.2/inventory
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
#cd /var/lib/awx/projects
#sleep 1
#git clone -b VirtualBox https://github.com/mikedoherty1/AAP-EDA-OracleDB.git
#sleep 1
#mv AAP-EDA-OracleDB VirtualBox
#sleep 1
