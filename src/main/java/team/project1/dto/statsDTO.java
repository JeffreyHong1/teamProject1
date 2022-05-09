package team.project1.dto;

import java.sql.Timestamp;

public class statsDTO {
	
	private String inputdate;
	private String purchase;
	private String sales;
	private String spending; 
	private String pretext;
	private String price;
	private String quantity;
	private String amount;
	private String buyCount;
	private String pNum;
	private String pName;
	private String pSize;	
	private String stock;
	private Timestamp buy_reg;
	
	
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	public String getPurchase() {
		return purchase;
	}
	public void setPurchase(String purchase) {
		this.purchase = purchase;
	}
	public String getSales() {
		return sales;
	}
	public void setSales(String sales) {
		this.sales = sales;
	}
	public String getSpending() {
		return spending;
	}
	public void setSpending(String spending) {
		this.spending = spending;
	}
	public String getPretext() {
		return pretext;
	}
	public void setPretext(String pretext) {
		this.pretext = pretext;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getBuyCount() {
		return buyCount;
	}
	public void setBuyCount(String buyCount) {
		this.buyCount = buyCount;
	}
	public String getpNum() {
		return pNum;
	}
	public void setpNum(String pNum) {
		this.pNum = pNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpSize() {
		return pSize;
	}
	public void setpSize(String pSize) {
		this.pSize = pSize;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public Timestamp getBuy_reg() {
		return buy_reg;
	}
	public void setBuy_reg(Timestamp buy_reg) {
		this.buy_reg = buy_reg;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
}
