<?php

namespace app\model;

class User extends BaseModel
{
    protected $hidden = ["delete_time","update_time"];
    protected $type = [
        'create_time'  =>  'dateFormat',
    ];

    public function checkLogin($username,$password)
    {
        return self::where(['username'  =>  $username, 'password'  => $password])->find();
    }
    public function checkRegister($username)
    {
        return self::where(['username'  =>  $username])->find();
    }
    //关联 banner
    public function bannerHas()
    {
        return $this->hasOne(Banner::class,'user_id');
    }
}