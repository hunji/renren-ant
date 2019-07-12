package com.youhualife.modules.sendrepair.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * 
 * @author hunji
 * @email guo194194@163.com
 * @date 2019-06-04 14:19:44
 */
@Data
@TableName("sr_order_wheel_info")
public class OrderWheelInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 运营区间
	 */
	private String operatingInterval;
	/**
	 * 列车编号
	 */
	private String trainNumber;
	/**
	 * 列车编组
	 */
	private String trainFormation;
	/**
	 * 所在车、轴、位
	 */
	private String position;
	/**
	 * 轮对号
	 */
	private String wheelNum;
	/**
	 * 车轴号
	 */
	private String alxeNum;
	/**
	 * 齿轮箱号
	 */
	private String gearboxNum;
	/**
	 * 是否有四级修记录
	 */
	private Boolean hasFour;
	/**
	 * 四级修时走行公里数
	 */
	private Integer fourMile;
	/**
	 * 轮对运行里程
	 */
	private Integer mile;
	/**
	 * 送修原因
	 */
	private String reason;
	/**
	 * 建议检修内容
	 */
	private String suggest;
	/**
	 * 近期轮对较大故障处理清单
	 */
	private String troubleShooting;
	/**
	 * 左端是否带轴承
	 */
	private Boolean hasLeftBearing;
	/**
	 * 右端是否带轴承
	 */
	private Boolean hasRightBearing;
	/**
	 * 左轴承运行里程数
	 */
	private String liftBearingMile;
	/**
	 * 右轴承运行里程数
	 */
	private String rightBearingMile;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 创建人
	 */
	private Long createBy;
	/**
	 * 创建时间
	 */
	private Date createdDate;

	/**
	 * 关联sr_order表
	 */
	@TableField("sr_order_id")
	private Long srOrderId;

}
