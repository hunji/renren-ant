package com.youhualife.modules.sendrepair.service.impl;

import cn.hutool.core.convert.Convert;
import com.youhualife.common.utils.Constant;
import com.youhualife.modules.sendrepair.service.UserOccService;
import com.youhualife.modules.sys.service.SysUserRoleService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youhualife.common.utils.PageUtils;
import com.youhualife.common.utils.Query;

import com.youhualife.modules.sendrepair.dao.OrderDao;
import com.youhualife.modules.sendrepair.entity.OrderEntity;
import com.youhualife.modules.sendrepair.service.OrderService;

import static com.youhualife.common.utils.ShiroUtils.getUserId;


/**
 * @author ZQ
 */
@Service("orderService")
public class OrderServiceImpl extends ServiceImpl<OrderDao, OrderEntity> implements OrderService {
    @Autowired
    private SysUserRoleService sysUserRoleService;
    @Autowired
    private UserOccService userOccService;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        // 查询送修单时根据角色去进行数据权限限定
        // 首先排除掉admin用户
        // 默认以下三个用户只分配一个角色
        // 1.动车段（角色）用户只能看到创建人是自己的数据 createBy
        // 2.技术科（角色）用户只能看到提交上来或者是审核过的数据 OrderStatusTypeEnum>=10
        // 3.智奇用户（角色）只能看到审核通过后的数据OrderStatusTypeEnum>=20
        // 新增了客户关联的判断；审核人员只能看到已关联客户的order
        boolean hasOccJudge=false;
        Long userId = getUserId();
        List<String> occCodes = userOccService.queryOccList(userId);
        if(userId != Constant.SUPER_ADMIN){
            Integer roleId = Math.toIntExact(sysUserRoleService.queryRoleIdList(userId).get(0));
            // 增加判断用户所有客户列表；审核人员只能审核自己关联客户的order
            switch(roleId){
                case 2:
                    params.put("createBy",userId);
                    break;
                case 3:
                    params.put("status",10);
                    hasOccJudge=true;
                    break;
                case 4:
                    params.put("status",20);
                    hasOccJudge=true;
                    break;
                default:
            }
        }
        Long createBy = Convert.toLong(params.get("createBy"),null);
        Integer status = Convert.toInt(params.get("status"),null);
        // 如果是审核人员界面，而且审核人员关联的客户为空，则提前返回空数据否则in查询会报错
        if(hasOccJudge && occCodes.size()==0){
            return new PageUtils();
        }
        IPage<OrderEntity> page = this.page(
                new Query<OrderEntity>().getPage(params),
                new QueryWrapper<OrderEntity>()
                    .eq(createBy!=null ,"create_by",createBy)
                    .ge(status!=null,"status",status)
                    .in(hasOccJudge,"trustee_code",occCodes)
        );
        return new PageUtils(page);
    }

}