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

namespace app\admin\controller;
use app\common\controller\ControllerBase;
use app\common\logic\File as LogicFile;

/**
 * Widget控制器
 */
class Widget extends ControllerBase
{
    
    /**
     * 获取区域选项信息
     */
    public function getRegionOptions($upid = 0, $level = 1, $select_id = 0)
    {
        
        return $this->logicRegion->getRegionOptions($upid, $level, $select_id);
    }
    
    /**
     * 编辑器图片上传
     */
    public function editorPictureUpload()
    {
        pd($_FILES);
        $result = get_sington_object('fileLogic', LogicFile::class)->pictureUpload('imgFile');
        
        $data  = false === $result ? [RESULT_ERROR => DATA_NORMAL, RESULT_MESSAGE => '文件上传失败'] : [RESULT_ERROR => DATA_DISABLE, RESULT_URL => get_picture_url($result['id'])];
        
        return throw_response_exception($data);
    }
    /**
     * markdown图片上传
     */
    public function editormdPictureUpload()
    {
        $result = get_sington_object('fileLogic', LogicFile::class)->pictureUpload('editormd-image-file');
//        期望返回值
//        {
//            success : 0 | 1, //0表示上传失败;1表示上传成功
//            message : "提示的信息",
//            url     : "图片地址" //上传成功时才返回
//        }
        $data  = false === $result ? ['success' => DATA_ERROR, 'message' => '文件上传失败','url' => ''] : ['success' => DATA_SUCCESS, 'message' => '文件上传成功', 'url' => get_picture_url($result['id'])];

        return throw_response_exception($data);
    }
}
