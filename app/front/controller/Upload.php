<?php

namespace app\front\controller;

use app\Request;

class Upload
{
    public function upFile(Request $request)
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers:http://localhost:8080");
        $infoUrl = $request->infoUrl;
        $url = str_replace('\\', '/',$infoUrl);
        $root = $request->host();
        $urls = 'http://'.$root .'/'.$url;
//        http://blogs.xiaxianxian.top/toplic/20221121/0f4aa2ba61fdb7f434f369b716a038f4.png
        $date = [
            'url' => $urls
        ];
       return success($date , '上传成功');
    }
}