package com.youhualife.modules.topprod.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youhualife.modules.topprod.dao.CXFDao;
import com.youhualife.modules.topprod.entity.CXFEntity;
import com.youhualife.modules.topprod.service.CXFService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("CXFService")
public class CXFServiceImpl  extends ServiceImpl<CXFDao, CXFEntity> implements CXFService {
}
