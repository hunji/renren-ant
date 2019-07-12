package com.youhualife.modules.sendrepair.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.youhualife.modules.sendrepair.dto.UserOccSaveDTO;
import com.youhualife.modules.sendrepair.entity.UserOccEntity;

import java.util.List;

public interface UserOccService extends IService<UserOccEntity> {
    void saveOrUpdate(UserOccSaveDTO dto);
    List<String> queryOccList(Long userId);
}
