package team.project1.dto;

import java.sql.Timestamp;

public class productDTO {

	private String pclass; // 상품종류
	private String pnum; // 상품번호
	private String pname; // 상품이름
	private String img; // 상품이미지
	private String psize; // 상품사이즈
	private int price; // 상품가격
	private int stock; // 재고
	private String thing; // 비고
	private Timestamp reg;

	public void setPclass(String pclass) {
		this.pclass = pclass;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public void setPsize(String psize) {
		this.psize = psize;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public void setThing(String thing) {
		this.thing = thing;
	}

	public void setReg(Timestamp reg) {
		this.reg = reg;
	}

	public String getPclass() {
		return pclass;
	}

	public String getPnum() {
		return pnum;
	}

	public String getPname() {
		return pname;
	}

	public String getImg() {
		return img;
	}

	public String getPsize() {
		return psize;
	}

	public int getPrice() {
		return price;
	}

	public int getStock() {
		return stock;
	}

	public String getThing() {
		return thing;
	}

	public Timestamp getReg() {
		return reg;
	}

}
