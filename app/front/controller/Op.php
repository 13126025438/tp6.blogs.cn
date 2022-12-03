<?php

namespace app\front\controller;

use app\Request;
use think\facade\Filesystem;
//use think\facade\Request;
use think\facade\Validate;

class Op
{
    public function ups(Request $request)
    {
        $infoUrl = $request->infoUrl;
        $url = str_replace('\\', '/',$infoUrl);
        $root = $request->host();
        $urls = 'http://'.$root .'/'.$url;
        $date = [
            'url' => $urls
        ];
        return success($date , '上传成功');
//        $file = Request::file('image');
//        $fileExt = $request->param('fileExt');
//            $file = $request->file($fileExt);
        //编写规则
//        $validate = Validate::rule([
//            'image'     =>      'file|fileExt:jpg,png,gif'
//        ]);

        //验证规则
//        $result = $validate->check([
//            'image'     =>      $file
//        ]);

        //正确输出地址，错误提示
//        if ($result) {
//            $info = Filesystem::disk('public')->putfile('topic', $file);
//            $data = [
//                'url'=>$info
//            ];
//            return success($data,'上传成功');
////            return json($data,201);
//        } else {
//            dump($validate->getError());
//        }



    }
}