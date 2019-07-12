package com.youhualife.modules.sendrepair.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class EnumDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer key;
    private String label;
    private String value;

    public EnumDTO(Integer key, String label, String value) {
        this.key = key;
        this.label = label;
        this.value = value;
    }
}
