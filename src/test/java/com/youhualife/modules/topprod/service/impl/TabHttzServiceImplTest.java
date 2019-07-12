package com.youhualife.modules.topprod.service.impl;

import com.youhualife.modules.topprod.entity.TabHttzEntity;
import com.youhualife.modules.topprod.service.TabHttzService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class TabHttzServiceImplTest {
    @Autowired
    private TabHttzService tabHttzService;

    @Test
    public void getInfos() {
        Map<String, Object> params=new HashMap<>();
        params.put("code","3001");
        List<TabHttzEntity> infos = tabHttzService.getInfos(params);
        System.out.println(infos);
    }
}