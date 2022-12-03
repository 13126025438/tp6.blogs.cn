<?php

namespace app\front\validate;

use app\validate\BaseValidate;

class ArtContent extends BaseValidate
{
    protected $rule = [
        'article_title'  =>   ['require', 'checkStr' => '3,100'],
        'article_detail'  =>   ['require', 'checkStr' => '3,250'],
        'article_category'  =>   ['require'],
        'article_img'  =>   ['require'],
    ];

    protected $message = [
        'article_title.require'  =>  '文章标题不能为空',
        'article_detail.require'  =>  '文章简介不能为空',
        'article_category.require'  =>  '文章分类不能为空',
        'article_img.require'  =>  '文章图片不能为空',
    ];

    protected $scene = [
        'article_scene' =>  ['article_title','article_detail','article_category','article_img']
    ];
}