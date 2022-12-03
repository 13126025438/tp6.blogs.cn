<?php

namespace app\front\validate;

use app\validate\BaseValidate;

class Banner extends BaseValidate
{
    protected $rule = [
        'user_id'   =>  ['require','number'],
        'dictum'    =>  ['require','max:600']
    ];

    protected $message = [
        'user_id.require'   =>  '用户id不能为空',
        'user_id.number'    =>  '用户id是整数',
        'dictum.require'    =>  '内容不能为空',
        'dictum.max'        =>  '字数不能超过600'
    ];

    protected $scene=[
        'bannerCheck'   =>  ['user_id','dictum']
    ];
}