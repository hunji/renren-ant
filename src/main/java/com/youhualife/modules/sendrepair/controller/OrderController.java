package com.youhualife.modules.sendrepair.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.youhualife.modules.sendrepair.entity.ApprovalEntity;
import com.youhualife.modules.sendrepair.entity.enums.OrderStatusTypeEnum;
import com.youhualife.modules.sendrepair.service.ApprovalService;
import com.youhualife.modules.sendrepair.service.SerialNumberService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import com.youhualife.modules.sendrepair.entity.OrderEntity;
import com.youhualife.modules.sendrepair.service.OrderService;
import com.youhualife.common.utils.PageUtils;
import com.youhualife.common.utils.R;

import static com.youhualife.common.utils.ShiroUtils.getUserEntity;
import static com.youhualife.common.utils.ShiroUtils.getUserId;


/**
 * 
 *
 * @author hunji
 * @email guo194194@163.com
 * @date 2019-06-04 14:19:44
 */
@RestController
@RequestMapping("sendrepair/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private SerialNumberService serialNumberService;
    @Autowired
    private ApprovalService approvalService;

    /**
     * 列表
     */
    @GetMapping("/list")
    @RequiresPermissions("sendrepair:order:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = orderService.queryPage(params);

        return R.ok().put("page", page);
    }

    @GetMapping("allInfo")
    public R allInfo(){
        List<OrderEntity> list = orderService.list();
        return R.ok().put("allInfo",list);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    @RequiresPermissions("sendrepair:order:info")
    public R info(@PathVariable("id") Long id){
		OrderEntity order = orderService.getById(id);

        return R.ok().put("order", order);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    @RequiresPermissions("sendrepair:order:save")
    public R save(@RequestBody OrderEntity order){
        order.setSerialNumber(serialNumberService.generateSN());
        order.setCreateBy(getUserId());
        order.setCreatedDate(new Date());
        // 增加了创建状态标识字段
        order.setStatus(OrderStatusTypeEnum.Created);
		orderService.save(order);

        return R.ok();
    }

    /**
     * 修改
     */
    @PostMapping("/update")
    @RequiresPermissions("sendrepair:order:update")
    public R update(@RequestBody OrderEntity order){
		orderService.updateById(order);

        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    @RequiresPermissions("sendrepair:order:delete")
    public R delete(@RequestBody Long[] ids){
		orderService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

    /**
     * 发起 Initiate
     * @param id
     * @return
     */
    @PostMapping("/initiate/{id}")
    @RequiresPermissions("sendrepair:order:initiate")
    @Transactional(rollbackFor = RuntimeException.class )
    public R initiate(@PathVariable("id") Long id){
        // 1.保存审批信息
        ApprovalEntity approval=new ApprovalEntity();
        approval.setCreatedTime(new Date());
        approval.setOrderId(id);
        approval.setName(getUserEntity().getUsername());
        approval.setStatus(true);
        approvalService.save(approval);
        // 2.修改送修单状态
        OrderEntity order = orderService.getById(id);
        order.setStatus(OrderStatusTypeEnum.Initiated);

        orderService.updateById(order);
        return R.ok();
    }

    /**
     * 审核通过 Approve
     * @param id
     * @return
     */
    @PostMapping("/approve")
    @RequiresPermissions("sendrepair:order:approve")
    @Transactional(rollbackFor = RuntimeException.class )
    public R Approve(@RequestBody ApprovalEntity approval){
        // 1.保存审批信息
        approval.setName(getUserEntity().getUsername());
        approval.setCreatedTime(new Date());
        approvalService.save(approval);
        // 2.修改送修单状态
        OrderEntity order = orderService.getById(approval.getOrderId());
            //根据前台传来的值更新order的状态
        if(approval.isStatus()){
            order.setStatus(OrderStatusTypeEnum.Approved);
        }else{
            order.setStatus(OrderStatusTypeEnum.Refused);
        }
        orderService.updateById(order);
        return R.ok();
    }
}
