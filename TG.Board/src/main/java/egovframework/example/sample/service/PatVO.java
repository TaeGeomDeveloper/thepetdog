package egovframework.example.sample.service;
import java.io.Serializable;
import java.util.Date;

/**
 * @Class Name : BoardVO.java
 * @Description : BoardVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2023.07.10    윤태검       최초생성
 *
 * @author 윤태검
 * @since 2023. 07.10
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class PatVO implements Serializable  {
	private static final long serialVersionUID = 362498820763181265L;
	private int pno;
	private String name;
	private int age;
	private String classification;
	private String m_id;
	
	public PatVO() {}
	public PatVO(String name, int age , String classification, String m_id) {
		this.name = name;
		this.age = age;
		this.classification = classification;
		this.m_id = m_id;
	}
	public PatVO(int pno, String name, int age , String classification) {
		this.pno = pno;
		this.name = name;
		this.age = age;
		this.classification = classification;
	}
	public PatVO(int pno, String name, int age , String classification, String m_id) {
		this.pno = pno;
		this.name = name;
		this.age = age;
		this.classification = classification;
		this.m_id = m_id;
	}
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	

}
