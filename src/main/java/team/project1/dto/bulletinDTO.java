package team.project1.dto;

import java.sql.Timestamp;

public class bulletinDTO {
	private int num;		//글 번호
	private String writer;	//작성자
	private String subject;	//글 제목
	private String content;	//글 내용
	private String search;	//검색
	private String pw;		//비밀번호
	private int readcount;	//조회수
	private int good;		//좋아요
	private int ref;		//글 그룹
	private int re_step;	//작성 순서
	private int re_level;	//글 그룹 내 답글 레벨
	private Timestamp reg;	//작성 날짜
		
	public void setNum(int num) {this.num = num;}
	public int getNum() { return num;}
	
	public void setWriter(String writer) {this.writer = writer;}
	public String getWriter() {return writer;}
	
	public void setSubject(String subject) {this.subject = subject;}
	public String getSubject() {return subject;}
	
	public void setContent(String content) {this.content = content;}
	public String getContent() {return content;}
	
	public void setSearch(String search) {this.search = search;}
	public String getSearch() {return search;}
	
	public void setPw(String pw) {this.pw = pw;}
	public String getPw() {return pw;}
	
	public void setReadcount(int readcount) {this.readcount = readcount;}
	public int getReadcount() {return readcount;}
	
	public void setGood(int good) {this.good = good;}
	public int getGood() {return good;}
	
	public void setRef(int ref) {this.ref = ref;}
	public int getRef() {return ref;}
	
	public void setRe_step(int re_step) {this.re_step = re_step;}
	public int getRe_step() {return re_step;}
	
	public void setRe_level(int re_level) {this.re_level = re_level;}
	public int getRe_level() {return re_level;}
	
	public void setReg(Timestamp reg) {this.reg = reg;}
	public Timestamp getReg() {return reg;}
	
}
