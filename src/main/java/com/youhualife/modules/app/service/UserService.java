package com.youhualife.modules.app.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.youhualife.modules.app.entity.UserEntity;
import com.youhualife.modules.app.form.LoginForm;

/**
 * 用户
 *
 * @author hunji
 */
public interface UserService extends IService<UserEntity> {

	UserEntity queryByMobile(String mobile);

	/**
	 * 用户登录
	 * @param form    登录表单
	 * @return        返回用户ID
	 */
	long login(LoginForm form);
}
