package com.spring.shopping.product;

public class ProductVO {
	private int num;
	private String name;
	private String brief;
	private int category;
	private int price;
	private int point;			// 포인트
	private String capacity;	// 용량
	private String desc_image;	// 이미지 설명
	private String desc_text;	// 텍스트 설명
	private String detail;
	private int total_pref;
	private int reviewCnt;	// 리뷰의 총 개수
	private String image;
	private String mfd;		//제조일자
	private int numoflike;	// 좋아요 수
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
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
	public int getTotal_pref() {
		return total_pref;
	}
	public void setTotal_pref(int total_pref) {
		this.total_pref = total_pref;
	}
	public int getReviewCnt() {
		return reviewCnt;
	}
	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMfd() {
		return mfd;
	}
	public void setMfd(String mfd) {
		this.mfd = mfd;
	}
	public int getNumoflike() {
		return numoflike;
	}
	public void setNumoflike(int numoflike) {
		this.numoflike = numoflike;
	}	
}
