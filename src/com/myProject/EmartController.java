package com.myProject;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myProject.Checkout;
import com.myProject.Decrement;
import com.myProject.DeleteData;
import com.myProject.Increment;
import com.myProject.Login;
import com.myProject.ReceiveCartData;
import com.myProject.Signup;
import com.myProject.Dao;

import org.springframework.ui.ModelMap;

import java.io.IOException;
import java.util.List;  
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;  
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmartController extends HttpServlet {
	@Autowired  
    Dao dao;
	
	//HomePage Controller
	@RequestMapping("emart")
	public ModelAndView goToHome() {
		return new ModelAndView("redirect:/");
	}
	@RequestMapping("/")
	public ModelAndView showHomePage() {
		ModelAndView mav = null;	
		mav = new ModelAndView("emart");
		return mav;
	}
	
	//Sign up Controller
	@RequestMapping("/signup")  
    public ModelAndView signupPage(){  
        return new ModelAndView("signup","command",new Signup());  
    }
	@RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView addCustomer(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("customer") Signup customer) {
		ModelAndView mav = null;
		Signup user = dao.validateUserName(customer);
		if(null != user){
			mav = new ModelAndView("signup");
			mav.addObject("userexists","A User with the same Phone Number already exists.");			
		}
		else{
			mav = new ModelAndView("login");
			mav.addObject("registered", "You are now Registered.\nSign in to enjoy shopping.");
			dao.save(customer);	
		}	
		return mav;
	}
	
	//Login Controller
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	  public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("login");
	    mav.addObject("login", new Login());
	    return mav;
	}
	
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
	@ModelAttribute("login") Login login,HttpSession session) throws ServletException, IOException {
		ModelAndView mav = null;
		Signup user = dao.validateUser(login);
		
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility

		if (null != user) {
			session.setAttribute("loggedInUser", user);		
			session.setAttribute("username", user.getPhone());
			return new ModelAndView("redirect:/");
		} 
		else {
			mav = new ModelAndView("login");
			mav.addObject("message", "Username or Password is wrong!!");
			System.out.println("Something is wrong");
			return mav;
		}
	 }

	//Sign out Controller
      @RequestMapping(value="/signout",method= RequestMethod.GET)
      public String logout(HttpSession session,HttpServletRequest request) {
    	  
    	  session.removeAttribute("loggedInUser");
    	  request.getSession(false).invalidate();
    	  return "redirect:/emart";
      }
      
    //CheckOut Controller
      @RequestMapping("/checkout")
  		public ModelAndView checkoutPage() {
  		ModelAndView mav = null;	
  		mav = new ModelAndView("checkout");
  		return mav;
  	}

	//Json Controller
	@RequestMapping(value="/getMobileData",method = RequestMethod.GET)
	public @ResponseBody
	String addMobile(HttpServletRequest request, HttpServletResponse response)
    throws Exception {
			String json =dao.mobileData();
			return json;
	}
	
	@RequestMapping(value="/getLaptopData",method = RequestMethod.GET)
	public @ResponseBody
	String addLaptop(HttpServletRequest request, HttpServletResponse response)
    throws Exception {
			String json =dao.laptopData();
			return json;
	}
	
	@RequestMapping(value="/getHeadphoneData",method = RequestMethod.GET)
	public @ResponseBody
	String addHeadphone(HttpServletRequest request, HttpServletResponse response)
    throws Exception {
			String json =dao.headphonesData();
			return json;
	}
	
	@RequestMapping(value="/getCartData",method = RequestMethod.GET)
	public @ResponseBody
	String addCart(HttpServletRequest request, HttpServletResponse response,HttpSession session)
    throws Exception {
			String json =dao.cartData(session);
			return json;
	}
	
	@RequestMapping(value="/getOrdersData",method = RequestMethod.GET)
	public @ResponseBody
	String addOrders(HttpServletRequest request, HttpServletResponse response,HttpSession session)
    throws Exception {
			String json =dao.ordersData(session);
			return json;
	}
	
	@RequestMapping(value="/getJson",method=RequestMethod.POST)
	public  @ResponseBody void  saveCart(@RequestBody ReceiveCartData search,HttpServletRequest request,HttpSession session) {
	       dao.saveCartData(search, session);
	   }
	
	@RequestMapping("/cancelOrder")
	public ModelAndView cancelOrder(HttpSession session){
		ModelAndView mav = null;
		dao.removeOrder(session);
		mav = new ModelAndView("emart");
		return mav;
	}
	
	@RequestMapping(value = "/receiveOrders", method = RequestMethod.POST)
    public ModelAndView addOrder(HttpServletRequest request, HttpServletResponse response,HttpSession session,Checkout checkout) {
		ModelAndView mav = null;
		
			mav = new ModelAndView("emart");
			dao.saveOrdersData(session);	
			dao.saveAddress(session, checkout);
			
		return mav;
	}	
	
	@RequestMapping(value="/getToRemove",method=RequestMethod.POST)
	public  @ResponseBody void  getWhatToRemove(@RequestBody DeleteData delete, HttpServletRequest request,HttpSession session) {
	       dao.removeFromCart(delete, session);	       
	   }
	
	@RequestMapping(value="/getToIncrement",method=RequestMethod.POST)
	public  @ResponseBody void  geToIncrement(@RequestBody Increment i, HttpServletRequest request,HttpSession session) {
	       dao.increaseCount(i, session);	       
	   }
	
	@RequestMapping(value="/getToDecrement",method=RequestMethod.POST)
	public  @ResponseBody void  geToDecrement(@RequestBody Decrement d, HttpServletRequest request,HttpSession session) {
	       dao.decreaseCount(d, session);	       
	   }
	   
	@RequestMapping(value="/getAddress",method = RequestMethod.GET)
	public @ResponseBody
	String addAddress(HttpServletRequest request, HttpServletResponse response,HttpSession session)
    throws Exception {
			String json =dao.addressData(session);
			return json;
	}
	
}
