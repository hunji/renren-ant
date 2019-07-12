package com.youhualife.modules.sendrepair.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.youhualife.common.utils.PageUtils;
import com.youhualife.modules.sendrepair.entity.OrderEntity;

import java.util.Map;

/**
 * 
 *
 * @author hunji
 * @email guo194194@163.com
 * @date 2019-06-04 14:19:44
 */
public interface OrderService extends IService<OrderEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

