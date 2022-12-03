<?php

namespace app\lib\exception;

class Register extends BaseException
{
    public $httpStatus = 200;
    public $errorCode  = 10000;
    public $msg        = '注册成功';
}