package org.test.common.constants;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public final class JunoConstants {

	public final static String ROOT = "全部";
	/**
	 * 行业资讯
	 */
	public static final String INFORMATION = "行业资讯";
	/**
	 * 投资信息
	 */
	public static final String INVESTMENT = "投资信息";
	/**
	 * 融资信息
	 */
	public static final String FINANCING = "融资信息";

	public static final String SYSTEM_ENCODE = "UTF-8";
	public static final String ANONYMOUS_USER = "anonymousUser";
	/**
	 * 临时系统用户名
	 */
	public static final String TEMP_SYSTEM_USER_NAME = "易联";
	/**
	 * 临时系统用户id
	 */
	public static final String TEMP_SYSTEM_USER_ID = "1";
	/**
	 * 已审核
	 */
	public static final String AUDIT_STATUS_1 = "1";
	/**
	 * 未审核
	 */
	public static final String AUDIT_STATUS_0 = "0";
	/**
	 * 审核未通过
	 */
	public static final String AUDIT_STATUS_2 = "2";
	/**
	 * 需求汇总表状态 0-无效 1-有效
	 */
	public static final String INFD_STATUS_1 = "1";
	public static final String INFD_STATUS_0 = "0";
	/**
	 * 系统帐户
	 */
	public static final long SYSTEM_ID = 10L;
	/**
	 * 匿名帐户
	 */
	public static final long ANONYMOUS_ID = 11L;
	/**
	 * 年月日
	 */
	public static DateFormat df = new SimpleDateFormat("yyyy年MM月dd日");
	/**
	 * 年月日时分秒
	 */
	public static DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	/**
	 * 年月日时分
	 */
	public static DateFormat df1 = new SimpleDateFormat("yyyy年MM月dd日 HH点mm分");
	/**
	 * 年-月-日
	 */
	public static DateFormat df3 = new SimpleDateFormat("yyyy-MM-dd");
	/**
	 * 年月日
	 */
	public static DateFormat df4 = new SimpleDateFormat("yyyyMMdd");
	/**
	 * 年月日时分秒(yyyyMMddHHmmss)
	 */
	public static DateFormat df5 = new SimpleDateFormat("yyyyMMddHHmmss");
	/**
	 * 金额123,123.23
	 */
	public static DecimalFormat dfmt = new DecimalFormat("#,###.##");
	/**
	 * 金额23123.00
	 */
	public static DecimalFormat dfmt1 = new DecimalFormat("##.00");
	/**
	 * 无效
	 */
	public static final String INFORMATION_NOT_STATUS = "0";
	/**
	 * 有效
	 */
	public static final String INFORMATION_STATUS = "1";

	public static final String INFORMATIONDEMAND_MEMBERNAME = "易联";
	/**
	 * 未审核
	 */
	public static final String INFORMATIONDEMAND_UNCHECK = "0";

	/**
	 * 在线状态
	 */
	public enum OnLineState {
		OFF_LINE/** 离线 */
		, ON_LINE/** 在线 */
		;
	}

	public static final String JUNO_ADMIN = "/juno-admin";

	/**
	 * 资讯发布人
	 */
	public static final String JUNO_PUBLISHER_NAME = "易联";

	/**
	 * 资讯发布人ID
	 */
	public static final Long JUNO_PUBLISHER_ID = 1L;
	/**
	 * 未阅读
	 */
	public static final String READ_STATUS_0 = "0";

	/**
	 * 融资数据状态 有效
	 */
	public static final String FINANCING_STATUS_1 = "1";

	/**
	 * 融资数据状态 无效
	 */
	public static final String FINANCING_STATUS_0 = "0";

	/**
	 * 投资数据状态 有效
	 */
	public static final String INVESTMENT_STATUS_1 = "1";

	/**
	 * 投资数据状态 无效
	 */
	public static final String INVESTMENT_STATUS_0 = "0";
	public static final String INFORMCTION_DEMAND_VALID = "1";

	/**
	 * 评论状态 :0表示无效,1表示有效
	 */
	public static final String COMMENTS_STATUS_0 = "0";
	public static final String COMMENTS_STATUS_1 = "1";
	/**
	 * 删除操作状态返回值 :0表示操作成功,其他表示操作失败
	 */
	public static final int DELETE_STATUS_0 = 0;

	/**
	 * 默认的发布浏览量为0
	 */
	public static final Long INFORMATION_PV_0 = 0L;
	public static final String SORT_CREATED_DATE = "createdDate";
	/**
	 * 邮箱校验：0未激活，1为已激活
	 */
	public static final String EAMIL_VALIDATE_0 = "0";
	public static final String EAMIL_VALIDATE_1 = "1";

	public static final String DESCRIPTION_FINANCING = "易联社区融资频道汇集企业融资，小贷，保理，融资租赁等融资项目。";
	public static final String KEYWORDS_FINANCING = "融资信息、融资项目、企业融资";
	public static final String DESCRIPTION_INVESTMENT = "易联社区投资频道汇集企业及机构投资需求";
	public static final String KEYWORDS_INVESTMENT = "投资信息、投资项目、企业投资";
	public static final String DESCRIPTION_INFORMATION = "易联社区金融资讯频道，为金融从业人员提供全面的金融资讯报道和解读，提供时实的金融数据更新。";
	public static final String KEYWORDS_INFROMCTION = "金融资讯、金融最新动态、金融";

}
