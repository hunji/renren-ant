package com.youhualife.modules.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.youhualife.common.validator.group.AddGroup;
import com.youhualife.common.validator.group.UpdateGroup;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * 返回给前台的用户信息DTO
 */
@Data
public class UserInfoDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long userId;
    /**
     * 用户名
     */
    private String username;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 手机号
     */
    private String mobile;

    /**
     * 状态  0：禁用   1：正常
     */
    private Integer status;

    /**
     * 创建者ID
     */
    private Long createUserId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 实际姓名
     */
    private String realName;

    /**
     * 角色ID列表
     */
    private List<Long> roles;

    /**
     * 权限列表
     */
    private Set<String> permissions;
}
