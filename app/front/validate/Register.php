<?php

namespace app\front\validate;

use app\validate\BaseValidate;

class Register extends BaseValidate
{
    protected $rule = [
        'username'  =>   ['require', 'checkStr' => '3,12'],
        'password'  =>   ['require', 'checkStr' => '6,16'],
    ];

    protected $message = [
        'username.require'  =>  '用户名不能为空',
        'password.require'  =>  '密码不能为空',
        'username.between'  =>  '用户名长度在3,10之间',
        'password.between'  =>  '密码长度在6,16之间',
    ];

    protected $scene = [
        'register' =>  ['username','password']
    ];
//
//    protected function checkStr( $value, $rule = '', $data = [], $field = '' )
//    {
//        if(!is_string($value)){
//            return $field . '数据类型错误 => str';
//        }
//        $length =strlen($value);
//        if($rule){
//            $ruleArr = explode(',',$rule);
//            if(!($length >= $ruleArr[0] && $length <= $ruleArr[1])){
//                return $field . '长度在' . $ruleArr[0]. '到' . $ruleArr[1] .'之间';
//            }
//        }
//        return true;
//
//    }
}