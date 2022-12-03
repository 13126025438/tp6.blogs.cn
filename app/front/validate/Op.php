<?php

namespace app\front\validate;

use app\validate\BaseValidate;

class Op extends BaseValidate
{
    protected $rule = [
        'file'  =>  'file|fileExt:md',
        'image'  =>  'image|fileExt:jpg,png,gif'
    ];

    protected $message = [
        'file.fileExt'  =>  '文件类型只支持md',
        'image.fileExt'  =>  '文件类型只支持-jpg,png,gif',
        'file.file'  =>  '请上传md文件',
        'image.image'  =>  '请上传图片',
    ];

    protected $scene = [
        'image' => ['image'],
        'file' => ['file'],
    ];
}