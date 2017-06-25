<?php
require './help.php';
comment('-------> start <------');

$jubi_price = exec("curl -s https://www.jubi.com/api/v1/ticker?coin=doge | jq '.last'");
$jubi_price  = trim($jubi_price ,'"');

$btc_price = exec("curl -s https://api.btctrade.com/api/ticker?coin=doge | jq '.last'");

info('聚币网：',$jubi_price);
info('比交网：',$btc_price);

$diff_price = abs($btc_price - $jubi_price);

$low = $btc_price > $jubi_price?$jubi_price:$btc_price;
$high = $btc_price > $jubi_price?$btc_price:$jubi_price;


info('差价：',sprintf("%.5f", $diff_price ));

$diff_rate = $diff_price/$low;


info('差率：',sprintf("%.3f", $diff_rate*100) . '%');


function demo($money,$low,$high){
    $ori_money = $money;
    comment('------- demo -------');

    info('人民币：',$money);

    line('扣除购买服务费0.1%：',$money*0.001);

    $money = $money - $money*0.001;

    info('剩余',$money);

    $doge_num = sprintf("%.3f", $money/$low);

    info('可购买狗币：',$doge_num);

    $doge_wreck = sprintf("%.3f", $doge_num*0.005);

    line('扣除狗币转入手机钱包服务费0.5%：',$doge_wreck);


    info('剩余狗币：',$doge_num - $doge_wreck);

    $doge_num = $doge_num - $doge_wreck - 1;

    info('转入交易平台扣除1个doge网络费,剩余：',$doge_num);


    info('卖出价格：',$doge_num * $high);


    line('扣除卖出服务费0.1%：',$doge_num * $high*0.001);

    $money = $doge_num * $high*0.999;
    info('剩余',$money);


    line('扣除体现服务费0.4%：',$money*0.004);
    info('剩余.',(int)$money*0.996);

    // if($ori_money >= 10000 && $ori_money - $money > 500){
        exec('osascript -e \'display notification ".." with title "🐶    赚取' . ($ori_money - $money) . '"\'');
    // }

}


demo(1000,$low,$high);

demo(10000,$low,$high);







comment('------- end -------');


die();
