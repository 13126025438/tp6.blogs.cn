<?php

namespace app\model;

class Station extends BaseModel
{
    protected $hidden = ["delete_time","update_time"];
    protected $dateFormat = 'Y 年 m 月 d 日';
//    protected $type = [
//        'create_time'  =>  'dateFormat',
//    ];
}