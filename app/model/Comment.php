<?php

namespace app\model;

use think\Model;
use app\model\User as UserModel;
use app\model\Reply as ReplyModel;
class Comment extends BaseModel
{
    protected $hidden = ["delete_time","update_time"];
    protected $type = [
        'create_time'  =>  'dateFormat',
    ];

    //关联用户表
    public function comUser()
    {
        return $this->belongsTo(UserModel::class,'user_id');
    }
    //关联回复表
    public function reply()
    {
        return $this->hasMany(ReplyModel::class,'com_id');

    }

}