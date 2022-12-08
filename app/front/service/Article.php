<?php

namespace app\front\service;
use app\model\Article as ArticleModel;
use app\model\ArtContent as ArtContentModel;
use app\model\User as UserModel;
use think\facade\Db;

class Article
{
    /**
     * @param $date
     * @return mixed
     * {
     *  "	user_id" : 1,
        "article_title": "的",
        "article_detail": "多dsfasfas",
        "article_category": "hgf",
     *   "article_status"  : 0,
        "article_img": "f.jpg",
        "art_arr": {
        "md_url": "f.md"
            }
        }
     */
    public static function add_article($date)
    {
        $art_arr = null;
        $art_arr['user_id'] = $date['user_id'];
        $art_arr['article_title'] = $date['article_title'];
        $art_arr['article_detail'] = $date['article_detail'];
        $art_arr['article_category'] = $date['article_category'];
        $art_arr['article_status'] = $date['article_status'];
        $art_arr['article_img'] = $date['article_img'];
        $art_arr['article_read_icon'] = $date['article_read_icon'] == '' ? 'icon-redu' :$date['article_read_icon']; //icon图标
        $art_arr['article_time_icon'] = $date['article_time_icon'] == '' ? 'icon-bolanggu' : $date['article_time_icon'];
        $art_arr['article_class_icon'] = $date['article_class_icon'] == '' ? 'icon--' : $date['article_class_icon'];
        $art_arr['article_it_icon'] = $date['article_it_icon'] == '' ? 'icon-konglong' :$date['article_it_icon'];
        $art_arr['article_icon'] = $date['article_icon']  == '' ?  'icon-biaoqing' : $date['article_icon'] ;


        Db::startTrans();
        try {
            $article = (new ArticleModel())->create($art_arr);
            if(!$article){
                throw new \Exception('新增文章失败-article');
            }
            $countArt= (new UserModel())->where('id',$article->user_id)->inc('user_article',1)->update();
            $art_id = $article->id;
            $art_uid = $article->user_id;
            $art_content = null;
            $art_content['user_id'] = $art_uid;
            $art_content['art_id'] = $art_id;
            $art_content['cont_html_txt'] = $date['art_arr_cont']['cont_html_txt'];
            $art_content['cont_md_txt'] = $date['art_arr_cont']['cont_md_txt'];
            $art_content['cont_md_url'] = $date['art_arr_cont']['cont_md_url'];
            $art_cont = (new ArtContentModel())->create($art_content);
            if($art_cont){
                $art_cont_id = $art_cont->id;
                $datas = [
                    'art_id'=> $art_id,
                    'art_cont_id'=> $art_cont_id,
                    'art_uid'=> $art_uid
                ];
//                halt($datas);
                return $datas;
            }
        Db::commit();
        }catch (\Exception $e){
            Db::rollback();
            throw new \Exception('新增文章失败');
        }

//        return true;
    }

    //分页
    public static function art_page($page,$pageSize)
    {
        $artPage = ArticleModel::where('article_status',0)->field('
        FROM_UNIXTIME(create_time,"%Y 年 %m 月 %d 日") as create_time,
        article_category,article_class_icon,article_content,article_detail,article_icon,article_img,
        article_it_icon,article_read_icon,article_status,article_time_icon,article_title,id,is_top,read_count,user_id

        ')->page($page,$pageSize)->order('id','desc')->select();
        $total = ArticleModel::where('article_status',0)->count();
        $data = [
            'total' => $total,
            'page'  =>  $page,
            'pageSize'=> $pageSize,
            'data'  =>  $artPage
        ];
        return $data;
    }
}