package com.youhualife.modules.topprod.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("TC_SFCXF_FILE")
public class CXFEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    private String xf001;
    private String xf002;
    private String xf003;
    private String xf004;
    private String xf005;
    private String xf006;
    private String xf007;
    private String xf008;
    private String xf009;
    private String xf010;
}
