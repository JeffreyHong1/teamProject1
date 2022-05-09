package team.project1.dto;
import java.util.regex.Pattern;
import java.sql.Timestamp;

public class FormDTO {
	String idptn = "^[a-zA-z0-9]{4,}$";
	String pwptn = "^[a-zA-z0-9]{5,10}$";
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String phone1;
	private String phone2;
	private String birth;
	private String email1;
	private String email2;
	private String addr;
	private String addr1;
	private String addr2;
	private String addr3;
	private String addr4;
	private Timestamp reg;
	
	public void setId( String id ){
		if(Pattern.matches(idptn, id)) {
		this.id = id; }
		else{this.id = null;}
	}
	public void setPw( String pw ){ 
		if(Pattern.matches(pwptn, pw)) {
		this.pw = pw; }
		else{this.pw = null;}
	}
	public void setName( String name ){ this.name = name; }
	public void setGender( String gender ){ this.gender = gender; }
	public void setPhone1( String phone1 ){ this.phone1 = phone1; }
	public void setPhone2( String phone2 ){ this.phone2 = phone2; }
	public void setBirth( String birth ){ this.birth = birth; }
	public void setEmail1( String email1 ){ this.email1 = email1; }
	public void setEmail2( String email2 ){ this.email2 = email2; }
	public void setReg( Timestamp reg ){ this.reg = reg; }

	public String getId() { return id; }
	public String getPw() { return pw; }
	public String getName() { return name; }
	public String getGender() { return gender; }
	public String getPhone1() { return phone1; }
	public String getPhone2() { return phone2; }
	public String getBirth() { return birth; }
	public String getEmail1() { return email1; }
	public String getEmail2() { return email2; }
	public Timestamp getReg() { return reg; }
	
	public String getAddr() { return addr; }
	public String getAddr5() { return getAddr1() +" "+ getAddr2() +" "+ getAddr3() + getAddr4(); }
	public void setAddr(String addr) { this.addr = addr; }
	public String getAddr1() { return addr1; }
	public void setAddr1(String addr1) { this.addr1 = addr1; }
	public String getAddr2() { return addr2; }
	public void setAddr2(String addr2) { this.addr2 = addr2; }
	public String getAddr3() { return addr3; }
	public void setAddr3(String addr3) { this.addr3 = addr3; }
	public String getAddr4() { return addr4; }
	public void setAddr4(String addr4) { this.addr4 = addr4; }

}
