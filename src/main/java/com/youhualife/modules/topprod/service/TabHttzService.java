package com.youhualife.modules.topprod.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.youhualife.modules.topprod.entity.TabHttzEntity;

import java.util.List;
import java.util.Map;

/**
 * @author ZQ
 */
public interface TabHttzService extends IService<TabHttzEntity> {
    /**
     * 根据客户编号查找合同号
     * @param code
     * @return
     */
    List<TabHttzEntity> getInfos(Map<String, Object> params);
}
