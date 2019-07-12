package com.youhualife.modules.topprod.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 客户信息表
 * @author ZQ
 */
@Data
@TableName("occ_file")
public class OCCEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 客户编号
     */
    @TableField("OCC01")
    private String OCC01;

    /**
     * 简称
     */
    @TableField("OCC02")
    private String OCC02;

    /**
     * 全称
     */
    @TableField("OCC18")
    private String OCC18;
}
