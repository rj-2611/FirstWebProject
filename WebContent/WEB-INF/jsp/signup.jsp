<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="com.myProject.Signup" %>
<%@ page import="com.myProject.Dao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Yourself</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<!-- <script src="http://code.angularjs.org/1.2.6/angular.js"></script> -->
<spring:url value="/resources/signup.css" var="signupCSS" />
<link href="${signupCSS}" rel="stylesheet" />
<spring:url value="/resources/validate.js" var="validateJS" />
<script src="${validateJS}"></script>
</head>
<body ng-app="validationApp" ng-controller="mainController">

  <div class="container">
  	<div class="row">
	  	<div class="col-lg-3 py-1">
	  		<h3><a href="emart"><b>e-<em>MART</em></b></a></h3>
	  	</div>
	  	<div class="col-lg-6 py-1">
	  		<table align="center">
                <tr>
                    <td style="font-style: italic; color: red;"><h3> ${userexists}</h3></td>
                </tr>
            </table>
	  		<h3><span class="glyphicon glyphicon-lock"></span>  Sign Up</h3>
	  		<p>Please fill in this form to create an account.</p>
	  		<form name="userForm" action="save" ng-submit="submitForm(userForm.$valid)" method="post" class="padded">				    
			    <div class="form-group">			
				    <label for="name"><b><span class="glyphicon glyphicon-edit"></span> Name</b></label>
				    <input path="name" ng-model="formData.name" type="text" placeholder="Enter Your Name" name="name" required="required"/>
				    <p class="red" ng-show="userForm.name.$invalid && !userForm.name.$pristine" class="help-block red">You name is required.</p>
				</div>
				<div class="form-group">
					<label for="phone"><b><span class="glyphicon glyphicon-user"></span> Mobile Number(This will be your Username)</b></label>
				    <input path="phone" ng-model="formData.phone" ng-pattern="/^[0-9]*$/" type="text" placeholder="Enter Your Mobile Number" name="phone" ng-minlength="10" ng-maxlength="10" required="required"/>
				    <p class="red" ng-show="userForm.phone.$error.minlength || userForm.phone.$error.pattern || userForm.phone.$error.maxlength" class="help-block">Please enter a valid 10 digit number.</p>
				</div>
				<div class="form-group">
				    <label for="password"><b><span class="glyphicon glyphicon-eye-open"></span> Password</b></label>
				    <input path="pwd" id="password" type="password" placeholder="Enter Password" ng-model="formData.password" ng-minlength="6" ng-maxlength="10" name="password" required="required"/>
				    <p id="errormsg" class="red">Password must contain 6 to 10 characters</p>
			    </div>
			    <label>
			      <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
			    </label>
			    
			    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
			
			    <div class="clearfix">
			      <a href="emart"><button type="button" class="cancelbtn">Cancel</button></a>
			      <button ng-disabled="userForm.$invalid" class="signupbtn">Sign Up</button>
			    </div>
		    </form>
	  	</div>
	  	<div class="col-lg-3 py-1">
	  	
	  	</div>
  	</div>
  </div>
  <!-- <div id="account-created" title="Account Created">
  		<p>
   		 <span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
    		Your account is created successfully.
 		</p>
	    <p>
	        <b>Sign In To Enjoy Shopping.</b>
	    </p>
	</div> -->
  <script type="text/javascript">
  	
  	function accCreated() {
  		alert("You are now registered.\nSign In to continue shopping.");
  	}
  
  	/* $( function accCreated() {
	    $( "#account-created" ).dialog({
	      modal: true,
	      buttons: {
	        Ok: function() {
	          $( this ).dialog( "close" );
	        }
	      }
	    });
	  } ); */
  </script>

</body>
</html>