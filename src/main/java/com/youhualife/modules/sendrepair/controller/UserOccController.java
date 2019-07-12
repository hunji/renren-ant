package com.youhualife.modules.sendrepair.controller;

import com.youhualife.common.utils.R;
import com.youhualife.modules.sendrepair.dto.UserOccSaveDTO;
import com.youhualife.modules.sendrepair.service.UserOccService;
import com.youhualife.modules.topprod.entity.OCCEntity;
import com.youhualife.modules.topprod.service.OCCService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

import static com.youhualife.common.utils.ShiroUtils.getUserId;

@RestController
@RequestMapping("sendrepair/userocc")
public class UserOccController {
    @Autowired
    private UserOccService userOccService;
    @Autowired
    private OCCService occService;
    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody UserOccSaveDTO dto){
        userOccService.saveOrUpdate(dto);
        return R.ok();
    }

    /**
     * 根据用户编号获取到客户列表
     * @param userId
     * @return
     */
    @GetMapping("/info/{userId}")
    public R occInfo(@PathVariable("userId") Long userId){
        //  根据当前登录用户id来获取客户里列表
        if(userId==0){
            userId=getUserId();
        }
        // 如果是系统管理员可以查到所有客户
        if(userId==1){
            return R.ok().put("occList",occService.getInfos());
        }
        List<String> occCodes = userOccService.queryOccList(userId);
        List<OCCEntity> occList =new ArrayList<>();
        if(occCodes.size()>0){
            occList= occService.getByOcc01(occCodes);
        }
        return R.ok().put("occList",occList);
    }
}
