<?php

namespace app\front\service;

use app\lib\exception\Forbidden;
use app\lib\exception\TokenException;
use think\facade\Cache;
use function Symfony\Component\VarDumper\Dumper\esc;

class Token
{
    private static $token = "";
    public static function checkPrimaryScope($token)
    {
       self::$token = $token;
//        halt($token);
       $scope = self::getCurrentTokenVar('scope');
       if(!$scope){
           throw new TokenException();
       }else{
           if($scope >= config('code.user_scope')){
                $uid = self::getCurrentTokenVar('uid');
                return $uid;
           }else{
               throw new Forbidden();
           }
       }
    }

    private static function getCurrentTokenVar(string $key)
    {
        $vars = \cache(self::$token);
        if(!$vars){
            throw new TokenException();
        }else{
       if (!is_array($vars)){
            $vars = json_decode($vars,true);
        }
       if (array_key_exists($key,$vars)){
            return $vars[$key];
        }else{
           throw new TokenException(['msg' => '权限不够']);
       }
        }
    }

}