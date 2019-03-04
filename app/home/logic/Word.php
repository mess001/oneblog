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

namespace app\home\logic;

/**
 * 每日一句
 */
class Word extends IndexBase
{

    /**
     * 随机获取一条信息
     */
    public function getRandRow()
    {
        $id=rand(1,231);
        return $this->modelWord->getInfo(['id'=>$id]);
    }
}
