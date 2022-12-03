<?php

namespace app\front\controller;
use app\model\User as UserModel;
use app\model\Article as ArticleModel;
use app\model\Station as StationModel;
use app\model\Banner as BannerModel;
class Website
{
    public function stationCount()
    {
/**
 * id
user_count
top_article
operation
label_count
article_count
create_time
 */
        $user_count = UserModel::count();
        $article_count = ArticleModel::count();
        $banner_count = BannerModel::count();
        $is_top = ArticleModel::where([
            'article_status'    =>  0,
            'is_top'            =>  1,
        ])->count();
        $station_up = StationModel::where('id' , 2 )->update([
            'user_count'        =>      $user_count,
            'article_count'     =>      $article_count,
            'banner_count'      =>      $banner_count,
            'top_article'       =>      $is_top,
            'update_time'       =>      time(),
        ]);
        if($station_up == 1){
            $station = StationModel::where('id',2)->find();
            return success([$station],'操作成功');

        }
        return fail('','操作失败');
    }
}