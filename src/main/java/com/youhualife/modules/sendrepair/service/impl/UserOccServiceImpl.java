package com.youhualife.modules.sendrepair.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youhualife.modules.sendrepair.dao.UserOccDao;
import com.youhualife.modules.sendrepair.dto.UserOccSaveDTO;
import com.youhualife.modules.sendrepair.entity.UserOccEntity;
import com.youhualife.modules.sendrepair.service.UserOccService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author ZQ
 */
@Service("userOccService")
public class UserOccServiceImpl extends ServiceImpl<UserOccDao, UserOccEntity> implements UserOccService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveOrUpdate(UserOccSaveDTO dto) {
        // 先删除之前的关联信息
        this.remove(new QueryWrapper<UserOccEntity>().eq("user_id",dto.getUserId()));

        if(dto.getOccList().size()==0){
            return;
        }
        // 保存用户和客户的关联关系
        for (String occ:dto.getOccList()) {
            UserOccEntity entity=new UserOccEntity();
            entity.setOcc01(occ);
            entity.setUserId(dto.getUserId());
            this.save(entity);
        }
    }

    @Override
    public List<String> queryOccList(Long userId) {
        return baseMapper.queryOccList(userId);
    }
}
