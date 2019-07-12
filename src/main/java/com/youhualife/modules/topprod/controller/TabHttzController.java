package com.youhualife.modules.topprod.controller;

import com.youhualife.common.utils.R;
import com.youhualife.modules.topprod.entity.TabHttzEntity;
import com.youhualife.modules.topprod.service.TabHttzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("sendrepair/tabhttz")
public class TabHttzController {
    @Autowired
    private TabHttzService tabHttzService;

    /**
     * 获取全部的客户信息
     * @param params
     * @return
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        List<TabHttzEntity> htInfos = tabHttzService.getInfos(params);
        return R.ok().put("htInfos",htInfos);
    }
}
