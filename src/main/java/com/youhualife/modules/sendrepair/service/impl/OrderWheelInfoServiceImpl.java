package com.youhualife.modules.sendrepair.service.impl;
import cn.hutool.core.convert.Convert;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youhualife.common.utils.PageUtils;
import com.youhualife.common.utils.Query;
import com.youhualife.modules.sendrepair.dao.OrderWheelInfoDao;
import com.youhualife.modules.sendrepair.entity.OrderWheelInfoEntity;
import com.youhualife.modules.sendrepair.service.OrderWheelInfoService;


/**
 * @author ZQ
 */
@Service("orderWheelInfoService")
public class OrderWheelInfoServiceImpl extends ServiceImpl<OrderWheelInfoDao, OrderWheelInfoEntity> implements OrderWheelInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        Long orderId = Convert.toLong(params.get("orderId"),null);
        IPage<OrderWheelInfoEntity> page = this.page(
                new Query<OrderWheelInfoEntity>().getPage(params),
                new QueryWrapper<OrderWheelInfoEntity>()
                        .eq(orderId!=null,"sr_order_id", orderId)
        );

        return new PageUtils(page);
    }

}