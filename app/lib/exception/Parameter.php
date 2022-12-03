<?php

namespace app\lib\exception;

use think\Exception;

class Parameter extends BaseException
{
    public $httpStatus = 201;
    public $errorCode  = 10001;
    public $msg        = '参数错误';

//    public function __construct($params = [])
//    {
//        if(!is_array($params)){
//            return;
//        }
//        if(array_key_exists('msg',$params)){
//            $this->msg = $params['msg'];
//        }
//        if(array_key_exists('errorCode',$params)){
//            $this->errorCode = $params['errorCode'];
//
//        }
//        if(array_key_exists('httpStatus',$params)){
//            $this->httpStatus = $params['httpStatus'];
//
//        }
//    }
}