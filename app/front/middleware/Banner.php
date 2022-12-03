<?php

namespace app\front\middleware;
use app\front\validate\Banner as BannerValidate;
class Banner
{
    public function handle($request, \Closure $next)
    {
        $params = $request->param();
        $validate = validate(BannerValidate::class);
        $scene = $validate->scene('bannerCheck');
        $check = $scene->check($params);
//        if($check){
            $request->params = $params;

//        }else{
//            return fail($validate->getError());
////            dump($validate->getError());
//        }
        return $next($request);
    }
}