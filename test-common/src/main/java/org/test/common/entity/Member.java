package org.test.common.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.envers.Audited;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.test.common.constants.JunoConstants;
import org.test.common.constants.JunoConstants.OnLineState;
/**
 * 会员表
 * @author Administrator
 *
 */
@Entity
@Audited
@Table(name = "JN_MEMBER")
public class Member  extends VersionedAuditableIdEntity implements UserDetails{
	private static final long serialVersionUID = 6488610949648166860L;
	@Override
	@Id
	@SequenceGenerator(name = "generator", sequenceName = "SEQ_MEMBER")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "generator")
	public Long getId() {
		// TODO Auto-generated method stub
		return id;
	}
	
	private String name;// 用户名

	private String source;// 用户来源：1-自有 2-易联天下经纪会员

	private String email;// 邮箱

	private String password;// 密码

	private String mobile;// 手机

	private String sex;// 性别，0默认保密   1男  2女

	private Date birthday;// 生日

	private String province;// 所在省

	private String city;// 所在市

	private String company;// 公司

	private String career;// 职业

	private String discription;// 介绍

	private String imgMogid;// 图片存放在mongodb标识

	private String emailValidation;// 邮箱验证,0-默认未验证

	private OnLineState isOnline = JunoConstants.OnLineState.OFF_LINE;// 是否在线 0-不在线 1-在线
	
	private Date previousLoginTime;//上一次登录时间
	
	private Date emailSendTime;//邮件发送时间
	
	private Date lastLoginTime;//最近一次登录时间
	private final boolean accountNonExpired = Boolean.TRUE;
	private final boolean accountNonLocked = Boolean.TRUE;
	private final boolean credentialsNonExpired = Boolean.TRUE;
	private final boolean enabled = Boolean.TRUE;
	@Column(length = 30)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(length = 2)
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	@Column(length = 30)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(length = 64)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(length = 20)
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
	@Column(length = 40)
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
	@Column(length = 90)
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	@Column(length = 32)
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
	public OnLineState getIsOnline() {
		return isOnline;
	}
	public void setIsOnline(OnLineState isOnline) {
		this.isOnline = isOnline;
	}
	public Date getPreviousLoginTime() {
		return previousLoginTime;
	}
	public void setPreviousLoginTime(Date previousLoginTime) {
		this.previousLoginTime = previousLoginTime;
	}
	public Date getEmailSendTime() {
		return emailSendTime;
	}
	public void setEmailSendTime(Date emailSendTime) {
		this.emailSendTime = emailSendTime;
	}
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	@Override
	@Transient
	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}
	@Override
	@Transient
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}
	@Override
	@Transient
	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}
	@Override
	@Transient
	public boolean isEnabled() {
		return enabled;
	}
	@Override
	@Transient
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	@Transient
	public String getUsername() {
		// TODO Auto-generated method stub
		return name;
	}
	
	
	
}
