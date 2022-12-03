<?php

namespace app\validate;

use think\Validate;

class BaseValidate extends Validate
{

    protected function checkStr( $value, $rule = '', $data = [], $field = '' )
    {
        if(!is_string($value)){
            return $field . '数据类型错误 => str';
        }
        $length =strlen($value);
        if($rule){
            $ruleArr = explode(',',$rule);
            if(!($length >= $ruleArr[0] && $length <= $ruleArr[1])){
                return $field . '长度在' . $ruleArr[0]. '到' . $ruleArr[1] .'之间';
            }
        }
        return true;

    }
}