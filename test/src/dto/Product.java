//information product
package dto;

import java.io.Serializable;

public class Product implements Serializable{
	private int id;
	private String image;
	private String name;
	private String detail;
	private int price;
	private int stock;
	private String major_category;
	private String minor_category;
	private String merchandiser;
	private float mark;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int id,String image,String name,int price) { //use in products jsp
		super();
		this.id=id;
		this.image=image;
		this.name=name;
		this.price=price;
	}
	
	public Product(int id, String image, String name, String detail, int price, int stock, String major_category,
			String minor_category, String merchandiser,float mark) { //use in product jsp
		super();
		this.id = id;
		this.image = image;
		this.name = name;
		this.detail = detail;
		this.price = price;
		this.stock = stock;
		this.major_category = major_category;
		this.minor_category = minor_category;
		this.merchandiser = merchandiser;
		this.mark=mark;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getMajor_category() {
		return major_category;
	}

	public void setMajor_category(String major_category) {
		this.major_category = major_category;
	}

	public String getMinor_category() {
		return minor_category;
	}

	public void setMinor_category(String minor_category) {
		this.minor_category = minor_category;
	}

	public String getMerchandiser() {
		return merchandiser;
	}

	public void setMerchandiser(String merchandiser) {
		this.merchandiser = merchandiser;
	}
	
	public float getMark() {
		return this.mark;
	}
	
}
