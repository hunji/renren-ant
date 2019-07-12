package com.youhualife;

import com.youhualife.service.DynamicDataSourceTestService;
import com.youhualife.service.DynamicDataSourceTestService2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * 多数据源测试
 *
 * @author hunji
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class DynamicDataSourceTest {
    @Autowired
    private DynamicDataSourceTestService dynamicDataSourceTestService;

    @Autowired
    private DynamicDataSourceTestService2 dynamicDataSourceTestService2;

    @Test
    public void test(){
        Long id = 1L;

        dynamicDataSourceTestService.updateUser(id);
        dynamicDataSourceTestService.updateUserBySlave1(id);
        dynamicDataSourceTestService.updateUserBySlave2(id);
    }

    @Test
    public void test2(){
        dynamicDataSourceTestService2.selectTest();
    }

    @Test
    public void test3(){
        dynamicDataSourceTestService2.selectTest2();
    }
}
