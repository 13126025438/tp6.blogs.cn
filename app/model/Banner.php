<?php

namespace app\model;

class Banner extends BaseModel
{
    protected $hidden = ["delete_time","update_time"];
    protected $type = [
        'create_time'  =>  'dateFormat',
    ];

    public function user()
    {
       return $this->belongsTo(User::class);
    }
}