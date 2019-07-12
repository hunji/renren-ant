package com.youhualife.modules.topprod.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youhualife.datasource.annotation.DataSource;
import com.youhualife.modules.topprod.dao.OCCDao;
import com.youhualife.modules.topprod.entity.OCCEntity;
import com.youhualife.modules.topprod.service.OCCService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("OCCService")
public class OCCServiceImpl extends ServiceImpl<OCCDao, OCCEntity> implements OCCService {

    @Override
    @DataSource("slave1")
    public List<OCCEntity> getInfos() {
        return this.list();
    }

    @Override
    @DataSource("slave1")
    public List<OCCEntity> getByOcc01(List<String> codes) {
        List<OCCEntity> list = this.list(new QueryWrapper<OCCEntity>().in("occ01", codes));
        return list;
    }
}
