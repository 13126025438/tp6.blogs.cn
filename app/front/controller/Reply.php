<?php

namespace app\front\controller;

use app\Request;
use app\front\service\Reply as ReplayService;
class Reply
{
    //回复评论
    public function addReply(Request $request)
    {
        $params = $request->params;
        $service = ReplayService::writeReply($params);
        if(!$service){
            return fail('','至少填一个身份才能评论喔！（QQ /邮箱 /登录）');
        }
        return success($params);
    }
}