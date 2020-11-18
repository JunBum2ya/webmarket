// read product's detail
package connect;

import connect.Connect;
import connect.Base;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class Detail extends Base{
	private Connect con; //object of connect
	private Gson gson; //convert json
	private boolean is_access; // if success
	private String name,detail,merchandiser,major,minor,image; //product'data
	private int price,stock; //product's data
	private float mark; //mark
	
	public Detail(String ID) {
		this.con=new Connect();
		this.gson=new Gson();
		this.con.setURL("http://ec2-54-180-20-247.ap-northeast-2.compute.amazonaws.com/product/"+ID
				+ "/?format=json"); //set url
	}
	
	public boolean access() //access server and read data
	{	
		this.is_access=this.con.get();
		JsonParser parser=new JsonParser();
		JsonElement result=parser.parse(this.con.getresult());
		try {
			this.image=result.getAsJsonObject().get("product_image").getAsString();
			this.name=result.getAsJsonObject().get("product_name").getAsString();
			this.detail=result.getAsJsonObject().get("product_detail").getAsString();
			this.price=result.getAsJsonObject().get("product_price").getAsInt();
			this.stock=result.getAsJsonObject().get("product_stock").getAsInt();
			this.major=result.getAsJsonObject().get("product_major_category").getAsString();
			this.minor=result.getAsJsonObject().get("product_minor_category").getAsString();
			this.mark=result.getAsJsonObject().get("product_mark").getAsFloat();
			this.merchandiser=result.getAsJsonObject().get("product_merchandiser").getAsString();
		}catch(Exception e){
			this.is_access=false;
		}
		return this.is_access;
	}
	public String get_image() {
		return this.image;
	}
	public String get_name() {
		return this.name;
	}
	public int get_price() {
		return this.price;
	}
	public String get_detail() {
		return this.detail;
	}
	public int get_stock() {
		return this.stock;
	}
	public String get_major_category() {
		return this.major;
	}
	public String get_minor_category() {
		return this.minor;
	}
	public String get_merchandiser() {
		return this.merchandiser;
	}
	public float getMark() {
		return this.mark;
	}
}

