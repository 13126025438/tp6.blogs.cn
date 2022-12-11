<?php

namespace app\front\service;
use app\model\User as UserModel;
class User
{
    public function getToken($params)
    {
        $uid = $params['id'];
        $scope = $params['scope'];
        $values = [
          'uid' =>  $uid,
          'scope'=> $scope
        ];

        $token = $this->saveToken($values);

        $data = [
          'last_ip'     =>  get_client_ip(),
          'last_time'   =>  time(),
          'last_token'  =>  $token
        ];
       (new UserModel())->where('id',$uid)->save($data);
        return $token;
    }

    private function saveToken($values)
    {
        $token = $this->genrateToken();
        $expire_in = config('code.expire_in');
        $result = cache($token, $values ,$expire_in);
        if(!$result){
            throw new \Exception('服务器异常');
        }
        return $token;
    }

    //生成token
    private function genrateToken()
    {
        $randStr = getRandChar(32);
        $timestamp = $_SERVER['REQUEST_TIME']; //服务器执行 获取时间戳
        $token_salt = config('code.token_salt');
        return md5($randStr . $timestamp . $token_salt);
    }


}