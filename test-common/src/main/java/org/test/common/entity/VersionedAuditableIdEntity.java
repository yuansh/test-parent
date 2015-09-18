package org.test.common.entity;

public abstract class VersionedAuditableIdEntity extends AuditableEntity {

	// 将以下SEQ注解复制到每个子类 且覆盖getId()方法 eg: task class
	// @Id
	// @SequenceGenerator(name = "generator", sequenceName = "SEQ_SS_TASK")
	// @GeneratedValue(strategy = GenerationType.SEQUENCE, generator =
	// "generator")

	private static final long serialVersionUID = -7389801584308776635L;

	/**
	 * ******* return parameters is "id" Not return null********
	 * 
	 * @Id
	 * @SequenceGenerator(name = "generator", sequenceName = "SEQ_SS_TASK")
	 * @GeneratedValue(strategy = GenerationType.SEQUENCE, generator =
	 *                          "generator")
	 */
	public abstract Long getId();
}
