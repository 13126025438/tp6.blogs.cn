<?php

namespace app\front\validate;

use app\validate\BaseValidate;

class Comment extends BaseValidate
{
    protected $rule = [
        'art_id' => 'require',
        'user_id' => 'number',
        'content' => 'require|max:250',
        'com_qq' => 'max:10',
        'com_email' => 'email'
    ];

    protected $message = [
        'art_id.require' => '文章id丢失',
        'user_id.require' => '用户id丢失',
        'content.require' => '评论内容不能为空',
        'com_qq.max' => '请输入正确的qq',
        'com_email.email' => '请输入正确的email'
    ];

    protected $scene = [
        'checkCom' => ['art_id', 'user_id', 'content','com_qq','com_email']
    ];

}