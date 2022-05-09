package team.project1.dto;


import java.sql.Timestamp;

public class OrderDTO {
	private String id;
	private String pname;
	private int pnum;
	private String psize;
	private int price;
	private String delivery;
	private Timestamp reg;
	private boolean buy;
	private String d_result;
	private String gu_email;
	private String gu_Phone;
	private String img;
	private int quantity;
	private String phone;
	private String name;
	private String gu_addr;
	private String gu_addr1;
	private String gu_addr2;
	private String gu_addr3;
	private String gu_addr4;
	private String addr;
	private String addr1;
	private String addr2;
	private String addr3;
	private String addr4;
	private Timestamp buy_reg;
	private int lastPrice;
	private int lastPriceDc;
	private int order_num;

	
	
	public int getLastPriceDc() {
		return lastPriceDc;
	}
	public void setLastPriceDc(int lastPriceDc) {
		this.lastPriceDc = lastPriceDc;
	}
	public int getLastPrice() {
		return lastPrice;
	}
	public void setLastPrice(int lastPrice) {
		this.lastPrice = lastPrice;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	
	
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public boolean isBuy() {
		return buy;
	}
	public void setBuy(boolean buy) {
		this.buy = buy;
	}
	public String getD_result() {
		return d_result;
	}
	public void setD_result(String d_result) {
		this.d_result = d_result;
	}
	public String getGu_email() {
		return gu_email;
	}
	public void setGu_email(String gu_email) {
		this.gu_email = gu_email;
	}
	public String getGu_Phone() {
		return gu_Phone;
	}
	public void setGu_Phone(String gu_Phone) {
		this.gu_Phone = gu_Phone;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGu_addr() {
		return gu_addr;
	}
	public void setGu_addr(String gu_addr) {
		this.gu_addr = gu_addr;
	}
	public String getGu_addr1() {
		return gu_addr1;
	}
	public void setGu_addr1(String gu_addr1) {
		this.gu_addr1 = gu_addr1;
	}
	public String getGu_addr2() {
		return gu_addr2;
	}
	public void setGu_addr2(String gu_addr2) {
		this.gu_addr2 = gu_addr2;
	}
	public String getGu_addr3() {
		return gu_addr3;
	}
	public void setGu_addr3(String gu_addr3) {
		this.gu_addr3 = gu_addr3;
	}
	public String getGu_addr4() {
		return gu_addr4;
	}
	public void setGu_addr4(String gu_addr4) {
		this.gu_addr4 = gu_addr4;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getAddr4() {
		return addr4;
	}
	public void setAddr4(String addr4) {
		this.addr4 = addr4;
	}
	public Timestamp getBuy_reg() {
		return buy_reg;
	}
	public void setBuy_reg(Timestamp buy_reg) {
		this.buy_reg = buy_reg;
	}
	
	public String getAddr5() { return getAddr1() +" "+ getAddr2() +" "+ getAddr3() + getAddr4(); }
	public String getGu_addr5() {return getGu_addr1() +" "+ getGu_addr2() +" "+ getGu_addr3() +" "+ getGu_addr4(); }
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	
	
	
}
