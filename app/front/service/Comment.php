<?php

namespace app\front\service;
use app\model\Comment as CommentModel;
use app\model\Reply as ReplyModel;
use app\model\User as UserModel;
class Comment
{
    //评论
    public static function writeCom($params)
    {
        if(!array_key_exists('user_id',$params) && !array_key_exists('com_qq',$params) && !array_key_exists('com_email',$params)){
            return false;
        }else{
            if(($params['user_id'] || $params['com_qq'] || $params['com_email'] ) == ''){
                return false;
            }
        }

        $write = (new CommentModel())->save($params);
        if($write){
            (new UserModel())->where('id',$params['user_id'])->inc('user_comment',1)->update();
        }
//  return fail('','至少填一个身份才能评论喔！（QQ /邮箱 /登录）');

        return $write;
    }

    //获取评论 处理评论信息返回
    public static function comReplyConduct($art_id)
    {
//        $com = CommentModel::where('art_id',$art_id)->select();
        $com = CommentModel::with([
            'comUser'=>function($query){
            $query->field(['id','username','user_img','user_role']);
        },'reply'=>function($query){
            }
        ])->where('art_id',$art_id)->select();

        foreach ($com as $key => &$vs) {
//            $com[$key]['reply']
            $arr = $vs['reply'];
            foreach ($arr as $keys => &$val) {
                $arr[$keys]['user_id'] = $val['user_id'];
                $user = UserModel::where('id',$arr[$keys]['user_id'] )->field(['id','username','user_img','user_role'])->find();

                $arr[$keys]['reply_uid'] = $val['reply_uid'];
                $reply_user = UserModel::where('id', $arr[$keys]['reply_uid'] )->field(['id','username','user_img','user_role'])->find();
                $arr[$keys]['user'] = $user;
                $arr[$keys]['reply_user'] = $reply_user;

            }
        }

//        $sql = CommentModel::where('art_id',$art_id)->select();
//        foreach ($sql  as $key => &$vs) {
//            $sql[$key]['user_id'] = $vs['user_id'];
//            $user = UserModel::where('id', $sql[$key]['user_id'])->field(['id','username','user_img'])->find();
//            $sql[$key]['user'] = $user;
//            }
        return  $com;
    }
}