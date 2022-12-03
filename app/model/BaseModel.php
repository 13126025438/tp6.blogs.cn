<?php

namespace app\model;

use think\Model;
use think\model\concern\SoftDelete;

class BaseModel extends Model
{
    protected $autoWriteTimestamp = true;
    protected $hidden = ["delete_time","create_time","update_time"];

    use SoftDelete;
    protected $deleteTime = 'delete_time';

}