<?php

namespace app\model;

use app\model\User as UserModel;
use think\Model;
use think\model\Pivot;
use app\model\Comment as CommentModel;
class Reply extends BaseModel
{
    protected $autoWriteTimestamp = true;

    protected $hidden = ["delete_time","update_time"];
    protected $type = [
        'create_time'  =>  'dateFormat',
    ];

    //关联用户表
    public function replyUser()
    {
        return $this->belongsTo(UserModel::class,'user_id');
    }
    //关联回复表 反向
    public function replyCom()
    {
        return $this->belongsTo(CommentModel::class,'com_id');

    }
}