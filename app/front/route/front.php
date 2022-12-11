<?php

use think\facade\Route;

//登录
Route::rule('login','User/checkLogin','post')->middleware([\app\front\middleware\User::class]);
//注册
Route::rule('register','User/register','post')->middleware([\app\front\middleware\Register::class]);
////用户登录资源路由
//Route::resource('login_account','User')->middleware([\app\front\middleware\User::class]);

//Auth token授权 获取用户信息
Route::rule('info','User/info')->middleware([\app\front\middleware\Auth::class]);
//article
//Route::rule('article_add','Article/article_add')->middleware([
//    \app\front\middleware\Auth::class,
//    \app\front\middleware\Article::class
//]);
// 需要授权fenzu ->middleware([\app\front\middleware\Auth::class])
Route::group(function (){
    Route::rule('article_add','Article/article_add','post')->middleware([\app\front\middleware\Article::class]);
});
//article getArticlePage
Route::rule('get_article','Article/getArticle');
Route::rule('get_article_page','Article/getArticlePage','get');
Route::rule('get_art_detail','Article/getArtDetail','get');
//文章阅读数量 + 1
Route::rule('add_art_read_count','Article/addArtReadCount');
//随机文章
Route::rule('rand_article','Article/randArticle');
Route::rule('search','Article/search'); //搜索
Route::rule('get_user_art','Article/getUserArt','get');//获取用户的文章 params id
Route::rule('get_cate_art','Article/get_cate_art','get');//获取分类二级的文章


//文件上传
Route::rule('upload-<fileExt>','Upload/upFile','post')->middleware([\app\front\middleware\Upload::class]);
Route::rule('ups-<fileExt>','Op/ups','post')->middleware([\app\front\middleware\Op::class]);

//Route::rule('toplic','public/toplic');

Route::rule('*')->allowCrossDomain();

//test
Route::rule('art_test','Test/artTest','post');

//站点统计
Route::rule('station_count','Website/stationCount');
//echarts 图表数据
Route::rule('amount_count','/Website/amount_count');
Route::rule('barCharts','/Website/barCharts');
Route::rule('visit_ip','Website/visitIp'); //记录访问ip
Route::rule('art_log','Website/art_log'); //记录访问ip
Route::rule('line_chart','Website/line_chart'); //记录访问ip line_chart
Route::rule('category_count','Website/category_count'); //category_count 分类统计 图

//user
Route::rule('get_user','User/getUser');

//banner
Route::rule('add_banner','Banner/addBanner','post')->middleware([\app\front\middleware\Banner::class]);
Route::rule('get_banner','Banner/getBanner');
Route::rule('get_user_banner','Banner/getUserBanner');
Route::rule('get_all_banner','Banner/getAllBanner');

//评论 comment
Route::rule('add_comment','Comment/addComment')->middleware([\app\front\middleware\Comment::class]);
Route::rule('add_reply','Reply/addReply')->middleware([\app\front\middleware\Reply::class]);
// 获取评论 {art_id}
Route::rule('get_comment','Comment/getComment','get');