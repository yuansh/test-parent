package org.test.common.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;

public class MemberVo extends PageFormVo{

	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	private Long qId;

	private String qArticleTitle;

	private String qType;

	private Long id;

	private String name;// 用户名

	private String source;// 用户来源：1-自有 2-易联天下经纪会员

	private String email;// 邮箱

	private String password;// 密码

	private String mobile;// 手机

	private String sex;// 性别，0默认保密 1男 2女

	private Date birthday;// 生日

	private String province;// 所在省

	private String city;// 所在市

	private String company;// 公司

	private String career;// 职业

	private String discription;// 介绍

	private String imgMogid;// 图片存放在mongodb标识

	private String emailValidation;// 邮箱验证,0-默认未验证

	
	private String birthday_name;//字符串类型生日
	

	public Long getqId() {
		return qId;
	}

	public void setqId(Long qId) {
		this.qId = qId;
	}

	public String getqArticleTitle() {
		return qArticleTitle;
	}

	public void setqArticleTitle(String qArticleTitle) {
		this.qArticleTitle = qArticleTitle;
	}

	public String getqType() {
		return qType;
	}

	public void setqType(String qType) {
		this.qType = qType;
	}

	@Override
	public Sort getSort() {
		if (sort.equals("id")) {
			sortSet = new Sort(Direction.ASC, "id");
			sortSet = sortSet.and(new Sort(Direction.DESC, "lastModifiedDate"));
		} else {
			sortSet = new Sort(this.order.equals("desc") ? Direction.ASC
					: Direction.DESC, "information.createdDate");
		}

		return sortSet;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		if(StringUtils.isNotBlank(this.birthday_name)){
			try {
				this.birthday=new SimpleDateFormat("yyyy-MM-dd").parse(this.birthday_name);
			} catch (ParseException e) {
				logger.debug("日期格式转换异常",e);
			}
		}
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public String getImgMogid() {
		return imgMogid;
	}

	public void setImgMogid(String imgMogid) {
		this.imgMogid = imgMogid;
	}

	public String getEmailValidation() {
		return emailValidation;
	}

	public void setEmailValidation(String emailValidation) {
		this.emailValidation = emailValidation;
	}

	public void setBirthday_name(String birthday_name) {
		this.birthday_name = birthday_name;
	}

	public String getBirthday_name(){
		if(this.birthday!=null){
			this.birthday_name=new SimpleDateFormat("yyyy-MM-dd").format(this.birthday);
		}
		return birthday_name;
	}
	

}
