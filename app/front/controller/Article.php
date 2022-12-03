<?php

namespace app\front\controller;

use app\model\ArtContent;
use app\Request;
use app\front\service\Article as ArticleService;
use app\model\Article as ArticleModel;
class Article
{
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
        $rand_art = ArticleModel::orderRaw('rand()')->limit(5)->select();
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
        ])->select();
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
        ])->select();
        if(sizeof($userArt) < 1){
            return success([],'您暂未发布文章，快去试试吧！');
        }
        return success($userArt);
    }
}