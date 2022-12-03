<?php

namespace app\front\middleware;
use app\front\validate\User as UserValidate;
use app\lib\exception\Miss;
use app\model\User as UserModel;

class User
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
        //登录
        $params = $request->param();
        $validate = validate(UserValidate::class);
        $scene = $validate->scene('login');
        $data = $scene->check($params);
        $user = (new UserModel())->checkLogin($params['username'], md5($params['password']));
//        dump($params);
        if(!$user){
            $regUser =(new UserModel())->checkRegister($params['username']);

            if($regUser){
                throw new \Exception('账号密码错误');
            }else{
                throw new \Exception('账号不存在');

            }
        }else{
            $params = [];
            $params['id'] = $user['id'];
            $params['scope'] = $user['scope'];
            $request->params = $params;
        }
        return $next($request);
    }
}