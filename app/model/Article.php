<?php

namespace app\model;

class Article extends BaseModel
{
    protected $hidden = ["delete_time","update_time"];
    protected $dateFormat = 'Y-m-d H:i:s';
    protected $type = [
        'create_time' => 'Y-m',
    ];

    public function searchArticleTitleAttr($query, $value, $data)
    {
        $query->where('article_title','like','%'. $value .'%');
    }
}