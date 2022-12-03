<?php

namespace app\front\controller;

use app\Request;
use app\front\service\Banner as BannerService;
use app\model\Banner as BannerModel;
use app\model\User as UserModel;
use think\db\Query;

class Banner
{
    public function addBanner(Request $request)
    {
        $params = $request->params;
        $banner = BannerService::writeBanner($params);
        if($banner){
            return success($banner,'发布成功');
        }else{
            return fail([],'新增微语失败了！');
        }
    }

    public function getBanner(Request $request)
    {
//        $banner = BannerModel::where('banner_status',0)->limit(5)->order('id desc')->select();
        $banner = BannerModel::with(['user'=>function($query){
            $query->field(['id','username','user_img']);
        }])->orderRaw('rand()')->limit(5)->order('id','desc')->select();
        if((count($banner)<1)){
            return fail([],'没有数据');
        }
        return success($banner);
    }

    public function getUserBanner(Request $request)
    {
        $user_id = $request->param('user_id');
        if(!$user_id){
            return fail([],'用户信息丢失，请先登录');
        }
        $banner = BannerModel::with(['user'=>function($query){
            $query->field(['id','username','user_img']);
        }])->where('user_id',$user_id)->limit(10)->order('id','desc')->select();

        return success($banner);
    }

    //
    public function getAllBanner(Request $request)
    {
//        $banner = BannerModel::where('banner_status',0)->limit(5)->order('id desc')->select();
        $banner = BannerModel::with(['user'=>function($query){
            $query->field(['id','username','user_img']);
        }])->order('id','desc')->select();
        if((count($banner)<1)){
            return fail([],'没有数据');
        }
        return success($banner);
    }

}