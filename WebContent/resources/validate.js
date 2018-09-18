
		var validationApp = angular.module('validationApp', []);
		
		//create angular controller
		validationApp.controller('mainController', function($scope) {
			$('#errormsg').hide();
		  	var myInput = document.getElementById("password");
		  	myInput.onkeyup = function check() {
		  		if(myInput.value.length < 6 || myInput.value.length > 10 ) {
		  			$('#errormsg').show();
		  			$("input[type=submit]").attr("disabled", "disabled");
		  			return false;
		  		}
		  		else{
		  			$('#errormsg').hide();
		  			return false;
		  		}
		  	}
		 // function to submit the form after all validation has occurred            
		 $scope.submitForm = function(isValid) {
		
		   // check to make sure the form is completely valid
		   if (isValid) {
		     /*alert('You are now Registered.\nSign in to Continue.');*/
		   }
		
		 };
		
		});
