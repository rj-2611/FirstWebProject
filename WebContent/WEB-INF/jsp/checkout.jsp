<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CheckOut</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<spring:url value="/resources/signup.css" var="signupCSS" />
<link href="${signupCSS}" rel="stylesheet" />

</head>
<body ng-app="checkoutApp" ng-controller="checkoutController">

<div class="container">
  	<div class="row">
	  	<div class="col-lg-3 py-1">
	  		<h3><a href="emart"><b>e-<em>MART</em></b></a></h3>
	  	</div>
	  	<div class="col-lg-6 py-1">
	  		
	  		<h3>Place Your Order</h3>
	  		
	  		<form name="checkoutForm" action="receiveOrders" method="post" ng-submit="submitForm(checkoutForm.$valid)" class="padded">				    
			    <div class="form-group">			
				    <label for="name"><b><span class="glyphicon glyphicon-edit"></span> Name</b></label>
				    <input ng-model="checkout.name" type="text" placeholder="Enter Your Name" name="name" required="required"/>
				    <p class="red" ng-show="checkoutForm.name.$invalid && !checkoutForm.name.$pristine" class="help-block red">Your name is required.</p>
				</div>
				
				<div class="form-group">
					<label for="address"><b><span class="glyphicon glyphicon-home"></span> Address</b></label>
				    <textarea ng-model="checkout.address" class="form-control" rows="5" id="address" name="address" placeholder="Please enter your full address (location, city, zipcode, state)" required="required"></textarea>
				    <p class="red" ng-show="checkoutForm.address.$invalid && !checkoutForm.address.$pristine" class="help-block red">Your Address is required.</p>
				</div>
				
				<div class="form-group">
					<label for="phone"><b><span class="glyphicon glyphicon-user"></span> Mobile Number</b></label>
				    <input ng-model="checkout.phone" ng-pattern="/^[0-9]*$/" type="text" placeholder="Enter Your Mobile Number" name="phone" ng-minlength="10" ng-maxlength="10" required="required"/>
				    <p class="red" ng-show="checkoutForm.phone.$error.minlength || checkoutForm.phone.$error.pattern || checkoutForm.phone.$error.maxlength" class="help-block">Please enter a valid 10 digit number.</p>
				</div>		
				    	
			    <label for="cod"><input type="radio" checked="checked" name="cod" style="margin-bottom:15px"> Cash On Delivery</label>
				(Card Payment is currently not available)			    		    
			    <p>By placing your order you agree to our <a href="#">Terms & Privacy</a>.</p>
			
			    <div class="clearfix">
			      <a href="emart"><button type="button" class="cancelbtn">Cancel</button></a>
			      <button ng-disabled="checkoutForm.$invalid" class="signupbtn" onclick="orderPlaced()">Place Order</button>
			    </div>
		    </form>
	  	</div>
	  	<div class="col-lg-3 py-1">
	  	
	  	</div>
  	</div>
  </div>
  <script>
  function orderPlaced(){
		alert("Your Order has been Placed.\nContinue Shopping.");
	}
  var validationApp = angular.module('checkoutApp', []);
	
	//create angular controller
	validationApp.controller('checkoutController', function($scope) {
		          
	 $scope.submitForm = function(isValid) {
	
	   // check to make sure the form is completely valid
	   if (isValid) {
	     /*alert('You are now Registered.\nSign in to Continue.');*/
	   }
	
	 };
	
	});

  </script>
</body>
</html>