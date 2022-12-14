<?php
// 应用公共文件

function show($msg, $httpStatus = 200, $code = 10000, $data = [])
{
    $result = [
        'code'  =>  $code,
        'msg'   =>  $msg,
        'data'  =>  $data
    ];
    return json($result,$httpStatus);
}
function success($data = [], $msg = '操作成功')
{
    return show($msg,200,10000,$data);
}

function fail($data = [], $msg = '操作失败')
{
    return show($msg,200,10004,$data);
}

//生成随机字符串
function getRandChar($length)
{
    $str = null;
    $strPol = "QWERTYUIOPASDFGHJKLZXCVBNM1234567890qwertyuiopasdfghjklzxcvbnm";
    $max = strlen($strPol) - 1;
    for ($i = 0;$i < $length; $i++){
        $str .= $strPol[rand(0,$max)];
    }
    return $str;
}



/**
 * 获取客户端IP地址
 * @param integer $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
 * @param boolean $adv 是否进行高级模式获取（有可能被伪装）
 * @return mixed
 */
function get_client_ip($type = 0,$adv=false)
{
    $type = $type ? 1 : 0;
    static $ip = NULL;
    if ($ip !== NULL) return $ip[$type];
    if ($adv) {//高级模式获取(防止伪装)
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
            $pos = array_search('unknown', $arr);
            if (false !== $pos) unset($arr[$pos]);
            $ip = trim($arr[0]);
        } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (isset($_SERVER['REMOTE_ADDR'])) {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
    } elseif (isset($_SERVER['REMOTE_ADDR'])) {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    // IP地址合法验证
    $long = sprintf("%u", ip2long($ip));
    $ip = $long ? array($ip, $long) : array('0.0.0.0', 0);
    return $ip[$type];
}