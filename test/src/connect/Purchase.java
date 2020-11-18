//make order
package connect;

import connect.Connect;
import connect.Base;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class Purchase extends Base{
	private Connect con;
	private Gson gson;
	private String UID,PID;
	private int count,mark;
	private JsonObject message; //request of jsp
	private boolean is_purchase; //is success
	private String result; //response of server
	
	public Purchase() {
		this.con=new Connect();
		this.gson=new Gson();
		this.con.setURL("http://ec2-54-180-20-247.ap-northeast-2.compute.amazonaws.com/order/purchase"
				+ "?format=json"); //set url
	}
	
	public void input(String UID,String PID,String count,String mark) { //input data
		this.UID=UID;
		this.PID=PID;
		this.count=Integer.parseInt(count);
		this.mark=Integer.parseInt(mark);
		this.message=new JsonObject();
		this.message.addProperty("UID", this.UID);
		this.message.addProperty("PID",this.PID);
		this.message.addProperty("count", this.count);
		this.message.addProperty("mark", this.mark);
	}
	
	public boolean access() //access server and send message
	{	
		this.con.setmessage(gson.toJson(this.message));
		this.is_purchase=this.con.post();
		JsonParser parser=new JsonParser();
		JsonElement result=parser.parse(this.con.getresult());
		try {
			this.result=result.getAsJsonObject().get("message").getAsString();
		}catch(Exception e){
			this.result=null;
		}
		return this.is_purchase;
	}
	
	public String get_result() { //return response
		return this.result;
	}
	
}
	
