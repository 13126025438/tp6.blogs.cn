<?php

namespace app\front\validate;

use app\validate\BaseValidate;

class Article extends BaseValidate
{
    protected $rule = [
        'user_id'   => ['require'],
        'article_title'  =>   ['require', 'checkStr' => '3,100'],
        'article_detail'  =>   ['require', 'checkStr' => '3,550'],
        'article_category'  =>   ['require'],
        'article_img'  =>   ['require'],
        'art_arr_cont'  =>   ['require'],
    ];

    protected $message = [
        'user_id.require'  =>  '作者id不能为空',
        'article_title.require'  =>  '文章标题不能为空',
        'article_detail.require'  =>  '文章简介不能为空',
        'article_category.require'  =>  '文章分类不能为空',
        'article_img.require'  =>  '文章图片不能为空',
        'art_arr_cont.require'  =>  '文章具体内容太不能为空',
    ];

    protected $scene = [
        'article_scene' =>  ['article_title','article_detail','article_category','article_img','art_arr']
    ];

}