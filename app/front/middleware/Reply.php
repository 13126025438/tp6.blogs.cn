<?php

namespace app\front\middleware;
use app\front\validate\Reply as ReplyValidate;
class Reply
{
    public function handle($request, \Closure $next)
    {
        $params = $request->param();
        $validate = validate(ReplyValidate::class);
        $scene = $validate->scene('checkReply');
        $scene->check($params);
        $request->params=$params;
        return $next($request);
    }
}