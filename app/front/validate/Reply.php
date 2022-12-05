<?php

namespace app\front\validate;

use app\validate\BaseValidate;

class Reply extends BaseValidate
{
    protected $rule = [
        'com_id' => 'require',
        'user_id' => 'number',
        'content' => 'require|max:250',
        'reply_qq' => 'max:10',
        'reply_email' => 'email',
        'reply_uid'     =>  'require'
    ];

    protected $message = [
        'com_id.require' => '主评论id丢失',
        'user_id.require' => '用户id丢失',
        'content.require' => '评论内容不能为空',
        'reply_qq.max' => '请输入正确的qq',
        'reply_email.email' => '请输入正确的email',
        'reply_uid.require' =>  '请选择回复对象'
    ];

    protected $scene = [
        'checkReply' => ['com_id', 'user_id', 'content','reply_qq','reply_email','reply_uid']
    ];

}