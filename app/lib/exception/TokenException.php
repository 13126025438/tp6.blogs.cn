<?php

namespace app\lib\exception;

class TokenException extends BaseException
{
    public $httpStatus = 403;
    public $errorCode  = 10002;
    public $msg        = 'token已失效';
}