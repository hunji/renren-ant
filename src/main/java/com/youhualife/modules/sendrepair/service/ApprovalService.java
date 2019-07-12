package com.youhualife.modules.sendrepair.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.youhualife.common.utils.PageUtils;
import com.youhualife.modules.sendrepair.entity.ApprovalEntity;

import java.util.List;
import java.util.Map;

/**
 * @author ZQ
 */
public interface ApprovalService extends IService<ApprovalEntity> {
    PageUtils queryPage(Map<String, Object> params);
    List<ApprovalEntity> selectByOrderId(Long orderId);
}
