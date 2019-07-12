package com.youhualife.modules.sendrepair.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author ZQ
 */
@Data
public class UserOccSaveDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long userId;

    /**
     * 客户编号列表
     */
    private List<String> occList;
}
