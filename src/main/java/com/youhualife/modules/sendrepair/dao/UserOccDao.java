package com.youhualife.modules.sendrepair.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.youhualife.modules.sendrepair.entity.UserOccEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserOccDao extends BaseMapper<UserOccEntity> {
    List<String> queryOccList(Long userId);
}
