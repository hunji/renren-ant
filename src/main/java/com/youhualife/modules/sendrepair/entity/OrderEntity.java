package com.youhualife.modules.sendrepair.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import com.youhualife.modules.sendrepair.entity.enums.OrderStatusTypeEnum;
import lombok.Data;

/**
 * 
 * 
 * @author hunji
 * @email guo194194@163.com
 * @date 2019-06-04 14:19:44
 */
@Data
@TableName("sr_order")
public class OrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 委托单位名称
	 */
	private String trusteeName;
	/**
	 * 委托单位编号
	 */

	private String trusteeCode;
	/**
	 * 联系人
	 */
	private String contactName;
	/**
	 * 联系人电话
	 */
	private String contactPhone;
	/**
	 * 关联合同主键
	 */
	private String contractId;
	/**
	 * 合同号
	 */
	private String contractCode;
	/**
	 * 轮对型号
	 */
	private String wheelModel;
	/**
	 * 送修车间（所）
	 */
	private String workshop;
	/**
	 * 送修日期
	 */
	private Date sendDate;
	/**
	 * 维修地点
	 */
	private String sendPlace;
	/**
	 * 创建时间
	 */
	private Date createdDate;
	/**
	 * 创建人
	 */
	private Long createBy;

	/**
	 * 序列号
	 */
	private String serialNumber;

	private OrderStatusTypeEnum status;

}
