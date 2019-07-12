package com.youhualife.modules.oss.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.youhualife.common.utils.PageUtils;
import com.youhualife.modules.oss.entity.SysOssEntity;

import java.util.Map;

/**
 * 文件上传
 *
 * @author hunji
 */
public interface SysOssService extends IService<SysOssEntity> {

	PageUtils queryPage(Map<String, Object> params);
}
