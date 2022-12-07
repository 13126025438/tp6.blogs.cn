<?php

namespace app\front\service;
use app\model\Reply as ReplyModel;
class Reply
{
    public static function writeReply($params)
    {
        if(!array_key_exists('user_id',$params) && !array_key_exists('reply_qq',$params) && !array_key_exists('reply_email',$params)){
            return false;
        }else{
            if(($params['user_id'] || $params['reply_qq'] || $params['reply_email'] ) == ''){
                return false;
            }
        }

        $write = (new ReplyModel())->save($params);

//  return fail('','至少填一个身份才能评论喔！（QQ /邮箱 /登录）');

        return $write;
    }
}