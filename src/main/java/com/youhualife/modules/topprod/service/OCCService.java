package com.youhualife.modules.topprod.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.youhualife.modules.topprod.entity.OCCEntity;

import java.util.List;

public interface OCCService extends IService<OCCEntity> {
    List<OCCEntity> getInfos();

    /**
     * 根据occ01返回客户信息
     * @param codes
     * @return
     */
    List<OCCEntity> getByOcc01(List<String> codes);
}
