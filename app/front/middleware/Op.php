<?php

namespace app\front\middleware;

use app\front\validate\Upload as UploadValidate;
use think\exception\ValidateException;
use think\facade\Filesystem;
use think\facade\Request;
use app\front\validate\Op as OpValidate;
class Op
{
    public function handle($request, \Closure $next)
    {
        $fileExt = $request->param('fileExt');
            $file = $request->file($fileExt);
//            halt($fileExt,$file);
        if(!$file){
            return  fail('路径对应文件类型出错');
        }
        try {
            $validate = validate(OpValidate::class)->scene($fileExt)->check([
                $fileExt  =>  $file
            ]);

            if($validate){
                $info = Filesystem::disk('public')->putFile('toplic',$file);

                $request->infoUrl = $info;

            }
        }catch (ValidateException $e){
            return fail(['msg' => $e->getError()]);

        }
//        $validate = validate(OpValidate::class)->scene($fileExt)->check([
//            $fileExt  =>  $file
//        ]);
//
//        if($validate){
//            $info = Filesystem::disk('public')->putFile('toplic',$file);
//
//            $request->infoUrl = $info;
//
//        }else{
//            return fail(['msg' => $validate->getError()]);
//        }
//        halt($validate);
//        $info = Filesystem::disk('public')->putfile('topic', $file);
//        $data = [
//                'url'=>$info
//            ];
//            return success($data,'上传成功');
//        $file = Request::file($fileExt);
//        $file = request()->file();
//          dump($file,$fileExt);
//        $validate = validate(UploadValidate::class)->check([
//            $fileExt  =>  $file
//        ]);

//        if($validate){
//            $info = Filesystem::disk('public')->putFile('toplic',$file);
//
//            $request->infoUrl = $info;
//
//        }else{
//            dump($validate->getError());
//        }

        return $next($request);
    }
}