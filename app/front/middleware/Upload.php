<?php

namespace app\front\middleware;

//use think\facade\Filesystem;
use think\facade\Filesystem;
use think\facade\Request;
use app\front\validate\Upload as UploadValidate;
class Upload
{
    public function handle($request, \Closure $next)
    {
        $fileExtArr = $request->param();
        $fileExt = $fileExtArr['fileExt'];
        $file = Request::file($fileExt);
//        $file = request()->file();
//          dump($file,$fileExt);
        $validate = validate(UploadValidate::class)->check([
            $fileExt  =>  $file
        ]);
//        halt($validate);
        if($validate){
            $info = Filesystem::disk('public')->putFile('toplic',$file);

            $request->infoUrl = $info;

        }else{
            dump($validate->getError());
        }

        return $next($request);
    }

}