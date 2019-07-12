package com.youhualife.modules.topprod.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.youhualife.datasource.annotation.DataSource;
import com.youhualife.modules.topprod.dao.OCCDao;
import com.youhualife.modules.topprod.entity.OCCEntity;
import com.youhualife.modules.topprod.service.OCCService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class OCCServiceImplTest {
    @Autowired
    private OCCService occService;

    @Test
    public void generateSN() {
        List<OCCEntity> list = occService.getInfos();
        System.out.println(list);
    }

}