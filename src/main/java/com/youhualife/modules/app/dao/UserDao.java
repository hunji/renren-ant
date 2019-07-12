package com.youhualife.modules.app.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.youhualife.modules.app.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户
 *
 * @author hunji
 */
@Mapper
public interface UserDao extends BaseMapper<UserEntity> {

}
