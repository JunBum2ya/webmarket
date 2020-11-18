//product's list
package dao;

import java.util.ArrayList;
import dto.Product;
import connect.Connect;
import com.google.gson.Gson;
import connect.ProductList;

public class ProductRepository {
	private ArrayList<Product> listOfProducts=new ArrayList<Product>(); //array of product
	private int page; //current page
	private int count; //number of all products
	private String next; //next page in  server
	private String previous; //previous pagei in server
	
	public ProductRepository() {
		super();
	}
	
	public ProductRepository(int page) { //make list
		ProductList list=new ProductList(page);
		list.access(this.listOfProducts);
		this.count=list.getCount();
		this.next=list.getNext();
		this.previous=list.getPrevious();
	}
	
	public void setPage(int page) {
		this.page=page;
	}
	
	public ArrayList<Product> getAllProducts(){ //return list
		return listOfProducts;
	}
	
	public String getNext() {
		return next;
	}
	
	public String getPrevious() {
		return previous;
	}
}