package com.youhualife.modules.sendrepair.controller;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import com.youhualife.common.exception.RRException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import com.youhualife.modules.sendrepair.entity.OrderWheelInfoEntity;
import com.youhualife.modules.sendrepair.service.OrderWheelInfoService;
import com.youhualife.common.utils.PageUtils;
import com.youhualife.common.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.youhualife.common.utils.ShiroUtils.getUserId;

/**
 * 
 *
 * @author hunji
 * @email guo194194@163.com
 * @date 2019-06-04 14:19:44
 */
@RestController
@RequestMapping("sendrepair/orderwheelinfo")
public class OrderWheelInfoController {
    @Autowired
    private OrderWheelInfoService orderWheelInfoService;

    /**
     * 列表
     */
    @GetMapping("/list")
    @RequiresPermissions("sendrepair:orderwheelinfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = orderWheelInfoService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    @RequiresPermissions("sendrepair:orderwheelinfo:info")
    public R info(@PathVariable("id") Long id){
		OrderWheelInfoEntity orderWheelInfo = orderWheelInfoService.getById(id);

        return R.ok().put("orderWheelInfo", orderWheelInfo);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    @RequiresPermissions("sendrepair:orderwheelinfo:save")
    public R save(@RequestBody OrderWheelInfoEntity orderWheelInfo){
        orderWheelInfo.setCreateBy(getUserId());
        orderWheelInfo.setCreatedDate(new Date());
		orderWheelInfoService.save(orderWheelInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @PostMapping("/update")
    @RequiresPermissions("sendrepair:orderwheelinfo:update")
    public R update(@RequestBody OrderWheelInfoEntity orderWheelInfo){
		orderWheelInfoService.updateById(orderWheelInfo);

        return R.ok();
    }
    /**
     * 删除
     */
    @PostMapping("/delete")
    @RequiresPermissions("sendrepair:orderwheelinfo:delete")
    public R delete(@RequestBody Long[] ids){
		orderWheelInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

    /**
     * 批量上传
     */
    @PostMapping("/upload")
    @Transactional(rollbackFor = RuntimeException.class)
    public R upload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (file.isEmpty()) {
            throw new RRException("上传文件不能为空");
        }
        if(!file.getOriginalFilename().endsWith(".xls")){
            throw new RRException("文件类型需为excel");
        }
        String orderId = request.getParameter("orderId");
        ExcelReader reader = ExcelUtil.getReader(file.getInputStream());
        List<Map<String,Object>> readAll = reader.readAll();
        for (Map<String,Object> item:readAll) {
            OrderWheelInfoEntity entity=new OrderWheelInfoEntity();
            entity.setCreateBy(getUserId());
            entity.setCreatedDate(new Date());
            entity.setSrOrderId(Long.parseLong(orderId));
            entity.setOperatingInterval(String.valueOf(item.get("运营区间")));
            entity.setTrainNumber(String.valueOf(item.get("所属列车编号")));
            entity.setTrainFormation(String.valueOf(item.get("列车编组")));
            entity.setPosition(String.valueOf(item.get("所在车、轴、位")));
            entity.setWheelNum(String.valueOf(item.get("轮对号")));
            entity.setAlxeNum(String.valueOf(item.get("车轴号")));
            entity.setGearboxNum(String.valueOf(item.get("齿轮箱号")));
            if(String.valueOf(item.get("齿轮箱号")).equals("是")){
                entity.setHasFour(true);
                try{
                    entity.setFourMile(Integer.parseInt((String) item.get("四级修时走行公里数")));
                }catch (Exception ex){
                }
            }else{
                entity.setHasFour(false);
            }
            entity.setReason(String.valueOf(item.get("送修原因")));
            entity.setSuggest(String.valueOf(item.get("建议检修内容")));
            entity.setTroubleShooting(String.valueOf(item.get("近期轮对较大故障处理清单")));
            if(String.valueOf(item.get("左端是否带轴承")).equals("是")){
                entity.setHasLeftBearing(true);
                entity.setLiftBearingMile(String.valueOf(item.get("左轴承运行里程数")));
            }else{
                entity.setHasLeftBearing(false);
            }

            if(String.valueOf(item.get("右端是否带轴承")).equals("是")){
                entity.setHasRightBearing(true);
                entity.setRightBearingMile(String.valueOf(item.get("右轴承运行里程数")));
            }else{
                entity.setHasRightBearing(false);
            }
            entity.setRemark(String.valueOf(item.get("备注")));
            orderWheelInfoService.save(entity);
        }
        return R.ok();
    }
}
