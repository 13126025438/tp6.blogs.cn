<?php

namespace app\front\middleware;
use app\front\validate\Comment as CommentValidate;

class Comment
{
    public function handle($request, \Closure $next)
    {
        $params = $request->param();
        $validate = validate(CommentValidate::class);
        $scene = $validate->scene('checkCom');
        $scene->check($params);
        $request->params=$params;
        return $next($request);
    }
}