<?php

namespace app\model;

class Article extends BaseModel
{
    protected $hidden = ["delete_time","update_time"];
    protected $dateFormat = 'Y 年 m 月 d 日';

    public function searchArticleTitleAttr($query, $value, $data)
    {
        $query->where('article_title','like','%'. $value .'%');
    }
}