package com.youhualife.modules.sendrepair.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.youhualife.modules.sendrepair.entity.SerialNumberEntity;

public interface SerialNumberService extends IService<SerialNumberEntity> {
    String generateSN();
}
