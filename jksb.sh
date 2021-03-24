#!/bin/bash

username='****'
password='****'
jingdu='113.535912'
weidu='34.817169'

url_login='https://jksb.v.zzu.edu.cn/vls6sss/zzujksb.dll/login'
url_up='https://jksb.v.zzu.edu.cn/vls6sss/zzujksb.dll/jksb'
Headers='Mozilla/5.0'

data1="uid=${username}&upw=${password}"
result_temp=$(curl -A ${Headers} -X POST -d ${data1} ${url_login})
result=${result_temp##*ptopid=}
ptopid=${result:0:33}
sid=${result:38:18}

data2="day6=b&did=1&door=&men6=a&ptopid=${ptopid}&sid=${sid}"
result2=$(curl -A ${Headers} -X POST -d ${data2} ${url_up})

data3="myvs_1=%E5%90%A6&myvs_2=%E5%90%A6&myvs_3=%E5%90%A6&myvs_4=%E5%90%A6&myvs_5=%E5%90%A6&myvs_6=%E5%90%A6&myvs_7=%E5%90%A6&myvs_8=%E5%90%A6&myvs_9=%E5%90%A6&myvs_10=%E5%90%A6&myvs_11=%E5%90%A6&myvs_12=%E5%90%A6&myvs_13a=41&myvs_13b=4101&myvs_13c=%E5%AD%A6%E6%A0%A1&myvs_14=%E5%90%A6&myvs_14b=&myvs_30=%E5%9C%A8%E6%A0%A1&memo22=%e6%88%90%e5%8a%9f%e8%8e%b7%e5%8f%96&did=2&door=&day6=b&men6=a&sheng6=&shi6=&fun3=&jingdu=${jingdu}&weidu=${weidu}&ptopid=${ptopid}&sid=${sid}"
result3=$(curl -A ${Headers} -X POST -d ${data3} ${url_up})

# echo ${data2}
# echo ${data3}

: <<!
echo "------------------------------------- Begin of Record -----------------------------------" >>'/root/jksb/jksb_out.log'
echo -e "Record time: $(date)\n" >>'/root/jksb/jksb_out.log'
echo -e "Result 1:\n${result_temp}" >>'/root/jksb/jksb_out.log'
echo "-----------------------------------------------------------------------------------------" >>'/root/jksb/jksb_out.log'
echo -e "Result 2:\n${result2}" >>'/root/jksb/jksb_out.log'
echo "-----------------------------------------------------------------------------------------" >>'/root/jksb/jksb_out.log'
echo -e "Result 3:\n${result3}" >>'/root/jksb/jksb_out.log'
echo "-------------------------------------- End of Record ------------------------------------" >>'/root/jksb/jksb_out.log'
echo -e "\n" >>'/root/jksb/jksb_out.log'
!
