<?php

namespace app\lib\exception;

use think\Exception;

class BaseException extends Exception
{
    public function __construct($params = [])
    {
        if(!is_array($params)){
            return;
        }
        if(array_key_exists('msg',$params)){
            $this->msg = $params['msg'];
//            echo $this->msg;
        }
        if(array_key_exists('errorCode',$params)){
            $this->errorCode = $params['errorCode'];

        }
        if(array_key_exists('httpStatus',$params)){
            $this->httpStatus = $params['httpStatus'];

        }


    }
}