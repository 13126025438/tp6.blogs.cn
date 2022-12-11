<?php

namespace app\front\controller;

use app\model\ArtContent;
use app\Request;
use app\front\service\Article as ArticleService;
use app\model\Article as ArticleModel;
class Article
{
    //新增文章
    public function article_add(Request $request)
    {
        $params = $request->params;
        $newDate = (new ArticleService())->add_Article($params);
//        halt($newDate->data);
        return success($newDate,'新增文章成功');
    }

    //获取文章
    public function getArticle(Request $request)
    {
        $params = $request->param();
        $id = $params['id'];
        $article =ArticleModel::where([
            'id'    =>  $id,
            'article_status' => 0
        ])->find();
        if(!$article){
            return fail('','文章不存在');
        }
        return success($article,'获取文章成功');
    }
    //获取文章 分页
    public function getArticlePage(Request $request)
    {
        $params = $request->param();
        if(!array_key_exists('page',$params) || !array_key_exists('pageSize',$params)){
            return  fail('','参数不足');
        }
        $page = $params['page'];
        $pageSize = $params['pageSize'];

        $article = (new ArticleService())->art_page($page,$pageSize);

        return success($article,'获取文章成功');
    }
    //获取文章的内容
    public function getArtDetail(Request $request)
    {
        $params = $request->param();
        $art_id = $params['art_id'];
        $detail = ArtContent::where('art_id',$art_id)->find();
        if(!$detail){
            return fail('','找不数据');
        }
        return success($detail,'操作成功');
    }
    //获取随机文章、
    public function randArticle()
    {
        $rand_art = ArticleModel::orderRaw('rand()')->limit(5)->field('
         FROM_UNIXTIME(create_time,"%Y 年 %m 月 %d 日") as create_time,
        article_category,article_class_icon,article_content,article_detail,article_icon,article_img,
        article_it_icon,article_read_icon,article_status,article_time_icon,article_title,id,is_top,read_count,user_id
        ')->select();
        if(!$rand_art){
            return fail('','获取随机文章出错了');
        }
        return success($rand_art,'获取随机文章成功');
    }
    //文章搜索
    public function search(Request $request)
    {
        $params = $request->param();
        $keyword = $params['keyword'];
        if(!$keyword){
            return fail('','请输入搜索关键词');
        }
        $val = ArticleModel::withSearch(['article_title'],[
            'article_title' => $keyword
        ])->field('
          FROM_UNIXTIME(create_time,"%Y 年 %m 月 %d 日") as create_time,
        article_category,article_class_icon,article_content,article_detail,article_icon,article_img,
        article_it_icon,article_read_icon,article_status,article_time_icon,article_title,id,is_top,read_count,user_id

        ')->select();
//        if(!$val){
//            return fail('','搜索不到，换个词试试');
//        }

        return success($val , '搜索结果');
    }
    //获取用户文章 id => user_id
    public function getUserArt(Request $request)
    {
        $params = $request->param();
        $user_id = $params['id'];
        if(!$user_id){
            return fail([],'id不能为空');
        }
        $userArt = ArticleModel::where([
            'user_id' => $user_id,
        ])->field('
          FROM_UNIXTIME(create_time,"%Y 年 %m 月 %d 日") as create_time,
        article_category,article_class_icon,article_content,article_detail,article_icon,article_img,
        article_it_icon,article_read_icon,article_status,article_time_icon,article_title,id,is_top,read_count,user_id

        ')->select();
        if(sizeof($userArt) < 1){
            return success([],'您暂未发布文章，快去试试吧！');
        }
        return success($userArt);
    }
    //文章阅读数量 + 1
    public function addArtReadCount(Request $request){
        $params = $request->param();
        $art_id = $params['art_id'];
        if(!$art_id){
            return fail([],'文章id丢失');
        }
        $readCount = (new ArticleModel())->where('id',$art_id)->inc('read_count',1)->update();
        return success($readCount);
    }
    //分类二级导航获取文章
    public function get_cate_art(Request $request)
    {
        $params = $request->param();
        $cate = $params['category'];
        $article =ArticleModel::where([
            'article_category'    =>  $cate,
            'article_status' => 0
        ])->field('
         FROM_UNIXTIME(create_time,"%Y 年 %m 月 %d 日") as create_time,
        article_category,article_class_icon,article_content,article_detail,article_icon,article_img,
        article_it_icon,article_read_icon,article_status,article_time_icon,article_title,id,is_top,read_count,user_id
        ')->select();
        if(!$cate){
            return fail('','分类二级导航category参数不能为空');
        }
        if(!(count($article) > 0)){
            return fail($article,'没找到文章');
        }
        return success($article,'获取分类二级导航获取文章成功');
    }
}