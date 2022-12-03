<?php

namespace app\front\controller;

use app\Request;
use app\front\service\User as UserService;
use app\model\User as UserModel;
use app\model\Article as ArticleModel;
use app\model\Banner as BannerModel;
class User
{
    //登录获取token
    public function checkLogin(Request $request)
    {
        $params =$request->params;
        $token = (new UserService())->getToken($params);
        $uid = $params['id'];
        $user = (new UserModel())->where('id',$uid)->field(['username','id'])->find();
        $data = [
          'token'   =>  $token,
          'user'      =>  $user
        ];
        return success($data,'登录成功');
    }

    //注册
    public function register(Request $request)
    {

        $params = $request->newUser;
        return success([],'注册成功');
    }

    //验证身份token
    public function info(Request $request)
    {
        $uid = $request->uid;
        $user = (new UserModel())->where('id',$uid)->field(['username','id'])->find();
        return success($user,'登录成功');
    }

    //获取用户信息
    public function getUser(Request $request)
    {
        $params = $request->param();
        $user_id = $params['id'];
        if(!$user_id){
            return fail([],'id不能为空');
        }
//        $artNum = ArticleModel::where([
//            'user_id'      =>   $user_id,
//            'article_status' => 0
//        ])->count();
//        $banNum = BannerModel::where('user_id',$user_id)->count();
        $user = UserModel::where('id',$user_id)->field([
            'id',
            'username',
            'user_img',
            'user_banner',
            'user_comment',
            'user_article',
            'create_time',
            'last_ip',
            'user_role',
            'access_count'
            ])->find();
//        $data = [
//            'art_num' => $banNum,
//            'ban_num'  => $banNum,
//            'user'  => $user
//        ];
        return success($user);
    }

//    public function save()
//    {
//
//    }
//    public function delete()
//    {
//
//    }
//    public function update()
//    {
//
//    }
//    public function read()
//    {
//
//    }

}