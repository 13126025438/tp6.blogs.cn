<?php

namespace app\lib\exception;

class Forbidden extends BaseException
{
    public $httpStatus = 203;
    public $errorCode  = 10005;
    public $msg        = '权限不够阿';
}