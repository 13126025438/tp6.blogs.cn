<?php

namespace app\lib\exception;

class Miss extends BaseException
{
    public $httpStatus = 404;
    public $errorCode  = 10002;
    public $msg        = '账户不存在';
}