
while read line
do
    fields=($line)
    imei=${fields[0]}
    imeiMd5=`md5 -q -s $imei`;
    key=${imeiMd5:0:10}

    url="http://www.smartisan.com/special/#/feedback-nps?feedid="$key;

    shortUrl=`curl -s -G --data-urlencode 'url='$url 'http://s-api.smartisan.com/short' |jq -r '.url'`

    pushResult=`curl -k -s POST 'http://172.16.21.87/push/msg/byimei?imei='$imei'&lifetime=300&opcode=vnd.com.smartisanos.mms%2Fmms' -H 'Host:push-admin.smartisan.com'  -H 'content-type: application/json' -d '{"from":"锤子科技","body":{"msgsys":"","msgsms":"您好，锤子科技诚邀您参与关于坚果 Pro 手机使用反馈的用户调研，请点击（'$shortUrl'）填写， 感谢您的支持。退订回复 TD。 ","pop":"1","notisys":"0","notisms":"1"}}'`
    log=$imei'\t'$shortUrl'\t'$pushResult;
    echo $log;
    echo $log >> result.log

done < 'imeis.txt'


while read line
do
    fields=($line);
    imei=${fields[0]};
    imeiMd5=`md5 -q -s $imei`;
    $key=${imeiMd5:0,10};
    url="http://www.smartisan.com/special/#/feedback-nps?feedid="$key;




done < 'imeis.txt'