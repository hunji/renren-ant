package com.youhualife.modules.topprod.controller;

import com.youhualife.common.utils.R;
import com.youhualife.modules.topprod.entity.OCCEntity;
import com.youhualife.modules.topprod.service.OCCService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("sendrepair/occ")
public class OCCControler {
    @Autowired
    private OCCService occService;

    /**
     * 获取全部的客户信息
     * @param params
     * @return
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        List<OCCEntity> infos = occService.getInfos();
        return R.ok().put("occInfos",infos);
    }
}
