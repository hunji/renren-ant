package com.youhualife.modules.sendrepair.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 审批信息
 * @author ZQ
 */
@Data
@TableName("sr_approval")
public class ApprovalEntity implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId
    private Long id;
    /**
     *  关联的送修单Id
     */
    private Long orderId;
    /**
     *  审批人
     */
    private String name;
    /**
     *  审批时间
     */
    private Date createdTime;
    /**
     * 审批意见
     */
    private String comments;
    /**
     * 审批状态
     * 1.通过
     * 0.不通过
     */
    private boolean status;

}
