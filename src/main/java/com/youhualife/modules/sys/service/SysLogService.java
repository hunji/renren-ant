package com.youhualife.modules.sys.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.youhualife.common.utils.PageUtils;
import com.youhualife.modules.sys.entity.SysLogEntity;

import java.util.Map;


/**
 * 系统日志
 *
 * @author hunji
 */
public interface SysLogService extends IService<SysLogEntity> {

    PageUtils queryPage(Map<String, Object> params);

}
