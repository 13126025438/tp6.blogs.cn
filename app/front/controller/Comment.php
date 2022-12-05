<?php

namespace app\front\controller;

use app\Request;
use app\front\service\Comment as CommentService;
class Comment
{
 //评论
    public function addComment(Request $request)
    {
        $params = $request->params;
        $service = CommentService::writeCom($params);
        if(!$service){
            return fail('','至少填一个身份才能评论喔！（QQ /邮箱 /登录）');
        }
        return success($service);
    }
    //返回评论信息
    public function getComment(Request $request)
    {
        $params= $request->param();
        $art_id =  $params['art_id'];
        $comResult = CommentService::comReplyConduct($art_id);
        return success($comResult);
    }
}