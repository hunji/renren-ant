package com.youhualife.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.youhualife.datasource.annotation.DataSource;
import com.youhualife.modules.sendrepair.dao.SerialNumberDao;
import com.youhualife.modules.topprod.dao.CXFDao;
import com.youhualife.modules.topprod.dao.OCCDao;
import com.youhualife.modules.topprod.entity.CXFEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DynamicDataSourceTestService2 {
    @Autowired
    private CXFDao cxfDao;
    @Autowired
    private SerialNumberDao serialNumberDao;
    @Autowired
    private OCCDao occDao;

    @Transactional
    @DataSource("slave1")
    public void selectTest(){
        cxfDao.selectCount(new QueryWrapper<CXFEntity>() );
    }

    @DataSource("slave1")
    public void selectTest2(){
        occDao.selectCount(new QueryWrapper<>());
    }
}
