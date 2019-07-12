package com.youhualife.modules.sendrepair.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.Version;
import lombok.Data;

import java.io.Serializable;

/**
 * 序列号
 * @author ZQ
 */
@Data
@TableName("sr_serial_number")
public class SerialNumberEntity implements Serializable {
    private static final long serialVersionUID = 1L;
    private String name;
    private Integer serialNumber;
    @Version
    private Integer version;

    public SerialNumberEntity(String name, Integer serialNumber, Integer version) {
        this.name = name;
        this.serialNumber = serialNumber;
        this.version = version;
    }

    public SerialNumberEntity() {
    }
}
