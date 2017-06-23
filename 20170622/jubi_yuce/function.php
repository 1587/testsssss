<?php

function curl($url)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);

    if(!curl_exec($ch))
    {
        $data='';
    }
    else
    {
        $data = curl_multi_getcontent($ch);
    }
    curl_close($ch);
    return $data;
}

function p($str){
    echo '<pre>';
    print_r($str);
    echo '</pre>';
    die;
}

//获取买卖单价格
function get_price($bi){
    $trades_url = 'https://www.jubi.com/coin/'.$bi.'/trades';
    $order_url  = 'https://www.jubi.com/coin/'.$bi.'/order';
    //获得买卖单
    $arr = json_decode(curl($trades_url),true);
    $arr['buy']  = array_slice($arr['buy'],0,20);
    $arr['sell'] = array_slice($arr['sell'],0,20);
    $num_arr = [];
    foreach ($arr['buy'] as $k => $v) {
        $arr['buy'][$k]['sum']   = round($v[0]*$v[1],2);
        $num_arr[] = $v[1];
    }
    foreach ($arr['sell'] as $k => $v) {
        $arr['sell'][$k]['sum']   = round($v[0]*$v[1],2);
        $num_arr[] = $v[1];
    }
    $arr['max_num']  = max($num_arr);
    //成交记录
    $arr['history'] = array_slice(json_decode(curl($order_url),true)['d'],0,32);
    foreach ($arr['history'] as $k => $v) {
        $arr['history'][$k]['sum']   = round($v[1]*$v[2],2);
    }
    die(json_encode($arr,JSON_UNESCAPED_UNICODE));
}

get_price($_GET['bi']);


