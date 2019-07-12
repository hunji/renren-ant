package com.youhualife.modules.sendrepair.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youhualife.common.exception.RRException;
import com.youhualife.modules.sendrepair.dao.SerialNumberDao;
import com.youhualife.modules.sendrepair.entity.SerialNumberEntity;
import com.youhualife.modules.sendrepair.service.SerialNumberService;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.Date;

import static com.youhualife.common.utils.Constant.SERIALI_NUMBER_SR_ORDER;

/**
 * @author ZQ
 */
@Service("serialNumberService")
public class SerialNumberServiceImpl extends ServiceImpl<SerialNumberDao, SerialNumberEntity> implements SerialNumberService {

    @Override
    public String generateSN() {

        String SRStr = SERIALI_NUMBER_SR_ORDER+DateUtil.format(new Date(), "yyyyMMdd");
        SerialNumberEntity numberEntity = baseMapper.selectOne(
                new QueryWrapper<SerialNumberEntity>()
                        .eq("name", SRStr)
        );
            // 当前日期的如无编码，数据库中新增一条记录
        Integer nextNum=1;
        if(numberEntity==null){
            baseMapper.insert(new SerialNumberEntity(SRStr,nextNum,1));
        }else{
            // 当前日期有编码，取出后自增更新
            nextNum=numberEntity.getSerialNumber()+1;
            numberEntity.setSerialNumber(nextNum);
            if(baseMapper.update(numberEntity,
                    new UpdateWrapper<SerialNumberEntity>().eq("name",numberEntity.getName()))==0){
                throw new RRException("当前流水号已作废请重新保存");
            }
        }

        DecimalFormat df = new DecimalFormat("0000");
        return SRStr+df.format(nextNum);
    }
}
