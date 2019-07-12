package com.youhualife.modules.sendrepair.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youhualife.common.utils.PageUtils;
import com.youhualife.common.utils.Query;
import com.youhualife.modules.sendrepair.dao.ApprovalDao;
import com.youhualife.modules.sendrepair.entity.ApprovalEntity;
import com.youhualife.modules.sendrepair.service.ApprovalService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author ZQ
 */
@Service("approvalService")
public class ApprovalServiceImpl extends ServiceImpl<ApprovalDao, ApprovalEntity> implements ApprovalService {
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ApprovalEntity> page = this.page(
                new Query<ApprovalEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<ApprovalEntity> selectByOrderId(Long orderId){

        List<ApprovalEntity> entities = this.list(
                new QueryWrapper<ApprovalEntity>()
                        .eq("order_id", orderId)
                        .orderByAsc("id")
        );
        return entities;
    }
}
