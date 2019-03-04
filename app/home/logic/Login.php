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
 * 登录逻辑
 */
class Login extends IndexBase
{
    
    /**
     * 登录处理
     */
    public function loginHandle($username = '', $password = '', $verify = '')
    {
        
        $validate_result = $this->validateLogin->scene('login')->check(compact('username','password','verify'));
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateLogin->getError()];
        }
        
        $member = $this->modelUser->getInfo(['username' => $username]);
        if (!empty($member['password']) && data_md5_key($password) == $member['password']) {
            
            $this->logicUser->setMemberValue(['id' => $member['id']], TIME_UT_NAME, TIME_NOW);

            $auth = ['member_id' => $member['id'], TIME_UT_NAME => TIME_NOW];

            session('user_info', $member);

            return [RESULT_SUCCESS, '登录成功'];
            
        } else {
            
            $error = empty($member['id']) ? '用户账号不存在' : '密码输入错误';
            
            return [RESULT_ERROR, $error];
        }
    }
    public function register($data){

        $validate_result = $this->validateUser->scene('register')->check($data);
        if (!$validate_result) {

            return [RESULT_ERROR, $this->validateUser->getError()];
        }
        $data['password']=data_md5_key($data['password']);
        $result = $this->modelUser->setInfo($data);

        return $result ? [RESULT_SUCCESS, '注册成功'] : [RESULT_ERROR, $this->modelUser->getError()];

    }
    
    /**
     * 注销当前用户
     */
    public function logout()
    {
        
        clear_login_session();
        
        return [RESULT_SUCCESS, '退出成功'];
    }
    
    /**
     * 清理缓存
     */
    public function clearCache()
    {
        
        \think\Cache::clear();
        
        return [RESULT_SUCCESS, '清理成功', url('index/index')];
    }
}
