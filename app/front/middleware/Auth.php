<?php

namespace app\front\middleware;
use app\front\service\Token as TokenService;
use app\lib\exception\Forbidden;

class Auth
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
        //
        $token = $request->header('token');
        if(!$token){
            throw new Forbidden();
        }else{
            $uid = TokenService::checkPrimaryScope($token);
            $request->uid = $uid;
        }

        return $next($request);
    }
}