<?php

namespace app\lib\exception;

class WeChatException extends BaseException
{
    public $httpStatus = 400;
    public $errorCode  = 999;
    public $msg        = '微信未知错误';
}