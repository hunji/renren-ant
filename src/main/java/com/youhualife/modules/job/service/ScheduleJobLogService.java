package com.youhualife.modules.job.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.youhualife.common.utils.PageUtils;
import com.youhualife.modules.job.entity.ScheduleJobLogEntity;

import java.util.Map;

/**
 * 定时任务日志
 *
 * @author hunji
 */
public interface ScheduleJobLogService extends IService<ScheduleJobLogEntity> {

	PageUtils queryPage(Map<String, Object> params);
	
}
