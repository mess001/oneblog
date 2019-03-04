<?php
// +---------------------------------------------------------------------+
// | OneBase    | [ WE CAN DO IT JUST THINK ]                            |
// +---------------------------------------------------------------------+
// | Licensed   | http://www.apache.org/licenses/LICENSE-2.0 )           |
// +---------------------------------------------------------------------+
// | Author     | Bigotry <3162875@qq.com>                               |
// +---------------------------------------------------------------------+
// | Repository | https://gitee.com/Bigotry/OneBase                      |
// +---------------------------------------------------------------------+

namespace app\home\controller;
use think\Db;

/**
 * 友情链接控制器
 */
class Link extends IndexBase
{
    

    
    // 详情
    public function index()
    {
        $list=model('blogroll')->where(['status'=>1])->order('sort desc,create_time desc')->select();
        $this->assign('link_list',$list);
        return $this->fetch('index');
    }
    public function test(){
        $a=file_get_contents('./a.txt');
        $arr=explode('</p>',$a);
        $new=[];
        foreach($arr as $k=>$v){
            if($k%2==0){
                $new[floor($k/2)]['en']=trim($this->diff_dian(trim($v)));
            }else{
                $new[floor($k/2)]['cn']=strip_tags(trim($v));
            }
        }
        $model=Db::name('word')->insertAll($new);
//        foreach($new as $v){
//            if(isset($v['en'])&&isset($v['cn'])){
//                $model->insert($v);
//            }
//        }
    }
    public function diff_dian($str){
        if(strpos($str,'.')){
           $str= str_replace('&nbsp;','',substr(strstr($str,'.'),1,strlen(strstr($str,'.'))));
        }
        return $str;
    }

}
