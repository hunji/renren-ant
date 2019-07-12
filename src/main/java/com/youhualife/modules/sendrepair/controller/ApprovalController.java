package com.youhualife.modules.sendrepair.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.youhualife.common.utils.R;
import com.youhualife.modules.sendrepair.entity.ApprovalEntity;
import com.youhualife.modules.sendrepair.service.ApprovalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @author ZQ
 */
@RestController
@RequestMapping("sendrepair/approval")
public class ApprovalController {
    @Autowired
    private ApprovalService approvalService;

    /**
     * 列表
     * 根据orderid查找流转过程
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        Long orderId =Long.parseLong(params.get("orderId").toString());
        List<ApprovalEntity> approvalList = approvalService.list(
                new QueryWrapper<ApprovalEntity>().eq("order_id", orderId)
        );
        return R.ok().put("approvalList", approvalList);
    }
}
