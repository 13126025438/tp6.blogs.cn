<?php

namespace app\front\validate;

use app\validate\BaseValidate;

class User extends BaseValidate
{
    protected $rule = [
        'username'  =>  'require',
        'password'  =>  'require'
    ];

    protected $message = [
        'username.require'  =>  '用户名不能为空',
        'password.require'  =>  '密码不能为空'
    ];

    protected $scene = [
        'login' =>  ['username','password']
    ];
}