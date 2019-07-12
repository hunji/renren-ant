package com.youhualife.modules.sendrepair.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.youhualife.common.utils.PageUtils;
import com.youhualife.modules.sendrepair.entity.OrderWheelInfoEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author hunji
 * @email guo194194@163.com
 * @date 2019-06-04 14:19:44
 */
public interface OrderWheelInfoService extends IService<OrderWheelInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

