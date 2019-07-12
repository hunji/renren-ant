package com.youhualife.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.youhualife.modules.sys.entity.SysUserTokenEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 系统用户Token
 *
 * @author hunji
 */
@Mapper
public interface SysUserTokenDao extends BaseMapper<SysUserTokenEntity> {

    SysUserTokenEntity queryByToken(String token);
	
}
