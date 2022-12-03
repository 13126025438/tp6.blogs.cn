<?php

namespace app\front\middleware;
use app\front\validate\Article as ArticleValidate;
class Article
{
    /**
     * 处理请求
     *
     * @param \think\Request $request
     * @param \Closure       $next
     * @return Response
     */
    public function handle($request, \Closure $next)
    {
       $params = $request->param();
       $validate = validate(ArticleValidate::class);
       $scene = $validate->scene('article_scene');
       $data = $scene->check($params);
//       dump($params);
        $request->params = $params;


        return $next($request);
    }
}