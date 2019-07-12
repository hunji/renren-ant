package com.youhualife.modules.sendrepair.service.impl;

import com.youhualife.modules.sendrepair.service.UserOccService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class UserOccServiceImplTest {
    @Autowired
    private UserOccService userOccService;

    @Test
    public void queryOccList() {
        List<String> strings = userOccService.queryOccList(1L);
        System.out.println(strings);
    }
}