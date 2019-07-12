package com.youhualife.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.youhualife.modules.sys.entity.SysCaptchaEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 验证码
 *
 * @author hunji
 */
@Mapper
public interface SysCaptchaDao extends BaseMapper<SysCaptchaEntity> {

}
