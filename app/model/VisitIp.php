<?php

namespace app\model;

class VisitIp extends BaseModel
{
    protected $hidden = ["delete_time","update_time"];
    protected $type = [
        'create_time'  =>  'dateFormat',
    ];
}