package com.youhualife.modules.sendrepair.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;

/**
 * @author ZQ
 */

public enum OrderStatusTypeEnum {
    Created(0, "创建"),
    Initiated(10, "发起"),
    Approved(20, "审核通过"),
    Refused(19, "审核不通过");

    OrderStatusTypeEnum(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    @EnumValue
    private final int code;
    private final String desc;

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
