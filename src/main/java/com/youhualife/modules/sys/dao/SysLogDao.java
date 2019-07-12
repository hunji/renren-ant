package com.youhualife.modules.sys.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.youhualife.modules.sys.entity.SysLogEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 系统日志
 *
 * @author hunji
 */
@Mapper
public interface SysLogDao extends BaseMapper<SysLogEntity> {
	
}
