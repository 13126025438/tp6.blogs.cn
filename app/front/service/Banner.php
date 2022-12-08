<?php

namespace app\front\service;
use app\model\Banner as BannerModel;
use app\model\User as UserModel;
class Banner
{
    public static function writeBanner($params)
    {
//        $params = $params;
        $banner = (new BannerModel())->save($params);

        if($banner){
            (new UserModel())->where('id',$params['user_id'])->inc('user_banner',1)->update();
        }
            return $banner;

    }
}