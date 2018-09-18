<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign In</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<spring:url value="/resources/signup.css" var="signupCSS" />
<link href="${signupCSS}" rel="stylesheet" />
</head>
<body>
  <div class="container">
  	<div class="row">
	  	<div class="col-lg-3 py-1">
	  		<h3><a href="emart"><b>e-<em>MART</em></b></a></h3>
	  	</div>
	  	
	  	<div class="col-lg-6 py-1">
	  		<table align="center">
                <tr>
                    <td style="font-style: italic; color: red;"><h3>${message}</h3></td>
                    <td style="font-style: italic; color: white;"><h3>${registered}</h3></td>
                </tr>
            </table>
	  		<h3><span class="glyphicon glyphicon-lock"></span> Log In to e-MART</h3>
	  		<p>Please enter your credentials to sign in</p>
	  		<form id="loginForm" modelAttribute="login" action="loginProcess" method="post" class="padded">		  				    		    
				<label for="phone"><b><span class="glyphicon glyphicon-user"></span> Username(Your Mobile Number)</b></label>
			    <input path="phone" type="text" placeholder="Enter Your Mobile Number" name="phone" required="required"/>
			
			    <label for="password"><b><span class="glyphicon glyphicon-eye-open"></span> Password</b></label>
			    <input path="pwd" type="password" placeholder="Enter Password" name="password" required="required"/>				    
			   
			    <label>
			      <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
			    </label>
			    
			    <p>Not a member yet?? <a href="signup"><b>Sign Up</b></a> </p>
			
			    <div class="clearfix">
			      <a href="emart"><button type="button" class="cancelbtn">Cancel</button></a>
			      <button id="login" name="login" class="signinbtn">Log In</button>
			    </div>
		    </form>
		    
	  	</div>
	  	<div class="col-lg-3 py-1">
	  	
	  	</div>
  	</div>
  </div>
</body>
</html>