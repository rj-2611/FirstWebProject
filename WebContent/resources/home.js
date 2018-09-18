
	/*Angular Modules*/
	angular.module('emartHome', [])
    	.controller('emartControl', ['$scope','$http', function($scope,$http) {
		    	
    		/*Variable Declarations*/
	    	var index1="", index2="" , index3="";
	    	var myObj, myJSON, text, jsontxt;
	    	var txt1="",txt2="",txt3="" , i;
	        
	        $scope.counter = 0;
	        $scope.count = 0;
	        $scope.orderTotal = 0;
	        $scope.cart = [];
	        $scope.total = 0;	
	        $scope.msg = "";
	        
	        /*Getting data from tables like Mobiles,Laptops and Headphones*/
	        $http({method : 'GET',url : 'http://localhost:8080/FirstWebProject/getMobileData'})
			.then(function(response) {
				$scope.mobiledata = response.data;
			});
	        $http({method : 'GET',url : 'http://localhost:8080/FirstWebProject/getLaptopData'})
			.then(function(response) {
				$scope.laptopdata = response.data;
			});
	        $http({method : 'GET',url : 'http://localhost:8080/FirstWebProject/getHeadphoneData'})
			.then(function(response) {
				$scope.hpdata = response.data;
			});
	        
	        /*When the cart button is clicked*/
	        $("#cart-click").on("click",function first(){
	        	/*Ajax call to retrieve cart's data from DB*/
	        	$http({method : 'GET',url : 'http://localhost:8080/FirstWebProject/getCartData'})
				.then(function(response) {
				    cartData = response.data;
				    $scope.cart = cartData;
				    $scope.counter = $scope.cart.length;
				
	        	if($scope.counter==0){
	        		$(".empty-cart").show();
	        		$(".product-page").hide();
		            $(".front-page").hide();
		            $(".cart").hide();
		            $(".empty-orders").hide();
		            $(".myorders").hide();
	        	}
	        	else{
	        		$(".cart").show();
	        		$(".product-page").hide();
		            $(".front-page").hide();
		            $(".empty-cart").hide();
		            $(".empty-orders").hide();
		            $(".myorders").hide();
	        	}	    
				});
	        })
	        
	        /*When the MyOrders button is clicked*/
	        $("#orders").on("click",function first(){
	        	/*Ajax call to retrieve MyOrders's data from DB*/
	        	$http({method : 'GET',url : 'http://localhost:8080/FirstWebProject/getOrdersData'})
				.then(function(response) {
				    ordersData = response.data;
				    $scope.orders = ordersData;
				    $scope.ordersCount = $scope.orders.length;
				    
		        	if($scope.ordersCount==0){
		        		$(".empty-orders").show();
		        		$(".product-page").hide();
			            $(".front-page").hide();
			            $(".cart").hide();
			            $(".myorders").hide();
			            $(".empty-cart").hide();
		        	}
		        	else{
		        		$(".myorders").show();
		        		$(".product-page").hide();
			            $(".front-page").hide();
			            $(".empty-cart").hide();
			            $(".empty-orders").hide();
			            $(".cart").hide();
		        	}	    
				});
	        	/*Ajax call to retrieve user's address from DB*/
	        	$http({method : 'GET',url : 'http://localhost:8080/FirstWebProject/getAddress'})
				.then(function(response) {
					var name="", addr="", contact="";
					$scope.address = response.data;
					name = $scope.address[0].addressname;
					addr = $scope.address[0].address;
					contact = $scope.address[0].phone;
					if(name != undefined){
						document.getElementById("addr").innerHTML = "<b>Shipping Address:<b>" + "<br>" + name + ",<br>"+ addr + ",<br>Contact: " + contact;
					}
				});
	        })
	        
	        /*When the home button is clicked*/
	        $("#home").on("click",function(){
	        	/*Ajax call to retrieve cart's data from DB to display the cart's count*/
	        	$http({method : 'GET',url : 'http://localhost:8080/FirstWebProject/getCartData'})
				.then(function(response) {
				    cartData = response.data;
				    $scope.cart = cartData;
				    $scope.counter = $scope.cart.length;
				});
	        	
	        	/*Show/Hide functionalities*/ 
		        $(".front-page").show();
		        $(".product-page").hide();
		        $(".cart").hide();
		        $(".empty-cart").hide();
		        $(".empty-orders").hide();
		        $(".myorders").hide();
	        });
	        
	        
	/*When the page is ready*/
    $(document).ready(function(){
    	
    	/*Getting MyOrders Data from DB*/
    	$http({method : 'GET',url : 'http://localhost:8080/FirstWebProject/getOrdersData'})
		.then(function(response) {
		    ordersData = response.data;
		    $scope.orders = ordersData;
    	for(var x in $scope.orders){
	    	$scope.orderTotal += $scope.orders[x].price*$scope.orders[x].count;				    	
	    }
    	});
    	
    	/*Getting cart data from DB*/
    	$http({method : 'GET',url : 'http://localhost:8080/FirstWebProject/getCartData'})
		.then(function(response) {
		    cartData = response.data;
		    $scope.cart = cartData;
		    $scope.counter = $scope.cart.length;
		    for(var x in $scope.cart){
		    	$scope.total+=$scope.cart[x].price*$scope.cart[x].count;
		    }	       
				    
			/*When a cell phone is clicked*/	
			$(document).on('click', '.click-phn', function fun1() {
				
				/*Show/Hide functionalities*/
				$(".search-dropdown-content").css("display","none");
				$(".product-page").show();
    	        $(".front-page").hide();
    	        $(".cart").hide();
    	        $(".empty-cart").hide();	
    	        $(".empty-orders").hide();
	            $(".myorders").hide();
	            
    	        /*Variable Declarations*/
	            index1 = this.id;
	            var x1 , y1 , tableData1="";
	            
	            /*Ajax Call to get Mobiles data from DB*/
				$http({method : 'GET',url : 'http://localhost:8080/FirstWebProject/getMobileData'})
				.then(function(resp) {
				  var mobilePhones="";
				
		          mobilePhones = resp.data; 						      
			      var keys = Object.keys(mobilePhones[0]);
				  
			      /*Setting up the product page*/
			      $("#name-tag").text(mobilePhones[index1].name);      
			      $("#price-tag").text("₹" + mobilePhones[index1].price);
			      $("#img-tag").attr("src",mobilePhones[index1].imgurl);
			      $("#img-tag").css({"width" : "250" , "height" : "540"});
		
		          for(var x=4;x<=9;x++){
		            	var values = Object.values(mobilePhones[index1]);
		                tableData1 += "<tr>";
		
		                tableData1 += "<td>" + keys[x] + "</td>";		                	                
		                tableData1 += "<td>" + values[x] + "</td>";
		
		                tableData1 += "<\tr>"
		          }
	
		          $("#table-tag").html(tableData1);
	            
		        /*Adding a cell phone to the cart*/
	            $scope.addToCart = function() {
	            		
	            		/*If there's nothing inside the cart*/
	            		if($scope.cart.length===0){
		                	$scope.counter++;
		                    mobilePhones[index1].count = 1;			            
		                    $scope.total += parseFloat(mobilePhones[index1].price);
		                    
		                    $http({method : 'POST',url : 'http://localhost:8080/FirstWebProject/getJson',data : mobilePhones[index1]})
							.then(function() {
							    
							});
		                    
		                    var y = document.getElementById("added");
		            	    y.className = "show";
		            	    setTimeout(function(){ y.className = y.className.replace("show", ""); }, 3000);
		                }
	            		/*If the cart is not empty*/
	            		else{
		                    var repeat = false;
		                    for(var k = 0; k < $scope.cart.length; k++){
		                        if($scope.cart[k].name === mobilePhones[index1].name){
		                            repeat = true;
		                        }
		                    }
		                    /*If the cart already has that particular product*/  
		                    if(repeat){
		                    	    var x = document.getElementById("snackbar");
		                    	    x.className = "show";
		                    	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
		                    }
		                    /*If not*/
		                    else {
		                    	$scope.counter++;
		                        mobilePhones[index1].count = 1;
		                        $scope.total += parseFloat(mobilePhones[index1].price);
		                        $http({method : 'POST',url : 'http://localhost:8080/FirstWebProject/getJson',data : mobilePhones[index1]})
								.then(function() {
								    
								});	
		                 
		                        var z = document.getElementById("added");
		                	    z.className = "show";
		                	    setTimeout(function(){ z.className = z.className.replace("show", ""); }, 3000);
		                    }		            	
		                }					            	
		            };            
            });
        });
						
		    
			/*When a Laptop is clicked*/
			$(document).on('click', '.click-lappy', function fun2() {
				
				$(".search-dropdown-content").css("display","none");
				$(".product-page").show();
    	        $(".front-page").hide();
    	        $(".cart").hide();
    	        $(".empty-cart").hide();
    	        $(".empty-orders").hide();
	            $(".myorders").hide();
    	        
	            index2 = this.id;
	            var x2 , y2 , tableData2="";
	            
	            $http({method : 'GET',url : 'http://localhost:8080/FirstWebProject/getLaptopData'})
				.then(function(resp) {
					  var laptop="";					
			          laptop = resp.data; 				
				      var keys = Object.keys(laptop[0]);
	            
		            $("#name-tag").text(laptop[index2].name);
		            $("#price-tag").text("₹" + laptop[index2].price);
		            $("#img-tag").attr("src",laptop[index2].imgurl);
		            $("#img-tag").css({"width" : "350" , "height" : "350"});
		            for(var x=4;x<=9;x++){
		            	var values = Object.values(laptop[index2]);
		                tableData2 += "<tr>";
		
		                tableData2 += "<td>" + keys[x] + "</td>";		                	                
		                tableData2 += "<td>" + values[x] + "</td>";
		
		                tableData2 += "<\tr>"
		            }
	
		            $("#table-tag").html(tableData2);
	            
		            /*When a laptop is added to cart*/
		            $scope.addToCart = function() {
		            	
		            	if($scope.cart.length===0){
		            		$scope.counter++;
		                    laptop[index2].count = 1;			                   
		                    $scope.total += parseFloat(laptop[index2].price);
		                    
		                    $http({method : 'POST',
		                    	url : 'http://localhost:8080/FirstWebProject/getJson',
		                    	data : laptop[index2]
		                    }).then(function() {
							    
							});
		                
		                    var y = document.getElementById("added");
		            	    y.className = "show";
		            	    setTimeout(function(){ y.className = y.className.replace("show", ""); }, 3000);
		                }
	            	
		                else{
		                    var repeat = false;
		                    for(var k = 0; k < $scope.cart.length; k++){
		                        if($scope.cart[k].name === laptop[index2].name){
		                            repeat = true;
		                        }
		                    }
		                    if(repeat){
		                    	    var x = document.getElementById("snackbar");
		                    	    x.className = "show";
		                    	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
		                    }
		                    else {
		                    	$scope.counter++;
		                        laptop[index2].count = 1;
		                        $scope.total += parseFloat(laptop[index2].price);
		                        
		                        $http({method : 'POST',
		                        	url : 'http://localhost:8080/FirstWebProject/getJson',
		                        	data : laptop[index2]
		                        }).then(function() {
								    
								});		                        
		                      
		                        var z = document.getElementById("added");
		                	    z.className = "show";
		                	    setTimeout(function(){ z.className = z.className.replace("show", ""); }, 3000);
		                    }					            	
		                }					 
		            };  
            });
        });
			
			/*When a headphone is clicked*/
			$(document).on('click', '.click-hp', function fun3() {							
				
				$(".search-dropdown-content").css("display","none");
				$(".product-page").show();
    	        $(".front-page").hide();
    	        $(".cart").hide();
    	        $(".empty-cart").hide();
    	        $(".empty-orders").hide();
	            $(".myorders").hide();
	            
				index3 = this.id;
	            var x3 , y3 , tableData3="";
	
	            $http({method : 'GET',url : 'http://localhost:8080/FirstWebProject/getHeadphoneData'})
				.then(function(resp) {
					  var headPhones="";
					
			          headPhones = resp.data; 				
				      var keys = Object.keys(headPhones[0]);		            
		            
		            $("#name-tag").text(headPhones[index3].name);
		            $("#price-tag").text("₹" + headPhones[index3].price);
		            $("#img-tag").attr("src",headPhones[index3].imgurl);
		            $("#img-tag").css({"width" : "350" , "height" : "350"});
		            for(var x=4;x<=8;x++){
		            	var values = Object.values(headPhones[index3]);
		                tableData3 += "<tr>";
		
		                tableData3 += "<td>" + keys[x] + "</td>";		                	                
		                tableData3 += "<td>" + values[x] + "</td>";
		
		                tableData3 += "<\tr>"
		            }
		
		            $("#table-tag").html(tableData3);
	          
		            /*When a headphone is added to the cart*/
		            $scope.addToCart = function() {
	            	
		            	if($scope.cart.length===0){
		            		$scope.counter++;
		                    headPhones[index3].count = 1;			                   
		                    $scope.total += parseFloat(headPhones[index3].price);
		                    
		                    $http({method : 'POST',
		                    	url : 'http://localhost:8080/FirstWebProject/getJson',
		                    	data : headPhones[index3]
		                    }).then(function() {
							    
							});
		                   
		                    var y = document.getElementById("added");
		            	    y.className = "show";
		            	    setTimeout(function(){ y.className = y.className.replace("show", ""); }, 3000);
		                }
	            	
		                else{
		                    var repeat = false;
		                    for(var k = 0; k < $scope.cart.length; k++){
		                        if($scope.cart[k].name === headPhones[index3].name){
		                            repeat = true;
		                        }
		                    }
		                    if(repeat){
		                    	    var x = document.getElementById("snackbar");
		                    	    x.className = "show";
		                    	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
		                    }
		                    else {
		                    	$scope.counter++;
		                        headPhones[index3].count = 1;
		                        $scope.total += parseFloat(headPhones[index3].price);
		                        
		                        $http({method : 'POST',
		                        	url : 'http://localhost:8080/FirstWebProject/getJson',
		                        	data : headPhones[index3]
		                        }).then(function() {
								    
								});
		                       
		                        var z = document.getElementById("added");
		                	    z.className = "show";
		                	    setTimeout(function(){ z.className = z.className.replace("show", ""); }, 3000);
		                    }
		            	
		                }					            	
		            };				           
            });
        });
		
		/*Removing an item from cart*/
		$scope.removeItemCart = function(product){
        	$scope.counter--;
        	$scope.total -= parseFloat(product.price*product.count);
            var index = $scope.cart.indexOf(product);
            $scope.cart.splice(index, 1);
            $http({
            	method : 'POST',
            	url : 'http://localhost:8080/FirstWebProject/getToRemove',
            	data : product
            }).then(function() {
			    
			});
            
            if($scope.counter === 0){
            	$(".empty-cart").show();
            	$(".cart").hide();
            }
        };		
		
        /*Incrementing the count of a product in cart*/
        $scope.increase = function(product) {
            product.count +=1;
            $scope.total += parseFloat(product.price);
            $http({
            	method : 'POST',
            	url : 'http://localhost:8080/FirstWebProject/getToIncrement',
            	data : product
            }).then(function() {
			    
			});
        }
        
        /*Decrementing the count of a product in cart*/
        $scope.decrease = function(product) {
            if(product.count > 1){
                product.count -= 1;
                $http({
                	method : 'POST',
                	url : 'http://localhost:8080/FirstWebProject/getToDecrement',
                	data : product
                }).then(function() {
				    
				});
            }
            else if(product.count === 1){
                var index = $scope.cart.indexOf(product);
                $scope.cart.splice(index, 1);
                $scope.counter--;
                $http({
                	method : 'POST',
                	url : 'http://localhost:8080/FirstWebProject/getToRemove',
                	data : product
                }).then(function() {
				    
				});
            }
            $scope.total -= parseFloat(product.price);
            if($scope.counter === 0){
            	$(".empty-cart").show();
            	$(".cart").hide();
            }
        }
        
        /*Sign Up form Validation*/
        $scope.submitForm = function(isValid) {if (isValid) { }}  
        
	    });
	 });
  }]);
	
	/*Search Functionality*/
	$(document).ready(function(){		
		  $("#myInput").on("keyup", function() {		  
		  	if($('#myInput').val() == ''){
		      	$(".search-dropdown-content").css("display","none");
		    }
		  	else{
		  		$(".search-dropdown-content").css("display","block");
		    } 
		    var value = $(this).val().toLowerCase();
		    $("#myList li").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	$(document).click(function(e) {
	    var target = e.target;

	    if (!$(target).is('.search-dropdown-content') && !$(target).parents().is('.search-dropdown-content')) {
	        $('.search-dropdown-content').hide();
	    }
	});
	
	
	
	
	/*Slick Carousel and Show/Hide Functionality*/
	$(document).ready(function(){

	    $(".mySlick").slick({

	    	  // normal options...
	    	  infinite: false,

	    	  // the magic
	    	  responsive: [{
	    		  breakpoint: 1500,
	    		  settings: {
	    			  slidesToShow: 5,
	    			  infinite: false
	    		  }

	    	  },
	    	   {

	    	      breakpoint: 800,
	    	      settings: {
	    	        slidesToShow: 4,
	    	        infinite: false
	    	      }

	    	    }, {

	    	      breakpoint: 600,
	    	      settings: {
	    	        slidesToShow: 3,
	    	        dots: false
	    	      }

	    	    }, {

	    	      breakpoint: 300,
	    	      settings: "unslick" // destroys slick

	    	    }]
	    	});
	    $(".product-page").hide();
	    $(".cart").hide();
	    $(".empty-cart").hide();
	    
	    $(".myorders").hide();
	    $(".empty-orders").hide();
	
	    $("#loginBtn").click(function(){
	        $("#loginModal").modal();
	    });
	    
	    $("#signupBtn").click(function(){
	        $("#signupModal").modal();
	    });  
	});			
	/*Some Alerts*/
	function funAlert(){
		alert("Please Sign In to avail this facilty.");
	}
	function orderCancelled(){
		alert("Your Order has been cancelled.\nContinue Shopping.");
	}