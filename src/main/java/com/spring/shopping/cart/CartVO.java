package com.spring.shopping.cart;

public class CartVO {
	private int num; // product�� num
	private String id; //�ֹ����� ���̵�
	private String productName;
	private int productPrice;
	private String productImage;
	private String desc_image;
	private String desc_text;
	private String detail;
	private int numInCart; // ��ٱ����� ��ǰ ����� ��ȣ
	private int amount; //��ǰ�� ����
	private int point; //��ǰ�� ����Ʈ
	private int totalPrice;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getNumInCart() {
		return numInCart;
	}
	public void setNumInCart(int numInCart) {
		this.numInCart = numInCart;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public String getDesc_image() {
		return desc_image;
	}
	public void setDesc_image(String desc_image) {
		this.desc_image = desc_image;
	}
	public String getDesc_text() {
		return desc_text;
	}
	public void setDesc_text(String desc_text) {
		this.desc_text = desc_text;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	
}
