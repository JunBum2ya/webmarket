//read product's list to server
package connect;

import java.util.ArrayList;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.JsonArray;

import dto.Product;

public class ProductList extends Base{
	
	private Connect con;
	private Gson gson;
	private int count;
	private String previous; //previous page in server
	private String next; //next page in server
	private boolean is_access; //is success
	private int page; //current page in server
	
	public ProductList(int page) {
		this.con=new Connect();
		this.gson=new Gson();
		this.con.setURL("http://ec2-54-180-20-247.ap-northeast-2.compute.amazonaws.com/product/"
				+ "/?format=json&page="+page); //set url
		this.page=page;
	}
	
	public boolean access(ArrayList<Product> listOfProducts) //access server and make list of products
	{	
		this.is_access=this.con.get();
		JsonParser parser=new JsonParser();
		JsonElement result=parser.parse(this.con.getresult());
		try {
			this.count=result.getAsJsonObject().get("count").getAsInt();
			this.next=result.getAsJsonObject().get("next").getAsString();
			try {
				this.previous=result.getAsJsonObject().get("previous").getAsString();
			}catch(Exception e) {
				this.previous=null;
			}
			JsonArray jsonArray=result.getAsJsonObject().getAsJsonArray("results");
			
			for(int i=0;i<jsonArray.size();i++)
			{
				JsonElement jsonElement=jsonArray.get(i);
				Product product=new Product(
						jsonElement.getAsJsonObject().get("id").getAsInt(),
						jsonElement.getAsJsonObject().get("product_image").getAsString(),
						jsonElement.getAsJsonObject().get("product_name").getAsString(),
						jsonElement.getAsJsonObject().get("product_price").getAsInt()
						);
				listOfProducts.add(product);
			}
		}catch(Exception e){
			System.out.println(e);
			this.is_access=false;
		}
		return this.is_access;
	}
	
	public int getCount() {
		return count;
	}
	
	public String getPrevious() {
		return previous;
	}
	
	public String getNext() {
		return next;
	}
}
