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

namespace app\admin\widget;

/**
 * 编辑器小物件
 */
class Editor extends WidgetBase
{
    
    /**
     * 显示编辑器
     */
    public function index($name = '', $value = '')
    {
        
        $widget_config['editor_height'] = '300px';
        $widget_config['editor_resize_type'] = 1;
        
        $this->assign('widget_config', $widget_config);
        $this->assign('widget_data', compact('name', 'value'));
        
        return $this->fetch('admin@widget/editor/index');
    }

    /**
     * Notes:百度编辑器
     *
     * @param string $name
     * @param string $value
     * @param
     *
     * @return mixed
     * @author 张浩
     * @date   2019/2/26 0026 11:32
     */
    public function baidu($name = '', $value = '')
    {

        $widget_config['editor_height'] = '300';
        $widget_config['editor_resize_type'] = 1;

        $this->assign('widget_config', $widget_config);
//        p(IS_PJAX);die;
//        $this->assign('is_pjax', IS_PJAX?1:0);
        $this->assign('widget_data', compact('name', 'value'));

        return $this->fetch('admin@widget/editor/baidufinal');
    }
    /**
     * Markdown编辑器
     */
    public function markdown($name = '', $value = '')
    {

        $widget_config['editor_height'] = '300px';
        $widget_config['editor_resize_type'] = 1;

        $this->assign('widget_config', $widget_config);
        $this->assign('widget_data', compact('name', 'value'));

        return $this->fetch('admin@widget/editor/markdown');
    }
}
