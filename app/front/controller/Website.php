<?php

namespace app\front\controller;

use app\model\User as UserModel;
use app\model\Article as ArticleModel;
use app\model\Station as StationModel;
use app\model\Banner as BannerModel;
use app\model\Comment as CommentModel;
use app\model\Reply as ReplyModel;
use app\model\VisitIp as VisitIpModel;
use app\front\service\Website as WebsiteService;
use think\Db;

class Website
{

    public function stationCount()
    {
        /**
         * id
         * user_count
         * top_article
         * operation
         * label_count
         * article_count
         * create_time
         */
        $user_count = UserModel::count();
        $article_count = ArticleModel::count();
        $banner_count = BannerModel::count();
        $comment_count = CommentModel::count();
        $reply_count = ReplyModel::count();
        $is_top = ArticleModel::where([
            'article_status' => 0,
            'is_top' => 1,
        ])->count();
        $station_up = StationModel::where('id', 2)->update([
            'user_count' => $user_count,
            'article_count' => $article_count,
            'banner_count' => $banner_count,
            'top_article' => $is_top,
            'comment_count' => $comment_count + $reply_count,
            'update_time' => time(),
        ]);
        if ($station_up == 1) {
            $station = StationModel::where('id', 2)->find();
            return success($station, '操作成功');

        }
        return fail('', '操作失败');
    }

    // 数据图 统计

    private static $user_count;         //用户
    private static $article_count;      //文章
    private static $comment_count;      //评论
    private static $banner_count;       //微雨
    private static $read_count;         //阅读

    private static $contain_vue;        //含vue
    private static $contain_es6;        //含es6
    private static $contain_tp6;        //含tp6
    private static $blog_active;        //活跃
    private static $blog_visit;         //访问

    //1.数据共享
    public static function data_allocation($class)
    {
        $comment = CommentModel::count();
        $reply = ReplyModel::count();
        self::$user_count = UserModel::count();
        self::$article_count = ArticleModel::count();
        self::$banner_count = BannerModel::count();
        self::$comment_count = $comment + $reply;
        self::$read_count = ArticleModel::where('article_status', 0)->sum('read_count');
        self::$contain_vue = ArticleModel::where('article_title', 'like', '%vue%')->count();
        self::$contain_es6 = ArticleModel::where('article_title', 'like', ['%es6%', '%javascript%'], 'OR')->count();
        self::$contain_tp6 = ArticleModel::where('article_title', 'like', '%tp6%')->count();

        self::$blog_active = (self::$comment_count + self::$article_count) / self::$user_count;
        self::$blog_visit = VisitIpModel::count();
        $arr_art = [
            'art_count' => self::$article_count,
            'banner_count' => self::$banner_count,
            'comment_count' => self::$comment_count
        ];
        $arr_bar = [
            'art_count' => self::$article_count,
            'banner_count' => self::$banner_count,
            'comment_count' => self::$comment_count,
            'user_count' => self::$user_count,
            'read_count' => self::$read_count,
            'contain_vue' => self::$contain_vue,
            'contain_es6' => self::$contain_es6,
            'contain_tp6' => self::$contain_tp6,
            'blog_active' => self::$blog_active,
            'blog_visit' => self::$blog_visit,
        ];
        if ($class === 'art') {
            return ($arr_art);
        } else if ($class === 'bar') {
            return ($arr_bar);
        }
        return success([]);

    }

    //1.文章数量
    public function amount_count()
    {
        $art = self::data_allocation('art');
        return success($art);
    }

    //2.柱状图
    public function barCharts()
    {
        $art = self::data_allocation('bar');
        return success($art);
    }
    //3.
    //2.柱状图


    //文章上传日志
    public function art_log()
    {
        $art_log = self::getArtTimeLineCount('art_log');
        return success($art_log);
    }
    public function line_chart()
    {
        $line_chart = self::getArtTimeLineCount('art_line_chart');
        return success($line_chart);
    }
    public static function getArtTimeLineCount($class)
    {
        $model = (new ArticleModel());
        $res_s = $model->field('FROM_UNIXTIME(create_time,"%Y-%m") as create_time')->group('create_time')->order('create_time', 'desc')->select();
        $res = self::getUnique($res_s,'create_time');
//        return $op;
        foreach ($res as $keys => &$val) {
            $time = $val['create_time'];    // 也不考虑每月多少天，就按最多的来 31天
//            dump($res[$keys]['create_time']);
            $start = $time . '-01';    // 拼接开始日期
            $end = $time . '-31';      // 拼接结束日期
            if($class == 'art_log'){
                $s = $model->whereTime('create_time', 'between', [$start, $end])->field('FROM_UNIXTIME(create_time,"%m - %d") as create_time,article_title,article_icon')->select();

            }else if($class == 'art_line_chart'){
                $s = $model->whereTime('create_time', 'between', [$start, $end])->count();

            }
            $res[$keys]['month_art'] = $s;
        }
        return $res;
    }
    /**
     *
     * 数组里的对象去重
     * （arr , key）
     */
    public static function getUnique($arr,$key)
    {
        $data = [];
        $len = count($arr);
        for ($i=0;$i<$len;$i++){
            for ($j=$i + 1;$j<$len;$j++){
                if($arr[$i][$key] === $arr[$j][$key]){
                   $j = ++ $i;
                }
            }
                array_push($data,$arr[$i]);

        }
        return $data;
    }
    //ip 访问者ip
    public function visitIp()
    {
        //获取访客ip
        $ip = WebsiteService::get_visit_ip();
        $exist = (new VisitIpModel())->where('ip', $ip)->count();
        if ($exist > 0) {
            (new VisitIpModel())->where('ip', $ip)->update([
                'update_time' => time(),
            ]);
            exit();
        }
        $inIP = (new VisitIpModel())->save(['ip' => $ip]);

        return success($inIP);

    }
}