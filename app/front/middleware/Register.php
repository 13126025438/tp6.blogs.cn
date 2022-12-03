<?php

namespace app\front\middleware;
use app\front\validate\Register as RegisterValidate;
use app\model\User as UserModel;
use app\lib\exception\Register as RegisterException;
class Register
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
        $regValidate=validate(RegisterValidate::class);
        $scene = $regValidate->scene('register');
        $reg = $scene->check($params);

        $regUser =(new UserModel())->checkRegister($params['username']);
        if(!$regUser){
            $newUser = (new UserModel())->save([
                'username'  =>  $params['username'],
                'password'  =>  md5($params['password'])
            ]);
//            halt($newUser);
            $request->newUser = $newUser;
        }else{
            throw new \Exception('用户名被占用');
        }
        return $next($request);
    }
}