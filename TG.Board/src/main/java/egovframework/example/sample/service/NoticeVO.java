package egovframework.example.sample.service;
import java.sql.Timestamp;
import java.util.Date;

/**
 * @Class Name : NoticeVO.java
 * @Description : NoticeVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2023.07.12    윤태검       최초생성
 *
 * @author 윤태검
 * @since 2023. 07.12
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {

	private int nb_seq;
    private String nb_id;
    private String nb_name;
    private String nb_title;
    private String nb_content;
    private int nb_viewCount;
    private Timestamp nb_regDate;
    private String nb_originFileName;
    private String nb_serverFileName;
    private String nb_downloadCount;
    
    /*public NoticeVO() {
		// TODO Auto-generated constructor stub
	}
    public NoticeVO(int nb_seq, String nb_category, String nb_id, String nb_name, String nb_title, String nb_content,
			int nb_viewCount, Timestamp nb_regDate, String nb_originFileName, String nb_serverFileName,
			String nb_downloadCount) {
		this.nb_seq = nb_seq;
		this.nb_category = nb_category;
		this.nb_id = nb_id;
		this.nb_name = nb_name;
		this.nb_title = nb_title;
		this.nb_content = nb_content;
		this.nb_viewCount = nb_viewCount;
		this.nb_regDate = nb_regDate;
		this.nb_originFileName = nb_originFileName;
		this.nb_serverFileName = nb_serverFileName;
		this.nb_downloadCount = nb_downloadCount;
	}*/

	public int getNb_seq() {
		return nb_seq;
	}
	public void setNb_seq(int nb_seq) {
		this.nb_seq = nb_seq;
	}
	public String getNb_id() {
		return nb_id;
	}
	public void setNb_id(String nb_id) {
		this.nb_id = nb_id;
	}
	public String getNb_title() {
		return nb_title;
	}
	public void setNb_title(String nb_title) {
		this.nb_title = nb_title;
	}
	public String getNb_content() {
		return nb_content;
	}
	public void setNb_content(String nb_content) {
		this.nb_content = nb_content;
	}
	public int getNb_viewCount() {
		return nb_viewCount;
	}
	public void setNb_viewCount(int nb_viewCount) {
		this.nb_viewCount = nb_viewCount;
	}
	public Timestamp getNb_regDate() {
		return nb_regDate;
	}
	public void setNb_regDate(Timestamp nb_regDate) {
		this.nb_regDate = nb_regDate;
	}
	public String getNb_originFileName() {
		return nb_originFileName;
	}
	public void setNb_originFileName(String nb_originFileName) {
		this.nb_originFileName = nb_originFileName;
	}
	public String getNb_serverFileName() {
		return nb_serverFileName;
	}
	public void setNb_serverFileName(String nb_serverFileName) {
		this.nb_serverFileName = nb_serverFileName;
	}
	public String getNb_downloadCount() {
		return nb_downloadCount;
	}
	public void setNb_downloadCount(String nb_downloadCount) {
		this.nb_downloadCount = nb_downloadCount;
	}
	public String getNb_name() {
		return nb_name;
	}
	public void setNb_name(String nb_name) {
		this.nb_name = nb_name;
	}


}
