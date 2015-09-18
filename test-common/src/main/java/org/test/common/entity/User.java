package org.test.common.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.envers.Audited;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Audited
@Table(name="JN_USER")
@Inheritance(strategy=InheritanceType.JOINED)
@JsonIgnoreProperties(value={})
public class User  extends VersionedAuditableIdEntity {
	private static final long serialVersionUID = 7767898317714803759L;
	@Override
	@Id
	@SequenceGenerator(name = "generator", sequenceName = "SEQ_USER")
	public Long getId() {
		// TODO Auto-generated method stub
		return null;
	}

}
