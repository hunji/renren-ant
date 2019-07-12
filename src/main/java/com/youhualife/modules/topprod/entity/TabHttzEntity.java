package com.youhualife.modules.topprod.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 合同信息
 * @author ZQ
 */
@Data
@TableName("tc_tab_httz")
public class TabHttzEntity implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 日期
     */
    @TableField("C001")
    private String C001;
    /**
     * 合同号
     */
    @TableField("C002")
    private String C002;
    /**
     * 客户
     */
    @TableField("C003")
    private String C003;
    /**
     * 类型
     */
    @TableField("C004")
    private String C004;
    /**
     *
     */
    @TableField("C005")
    private String C005;
    @TableField("C006")
    private String C006;
    @TableField("C007")
    private String C007;
    @TableField("C008")
    private String C008;
    /**
     * 截止日期
     */
    @TableField("C026")
    private String C026;
    /**
     * 客户编号
     */
    @TableField("C027")
    private String C027;
}
