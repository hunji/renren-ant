package com.youhualife.modules.sendrepair.service.impl;

import cn.hutool.core.date.DateUtil;
import com.youhualife.modules.sendrepair.service.SerialNumberService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@Slf4j
public class SerialNumberServiceImplTest {
    @Autowired
    private SerialNumberService serialNumberService;

    @Test
    @Transactional
    public void generateSN() {
        String yyyyMMdd = DateUtil.format(new Date(), "yyyyMMdd");
        String s = serialNumberService.generateSN();
        Assert.assertEquals(s,"SRNO"+yyyyMMdd+"0001");
        s = serialNumberService.generateSN();
        Assert.assertEquals(s,"SRNO"+yyyyMMdd+"0002");
        s = serialNumberService.generateSN();
        Assert.assertEquals(s,"SRNO"+yyyyMMdd+"0003");
        s = serialNumberService.generateSN();
        Assert.assertEquals(s,"SRNO"+yyyyMMdd+"0004");

    }
}