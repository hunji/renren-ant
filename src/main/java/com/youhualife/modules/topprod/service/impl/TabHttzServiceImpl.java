package com.youhualife.modules.topprod.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youhualife.datasource.annotation.DataSource;
import com.youhualife.modules.topprod.dao.TabHttzDao;
import com.youhualife.modules.topprod.entity.TabHttzEntity;
import com.youhualife.modules.topprod.service.TabHttzService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author ZQ
 */
@Service("TabHttzService")
public class TabHttzServiceImpl extends ServiceImpl<TabHttzDao, TabHttzEntity> implements TabHttzService {
    @Override
    @DataSource("slave1")
    public List<TabHttzEntity> getInfos(Map<String, Object> params) {
        String code = (String)params.get("code");
        return this.list(
                new QueryWrapper<TabHttzEntity>()
                .isNull("C026")
                .eq(code!=null,"C027",code)
        );
    }
}
