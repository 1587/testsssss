<?php

function prettyPrint($args)
{
    foreach ($args as $key => &$value) {
        if(!$value){
            unset($args[$key]);
            continue;
        }
        !is_string($value) and $value = json_encode($value,JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT);
    }

    return join($args,'  ');
}
/**
 * [info 标准信息]
 * @author limao 2016-07-28
 * @return [type] [description]
 */
function info()
{
    $result = prettyPrint(func_get_args());
    echo  "\033[32;5m " . $result . " \033[0m",PHP_EOL;
}

/**
 * [error 错误信息]
 * @author limao 2016-07-28
 * @return [type] [description]
 */
function error()
{
    $result = prettyPrint(func_get_args());
    echo "\033[41;37m " . $result . " \033[0m",PHP_EOL;
}

/**
 * [comment 注释信息]
 * @author limao 2016-07-28
 * @return [type] [description]
 */
function comment()
{
    $result = prettyPrint(func_get_args());
    echo PHP_EOL,"\033[33m " . $result . " \033[0m",PHP_EOL,PHP_EOL;

}

function line()
{
    $result = prettyPrint(func_get_args());
    echo $result,PHP_EOL;
}
