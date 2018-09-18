<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page session="true"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <title>e-MART</title>
        <!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        
        <spring:url value="/resources/home.css" var="homeCSS" />
        <spring:url value="/resources/searchbar.css" var="searchbarCSS" />
        <spring:url value="/resources/orders.css" var="ordersCSS" />
        <spring:url value="/resources/menuButton.css" var="mBCSS" />
        <spring:url value="/resources/complex.css" var="complexCSS" />
        <spring:url value="/resources/cartPage.css" var="cPCSS" />
        <spring:url value="/resources/modal.css" var="modalCSS" />
        <spring:url value="/resources/productpage.css" var="ppCSS" />
        <spring:url value="/resources/slick.css" var="slickCSS" />
        <spring:url value="/resources/slick-theme.css" var="stCSS" />
        <link href="${homeCSS}" rel="stylesheet" />
        <link href="${mBCSS}" rel="stylesheet" />
        <link href="${complexCSS}" rel="stylesheet" />
        <link href="${cPCSS}" rel="stylesheet" />
        <link href="${modalCSS}" rel="stylesheet" />
        <link href="${ordersCSS}" rel="stylesheet" />
        <link href="${ppCSS}" rel="stylesheet" />
        <link href="${slickCSS}" rel="stylesheet" />
        <link href="${stCSS}" rel="stylesheet" />
        <link href="${searchbarCSS}" rel="stylesheet" />
        
        <spring:url value="/resources/home.js" var="homeJS" />
        <spring:url value="/resources/slick.min.js" var="smJS" />
        <script src="${homeJS}"></script>
        <script src="${smJS}"></script>
               
    </head>
    
    <body ng-app="emartHome" ng-controller="emartControl">
       
        <!--Navigation Bar-->
        <section>
            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>                        
                        </button>
                        <a class="navbar-brand" href="emart" id="home" style="font-size: 25px;"><strong><em>e-MART</em></strong></a>
                    </div>
                    <form class="navbar-form navbar-left">
                    	<div class="input-group">                   	
                    	<div class="search-bar">
		                    <div class="search-dropdown">		                    	
		                    	<div class="form-group has-feedback">
		                    		<input class="form-control" id="myInput" type="text" placeholder="Search for a product.." autocomplete="off">
		                    		<i class="glyphicon glyphicon-search form-control-feedback" style="margin-top: 2px; color: #606060;"></i>
		                    	</div>
		                        
		                        <div class="search-dropdown-content">		                            
	                                <ul id="myList">
	                                    <li ng-repeat="md in mobiledata" class="click-phn" id={{md.id}}><a href="#">{{md.name}}</a></li>
	                                    <li ng-repeat="ld in laptopdata" class="click-lappy" id={{ld.id}}><a href="#">{{ld.name}}</a></li>
	                                    <li ng-repeat="hd in hpdata" class="click-hp" id={{hd.id}}><a href="#">{{hd.name}}</a></li>
	                                </ul>		                            
		                        </div>
		                    </div>
		                    </div>
		                </div>
                    </form>
                    <%-- <form class="navbar-form navbar-left" action="/action_page.php">
					  <div class="input-group">
					    <input type="text" class="form-control" placeholder="Search">
					    <div class="input-group-btn">
					      <button class="btn btn-default" type="submit">
					        <i class="glyphicon glyphicon-search"></i>
					      </button>
					    </div>
					  </div>
					</form> --%>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav navbar-right">                         
                            <li>
                            	<c:choose>
                            		<c:when test = "${empty loggedInUser}">
                            			<a href="login" id="loginBtn"><span class="glyphicon glyphicon-user"></span> Login & Signup</a>
                            		</c:when>
                            		<c:otherwise>
                            			<li class="dropdown">
	                            				<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="line-height: 130%;"><span class="glyphicon glyphicon-user\"></span> Hi ${loggedInUser.name} <span class="caret"></span></a>
	                            				<ul class="dropdown-menu">
	                            					<li><a id="orders" href="">My Orders</a></li>
	                            					<li><a href="signout">Signout</a></li>
                            					</ul>
                            			</li>
                            		</c:otherwise>
                            	</c:choose>
                            </li>
                            
                            <li>
                                <a id="cart-click"><span class="glyphicon glyphicon-shopping-cart"><span class="badge badge-notify" id="countHolder">{{counter}}</span></span> Cart</a>      
                            </li>
                            <li class="dropdown">   
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="line-height: 130%;"><span class="caret"></span> More</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Sell on e-MART</a></li>
                                    <li><a href="#">24x7 Customer Care</a></li>
                                    <li><a href="#">Advertise</a></li>
                                    <li><a href="#">Download App</a></li>
                                </ul>
                            </li>  
                        </ul>
                    </div>
                </div>
            </nav>
        </section>
        
        <!--Front Page(Including all the carousels)-->
        <div class="front-page">
            
            <!--Primary Carousel-->
            <section>
                
                  <div id="myCarousel" class="carousel slide" data-ride="carousel">
                      <ol class="carousel-indicators">
                          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                          <li data-target="#myCarousel" data-slide-to="1"></li>
                          <li data-target="#myCarousel" data-slide-to="2"></li>
                      </ol>

                      <div class="carousel-inner">
                          <div class="item active">
                              <div class="img-wrap"> <img src="${pageContext.request.contextPath}/resources/pics/mobile1.jpg" alt="mobile phones" style= "width: 100%;height:350px;"></div>
                              <div class="carousel-caption">
                                  <h3>Upto 20% Discounts</h3>
                                  <p>Get Hottest Deals on Phones.</p>
                              </div>
                          </div>

                          <div class="item">
                              <div class="img-wrap"> <img src="${pageContext.request.contextPath}/resources/pics/lappy1.jpg" alt="laptops" style="width: 100%; height:350px;">
                          </div>
                              <div class="carousel-caption">
                                  <h3>Upto 10% Cashbacks on Laptops</h3>
                                  <p>Hurry! Only for a limited time.</p>
                              </div>
                          </div>

                          <div class="item">
                              <div class="img-wrap"> <img src="${pageContext.request.contextPath}/resources/pics/headphones1.jpg" alt="headphones" style="width: 100%; height:350px;">
							 </div>
                              <div class="carousel-caption">
                                  <h3>Flat 30% Off on Headphones</h3>
                                  <p>Grab it before it ends.</p>
                              </div>
                          </div>
                      </div>

                      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                          <span class="glyphicon glyphicon-chevron-left"></span>
                          <span class="sr-only">Previous</span>
                      </a>
                      <a class="right carousel-control" href="#myCarousel" data-slide="next">
                          <span class="glyphicon glyphicon-chevron-right"></span>
                          <span class="sr-only">Next</span>
                      </a>
                  </div>
            </section>
			
			<!--The Menu Button-->
            <section>
            	<div class="container">
            		<div class="row">
            			<div class="col-md-4 py-1">
            				<div class="menu-bar">
			                    <div class="dropdown">
			                        <button class="dropbtn"><em>e-MART</em> MENU <span class="caret"></span></button>
			                        <div class="dropdown-content">
			                            <div id="divMenu">
			                                <ul>
			                                    <li><a href="#" id="menu-mob">Mobiles<span><i class="fa fa-angle-right"></i></span></a>
			                                        <ul>
														<li ng-repeat="md in mobiledata" class="click-phn" id={{md.id}}><a href="#">{{md.name}}</a></li>
			                                        </ul>
			                                    </li>
			                                    <li><a href="#" id="menu-lap">Laptops<span><i class="fa fa-angle-right"></i></span></a>
			                                        <ul>
														<li ng-repeat="ld in laptopdata" class="click-lappy" id={{ld.id}}><a href="#">{{ld.name}}</a></li>
			                                        </ul>
			                                    </li>
			                                    <li><a href="#" id="menu-hp">Headphones<span><i class="fa fa-angle-right"></i></span></a>
			                                        <ul>
														<li ng-repeat="hd in hpdata" class="click-hp" id={{hd.id}}><a href="#">{{hd.name}}</a></li>
			                                        </ul>
			                                    </li>
			                                </ul>
			                            </div>
			                        </div>
			                    </div>
			                </div>
            			</div>
            			<div class="col-md-8 py-1">
            				<h2 class="center brown">Look what do we have in Store for you.</h2>		
            			</div> 
            		</div>
            	</div>
            </section>
			
            <!--Further More Carousels(Phones,Laptops,Headphones)-->
            <section>
                <div class="phones">
                    <div class="container">        
                        <div class="row">
                            <div class="col-md-4 center">
                                <br><br><br><br>
                                <h2>Attractive Offers on Mobile Phones</h2>
                            </div>
                            <div class="col-md-8">
                                <div class="mySlick">
                                    <div class="click-phn zoom" id="0">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/oppo.jpeg" class="img-responsive">
                                        OPPO F5 YOUTH</a>
                                    </div>
                                    <div class="click-phn zoom" id="1">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/infinix.jpeg" class="img-responsive">INFINIX HOT S3</a>  
                                    </div>
                                    <div class="click-phn zoom" id="2">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/redmi.jpeg" class="img-responsive">
                                        REDMI NOTE 4</a>
                                    </div>
                                    <div class="click-phn zoom" id="3">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/honor.jpeg" class="img-responsive">
                                         HONOR 9 LITE</a>
                                    </div>
                                    <div class="click-phn zoom" id="4">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/moto.jpeg"  class="img-responsive">
                                        MOTO X4</a>
                                    </div>
                                    <div class="click-phn zoom" id="5">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/samsung.jpeg" class="img-responsive">
                                        SAMSUNG GALAXY ON</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
             
            <section>
                <div class="laptops">
                    <div class="container">        
                        <div class="row">
                            <div class="col-md-4 center">
                                <br>
                                <h2>Grab the best deals on Laptops</h2>
                            </div>
                            <div class="col-md-8">
                                <div class="mySlick">
                                    <div class="zoom click-lappy" id="0">
                                         <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/hp.jpeg" class="img-responsive">
                                                HP LAPTOP</a>
                                    </div>
                                    <div class="zoom click-lappy" id="1">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/dell.jpeg"  class="img-responsive">
                                                DELL INSPIRON</a>
                                    </div>
                                    <div class="zoom click-lappy" id="2">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/lenovoyoga.jpeg" class="img-responsive">
                                                LENOVO YOGA</a>
                                    </div>
                                    <div class="zoom click-lappy" id="3">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/asus.jpeg" class="img-responsive">
                                                ASUS X104T</a>
                                    </div>
                                    <div class="zoom click-lappy" id="4">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/applemacbookpro.jpeg" class="img-responsive">
                                                APPLE MACBOOK PRO</a>
                                    </div>
                                    <div class="zoom click-lappy" id="5">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/acernotebook.jpeg" class="img-responsive">
                                                ACER NOTEBOOK</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
            <section>
                <div class="phones">
                    <div class="container">        
                        <div class="row">
                            <div class="col-md-4 center">
                                <br><br><br>
                                <h2>Your Favorite Brands in Store Now</h2>
                            </div>
                            <div class="col-md-8">
                                <div class="mySlick">
                                    <div class="zoom click-hp" id="0">
                                         <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/bose.jpeg" class="img-responsive">
                                                BOSE HEADSET</a>
                                    </div>
                                    <div class="zoom click-hp" id="1">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/sony.jpeg"  class="img-responsive">
                                                SONY</a>
                                    </div>
                                    <div class="zoom click-hp" id="2">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/infinixquiet.jpeg" class="img-responsive">
                                                INFINIX QUIET</a>
                                    </div>
                                    <div class="zoom click-hp" id="3">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/skullcandy.jpeg" class="img-responsive">
                                                SKULLCANDY</a>
                                    </div>
                                    <div class="zoom click-hp" id="4">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/smartbuy.jpeg" class="img-responsive">
                                                e-MART SMARTBUY</a>
                                    </div>
                                    <div class="zoom click-hp" id="5">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/pics/att.jpeg" class="img-responsive">
                                                ATandT</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        
        </div>  

        
        <!--Product Page-->
        <section>
            <div class="product-page">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 py-1">
                            <div class="product-img">
                                <div>
                                    <img id="img-tag" src="" class="image-responsive">
                                </div>
                                <div class="addtocart">  
                                  	<c:choose>
      		                      		<c:when test = "${empty loggedInUser}">
      		                      			<form>
	      		                      			<button id="addcart" onclick="funAlert()">
	                                            <strong>Add To Cart</strong>
                                            </form>
                                        </button>
      		                      		</c:when>
                            		<c:otherwise>
                            			<form>
	                                        <button id="addcart" ng-click="addToCart()">
	                                            <strong>Add To Cart</strong>
	                                        </button>
                                    	</form>
                            		</c:otherwise>
                            	</c:choose>
                                    
                                    <div id="snackbar">Item Already Added to cart by You</div>
                                    <div id="added">Item successfully added to your cart</div> 
                                </div>
                            </div>  
                        </div>
                        <div class="col-md-7 py-1">
                            <div class="product-specs">
                                <h3 id="name-tag"></h3>
                                <h4>(e-MART Assured)</h4>
                                <br>
                                <h2 id="price-tag">₹</h2>
                                <br>
                                <ul>
                                    <li>
                                        <span><i class="material-icons" style="float: left;">&#xe616;</i></span> &nbsp;No Cost EMIs<br>
                                    </li>
                                    <li>
                                        <i class="fa fa-exchange" style="font-size:20px"></i> Get upto 5000 off on exchange<br>
                                    </li>
                                    <li>
                                        <i class="material-icons" style="float: left;">&#xe54e;</i> &nbsp;Bank Offer: Extra 5% off with AXIS bank credit card<br>
                                    </li>
                                    <li>
                                        <i class="material-icons" style="float: left;">&#xe3d0;</i> &nbsp;First time buyers, get exciting coupons<br>
                                    </li>
                                </ul>
                                <div> 
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Features</th>
                                                <th>Specifications</th>
                                            </tr>
                                        </thead>
                                        <tbody id="table-tag">
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>        
                </div>
            </div>
        </section>        
        
        <!-- Cart -->
        <section>
            <div class="cart">
                <div class="container">
                	<div class="cart-header">
                        <h1>Items In Your Cart</h1>
                    </div>
                    <table class="table">                        
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>SubTotal</th>
                                <th>Remove from Cart</th>
                            </tr>
                        </thead>
                        <tbody id="cartBody">
                            <tr ng-repeat="c in cart">
                                <td>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img ng-src="{{c.imgurl}}" width="70" height="130">            
                                        </div>
                                        <div class="col-md-10">
                                           &nbsp; &nbsp; &nbsp;&nbsp; {{c.name}} <br>
                                            <!-- Specifications: {{c.os}} {{c.ram}} {{c.connectivity}} {{c.connector}} {{c.size}} --> 
                                        </div>
                                    </div>                                
                                </td>
                                <td>
                                    {{c.price | currency:"₹":0}}
                                </td>
                                <td>
                                    {{c.count}} &nbsp;&nbsp;
                                    <button ng-click="increase(c)"><i class="fa fa-plus"></i></button>
                                    <button ng-click="decrease(c)"><i class="fa fa-minus"></i></button>
                                </td>
                                <td>
                                    {{c.price*c.count | currency:"₹":0}}
                                </td>
                                <td style="text-align: center;">
                                    <button class="btn btn-danger btn-sm" ng-click="removeItemCart(c)"><i class="fa fa-trash-o"></i></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="rightAlign">
	                  	<h3>Total : {{total | currency:"₹":0}} &nbsp;&nbsp;&nbsp;&nbsp;<a href="checkout"><button class="btn btn-lg btn-success">CheckOut</button></a></h3>	                    
                    </div>
                </div>
            </div>
        </section>
        <section>
          	<div class="empty-cart">
        		<h1 class="center brown">
        			<br><br>
        				Cart Is Empty..
        		</h1>
        	</div>
        </section>          
        
        <!-- MyOrders -->
        <section>
            <div class="myorders">
                <div class="container">
                	<div class="order-header">
                        <h1>Orders Placed by You</h1>
                    </div>
                    <table class="table">                        
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>SubTotal</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody id="orderBody">
                            <tr ng-repeat="o in orders">
                                <td>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img ng-src="{{o.imgurl}}" width="70" height="130">            
                                        </div>
                                        <div class="col-md-10">
                                           &nbsp; &nbsp; &nbsp;&nbsp; {{o.name}} <br>
                                            <!-- Specifications: {{c.os}} {{c.ram}} {{c.connectivity}} {{c.connector}} {{c.size}} --> 
                                        </div>
                                    </div>                                
                                </td>
                                <td>
                                    {{o.price | currency:"₹":0}}
                                </td>
                                <td>
                                    {{o.count}} &nbsp;&nbsp;
                                    <!-- <button ng-click="increase(c)"><i class="fa fa-plus"></i></button>
                                    <button ng-click="decrease(c)"><i class="fa fa-minus"></i></button> -->
                                </td>
                                <td>
                                    {{o.price*o.count | currency:"₹":0}}
                                </td> 
                                <td style="text-align: center;">
                                    <b>Processing</b>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="row bottom-space">
                    	<div class="col-md-4 py-1" id="addr">
                    		               		
                    	</div>
                    	<div class="col-md-4 py-1">
                    		<h3>Total Amount to be Paid: {{orderTotal | currency:"₹":0}}</h3>
                    	</div>
                    	<div class="col-md-2 py-1 top-space">
                    		<a href="emart"><button class="btn btn-lg btn-primary">Continue Shopping</button></a>
                    	</div>
                    	<div class="col-md-2 py-1 top-space">
                    		<a href="cancelOrder"><button class="btn btn-lg btn-danger" onclick="orderCancelled()">Cancel Order</button></a>
                    	</div>
                    </div>
                </div>
            </div>
        </section> 
        <section>
          	<div class="empty-orders">
        		<h1 class="center brown">
        			<br><br>
        				You Haven't Placed any Order Yet..
        		</h1>
        	</div>
        </section>   
        
        <!--Footer-->
        <footer class="center">
            <div class="lists">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 py-1 left border-right">
                            <ul>
                                <li>
                                    <strong>HELP</strong>
                                </li>
                                <li>
                                    <a href="#">Payments</a>
                                </li>
                                <li>
                                    <a href="#">Shipping</a>
                                </li>
                                <li>
                                    <a href="#">FAQs</a>
                                </li>
                                <li>
                                    <a href="#">Report</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-4 py-1 left border-right">
                            <ul>
                                <li>
                                    <strong>e-MART</strong>
                                </li>
                                <li>
                                    <a href="#">Contact Us</a>
                                </li>
                                <li>
                                    <a href="#">About Us</a>
                                </li>
                                <li>
                                    <a href="#">Careers</a>
                                </li>
                                <li>
                                    <a href="#">Sell on e-MART</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-4 py-1 left">
                            <ul>
                                <li>
                                    <strong>MISC</strong>
                                </li>
                                <li>
                                    <a href="#">Office Addresses</a>
                                </li>
                                <li>
                                    <a href="#">Write To Us</a>
                                </li>
                                <li>
                                    <a href="#">Terms Of Use</a>
                                </li>
                                <li>
                                    <a href="#">Sitemap</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="line">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 py-1">
                            <strong>Policies: </strong>
                            <a href="#">Returns Policy</a> |
                            <a href="#"> Terms Of Use</a> |
                            <a href="#"> Privacy</a>
                        </div>
                        
                        <div class="col-md-4 py-1 center" style="margin-top: 3px;">
                            <strong>Keep In Touch: &nbsp; </strong>
                            <a href="#"><i class="fa fa-facebook-square"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter-square"></i></a>
                            <a href="#"><i class="fa fa-google-plus-square"></i></a>
                        </div>
                        
                        <div class="col-md-4 py-1 center">
                            <strong>Â© 2017-2018 eMART.com</strong>
                        </div>
                    </div>
                </div>
            </div>
        </footer> 

    </body>
</html>