package com.myProject;

import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.jdbc.core.BeanPropertyRowMapper;  
import org.springframework.jdbc.core.JdbcTemplate;  
import org.springframework.jdbc.core.RowMapper;

import com.google.gson.Gson;
import com.myProject.Cart;
import com.myProject.Checkout;
import com.myProject.Decrement;
import com.myProject.DeleteData;
import com.myProject.Headphone;
import com.myProject.Increment;
import com.myProject.Laptop;
import com.myProject.Login;
import com.myProject.Mobile;
import com.myProject.Orders;
import com.myProject.ReceiveCartData;
import com.myProject.Signup;

public class Dao {
		
		/*Setting JDBC Template*/
		JdbcTemplate template;  
		public void setTemplate(JdbcTemplate template) {  
		    this.template = template;  
		}  
		
		/*Saving Customers Data*/
		public int save(Signup p){  
		    String sql="insert into users(name,phone,password) values('"+p.getName()+"',"+p.getPhone()+",'"+p.getPassword()+"')";  
		    return template.update(sql);  
		}  
		
		//Save user address
		public void saveAddress(HttpSession session,Checkout checkout){
			String phone = (String) session.getAttribute("username");
			String sql = "update users set address = '"+checkout.getAddress()+"', contact = "+checkout.getPhone()+",addressname = '"+checkout.getName()+"' where phone = "+phone;
			template.update(sql);
		}
		
		//Saving Cart Data
		public int saveCartData(ReceiveCartData s,HttpSession session){
			String phone = (String) session.getAttribute("username");
			String sql = "insert into cart(name,price,imgurl,phone,id,count) values('"+s.getName()+"',"+s.getPrice()+",'"+s.getImgurl()+"',"+phone+","+s.getId()+","+s.getCount()+")";
			return template.update(sql);
		}
		
		//Incrementing Count of a product in cart
		public void increaseCount(Increment i,HttpSession session) {
			String phone = (String) session.getAttribute("username");
			String sql = "update cart set count = count+1 where phone = "+phone+" and name = '"+i.getName()+"'";
			template.update(sql);
		}
		
		//Decrementing Count of a product in cart
		public void decreaseCount(Decrement d,HttpSession session) {
			String phone = (String) session.getAttribute("username");
			String sql = "update cart set count = count-1 where phone = "+phone+" and name = '"+d.getName()+"'";
			template.update(sql);
		}

		//Removing from Cart
		public int removeFromCart(DeleteData delete,HttpSession session){
			String phone = (String) session.getAttribute("username");
			String sql = "delete from cart where name = '"+delete.getName()+"' and phone= " + phone;
			return template.update(sql);
		}
		
		//Validating whether a user with the same user name exists or not
		public Signup validateUserName(Signup customer) {
		    String sql = "select * from users where phone='" + customer.getPhone() +"'";
		    List<Signup> users = template.query(sql, new UserMapper());
		    return users.size() > 0 ? users.get(0) : null;
		}
		
		/*Validating Users User name and Password*/
		public Signup validateUser(Login login) {
		    String sql = "select * from users where phone='" + login.getPhone() + "' and password='" + login.getPassword()
		    + "'";
		    List<Signup> users = template.query(sql, new UserMapper());
		    return users.size() > 0 ? users.get(0) : null;
		}
	  
		//Returning Shipping Address
		public String addressData(HttpSession session){
			String phone = (String) session.getAttribute("username");
			String sql = "select * from users where phone = "+phone;
			List<Signup> data =  template.query(sql,new UserMapper());			
			Gson gson = new Gson();			
			return(gson.toJson(data));
		}
		
		/*Getting Cart Table from Database*/
		public String cartData(HttpSession session) {
			String phone = (String) session.getAttribute("username");
			String sql = "select * from cart where phone = "+phone;
			List<Cart> data =  template.query(sql,new CartMapper());			
			Gson gson = new Gson();			
			return(gson.toJson(data));
		}
		
		/*Getting Orders Table from Database*/
		public String ordersData(HttpSession session) {
			String phone = (String) session.getAttribute("username");
			String sql = "select * from orders where phone = "+phone;
			List<Orders> data =  template.query(sql,new OrderMapper());			
			Gson gson = new Gson();			
			return(gson.toJson(data));
		}
		
		/*Saving orders to the database*/
		public void saveOrdersData(HttpSession session){
			String phone = (String) session.getAttribute("username");
			String sql = "insert into orders(select * from cart where phone="+phone+")";
			String delete = "delete from cart where phone = "+phone;
			
			template.update(sql);
			template.update(delete);
		}
		
		/*Removing stuffs from MyOrders*/
		public void removeOrder(HttpSession session){
			String phone = (String) session.getAttribute("username");
			String sql = "delete from orders where phone = "+phone;
			template.update(sql);
		}
		
		/*Getting Mobile Table from Database*/
		public String mobileData() {
			String sql = "select * from mobiles";
			List<Mobile> data =  template.query(sql,new MobileMapper());			
			Gson gson = new Gson();			
			return(gson.toJson(data));
		}
		
		/*Getting Laptop Table from Database*/
		public String laptopData() {
			String sql = "select * from laptops";
			List<Laptop> data =  template.query(sql,new LaptopMapper());			
			Gson gson = new Gson();			
			return(gson.toJson(data));
		}
		
		/*Getting Mobile Table from Database*/
		public String headphonesData() {
			String sql = "select * from headphones";
			List<Headphone> data =  template.query(sql,new HeadphoneMapper());			
			Gson gson = new Gson();			
			return(gson.toJson(data));
		}
		
		/*Mapping User data*/
		class UserMapper implements RowMapper<Signup> {
		  public Signup mapRow(ResultSet rs, int arg1) throws SQLException {
			  
			  Signup e=new Signup();  
		      
		      e.setName(rs.getString(1));  
		      e.setPhone(rs.getString(2));  
		      e.setPassword(rs.getString(3));  
		      e.setAddress(rs.getString(4));
		      e.setContact(rs.getString(5));
		      e.setAddressname(rs.getString(6));
		      return e; 
		  }
		}
	  
		/*Mapping Mobile Data*/
		class MobileMapper implements RowMapper<Mobile> {
		  public Mobile mapRow(ResultSet rs, int arg1) throws SQLException {
			  
			  Mobile m=new Mobile();  
		      
			  m.setId(rs.getInt(1));  
		      m.setName(rs.getString(2));  
		      m.setPrice(rs.getInt(3));  
		      m.setImgurl(rs.getString(4));
		      m.setSize(rs.getString(5));
		      m.setOs(rs.getString(6));
		      m.setRam(rs.getString(7));
		      m.setInternal(rs.getString(8));
		      m.setBattery(rs.getString(9));
		      m.setCamera(rs.getString(10));
		      
		      return m; 
		  }
		}
		
		/*Mapping Laptop Data*/
		class LaptopMapper implements RowMapper<Laptop> {
			  public Laptop mapRow(ResultSet rs, int arg1) throws SQLException {
				  
				  Laptop l=new Laptop();  
			      
				  l.setId(rs.getInt(1));  
			      l.setName(rs.getString(2));  
			      l.setPrice(rs.getInt(3));  
			      l.setImgurl(rs.getString(4));
			      l.setOs(rs.getString(5));
			      l.setProcessor(rs.getString(6));
			      l.setRam(rs.getString(7));
			      l.setStorage(rs.getString(8));
			      l.setSize(rs.getString(9));
			      l.setWarranty(rs.getString(10));
			      
			      return l; 
			  }
			}
		
		/*Mapping Headphone Data*/
		class HeadphoneMapper implements RowMapper<Headphone> {
			  public Headphone mapRow(ResultSet rs, int arg1) throws SQLException {
				  
				  Headphone h=new Headphone();  
			      
				  h.setId(rs.getInt(1));  
			      h.setName(rs.getString(2));  
			      h.setPrice(rs.getInt(3));  
			      h.setImgurl(rs.getString(4));
			      h.setConnectivity(rs.getString(5));
			      h.setDesignedFor(rs.getString(6));
			      h.setConnector(rs.getString(7));
			      h.setBass(rs.getString(8));
			      h.setWarranty(rs.getString(9));    
			      
			      return h; 
			  }
			}
		
		//Mapping Cart Data
		class CartMapper implements RowMapper<Cart> {
			  public Cart mapRow(ResultSet rs, int arg1) throws SQLException {
				  
				  Cart c=new Cart();  
			      
			      c.setName(rs.getString(1));  
			      c.setPrice(rs.getInt(2));  
			      c.setImgurl(rs.getString(3));
			      c.setPhone(rs.getString(4));
			      c.setCount(rs.getInt(6));
			      
			      return c; 
			  }
			}
		
		//Mapping My Orders
		class OrderMapper implements RowMapper<Orders> {
			  public Orders mapRow(ResultSet rs, int arg1) throws SQLException {
				  
				  Orders o=new Orders();  
			      
			      o.setName(rs.getString(1));  
			      o.setPrice(rs.getInt(2));  
			      o.setImgurl(rs.getString(3));
			      o.setPhone(rs.getString(4));
			      o.setCount(rs.getInt(6));
			      
			      return o; 
			  }
			}
		
		/*CheckOut Details Mapper*/
		class CheckoutMapper implements RowMapper<Checkout> {
			  public Checkout mapRow(ResultSet rs, int arg1) throws SQLException {
				  
				  Checkout c = new Checkout();
			      
			      c.setName(rs.getString(1));  
			      c.setAddress(rs.getString(2));  
			      c.setPhone(rs.getString(3));
			     
			      
			      return c; 
			  }
			}
	  
}
