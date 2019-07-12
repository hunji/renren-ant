package com.youhualife.modules.sendrepair.controller;

import com.youhualife.common.utils.R;
import com.youhualife.modules.sendrepair.dto.EnumDTO;
import com.youhualife.modules.sendrepair.entity.enums.OrderStatusTypeEnum;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("enum")
public class EnumController {
    @ApiOperation("取得状态枚举")
    @GetMapping("/status")
    public R getGradeEnum(){
        List<EnumDTO> infos=new ArrayList<>();
        for (OrderStatusTypeEnum item : OrderStatusTypeEnum.values()){
            infos.add(new EnumDTO(item.getCode(),item.getDesc(),item.toString()));
        }
        return R.ok().put("statusInfo",infos);
    }
}
