/*
 * Rails Project Javascript: 
 * Handles the validation of form elements on the contact page.
 *
 * Script: validate.js
 * Author: Daniel Choi
 * Version: 1.0
 *
 */

/*
 * Removes white space from a string value.
 *
 * return  A string with leading and trailing white-space removed.
 */
function trim(str) 
{
	// Uses a regex to remove spaces from a string.
	return str.replace(/^\s+|\s+$/g,"");
}


/*
 * Resets (hides) all of the error messages on the page.
 */
function hideAllErrors(){
	var errorFields = document.getElementsByClassName("error");
	for (var i=0; i < errorFields.length; i++) {
	       errorFields[i].style.display = "none";
	};
}


/*
 * Handles the reset event for the form.
 *
 * param e A reference to the reset event
 * return  True allows the reset to happen; False prevents
 *         the browser from resetting the form.
 */
function resetForm(e){
	//Confirm that the user want to reset the form
	if(confirm("Do you want to clear the data?")){
		hideAllErrors();
		
		//Set focus to the first text field on the page
		document.getElementById("name").focus();
		return true;
	}
	
	//Prevent the form resseting
	e.preventDefault();
	return false;
}

/*
 * Determines if a text field element has input
 *
 * param   fieldElement A text field input element object
 * return  True if the field contains input; False if nothing entered
 */

function formFieldHasInput(fieldElement){
	//Check if the text field has a value
	if(fieldElement.value == null || trim(fieldElement.value)== ""){
		//Invalid entry'
		return false;
	}
	return true;
}


/*
 * Does all the error checking for the form.
 *
 * return   True if an error was found; False if no errors were found
 */
function formHasErrors(){
	// Assume the form has no errors
	var errorFlag = false;
	
	//An array of text field ids to check if the user enter a value
	var requiredTextFields = ["name", "phone", "email"];
	
	// loop through text fields
	for (var i=0; i < requiredTextFields.length; i++) {
	     var textField = document.getElementById(requiredTextFields[i]);
	     
	     //Determine if the text field has input
	     if(!formFieldHasInput(textField)){
	     	 document.getElementById(requiredTextFields[i]+"_error").style.display = "block";
	     	 
	     	 //Determine if this is the first error
	     	 if(!errorFlag){
	     	 	//set focus to the text field has cuase the error
	     	 	textField.focus();
	     	 	textField.select();
	     	 }
	     	 
	     	 errorFlag = true;
	     }
	};
	
	if(!errorFlag){
		// Create a regular expression for a ten digit string
		var regex = new RegExp(/^\d{10}$/);
		
		//A valid phone number is a number not greater than eleven digits
		//Get the value of the studnet number field
		var phoneNumber = document.getElementById("phone");
		
		//Determine if the value is not a number or the length is more than 10 characters
		if(!regex.test(phoneNumber.value)){
			document.getElementById("phone_format_error").style.display = "block";
			
			//Determine if this is the first error
			if(!errorFlag){
				phoneNumber.focus();
				phoneNumber.select();
			}
			
			errorFlag = true;
		}
		
		//Check the valid email address
		var emailReg = new RegExp(/^\s*[\w\-\+_]+(\.[\w\-\+_]+)*\@[\w\-\+_]+\.[\w\-\+_]+(\.[\w\-\+_]+)*\s*$/);
		var email = document.getElementById("email");	
		
		if(!emailReg.test(email.value)){
			document.getElementById("email_format_error").style.display = "block";
			
		    //Determine if this is the first error
			if(!errorFlag){
				email.focus();
				email.select();
			}
			
			errorFlag = true;
		}		
	}

	
	return errorFlag;
}


/*
 * Handles the submit event of the contact form
 *
 * param e  A reference to the submit event
 * return   True if no validation errors; False if the form has
 *          validation errors
 */
function validate(e){
	//Hide all error elements on the page
	hideAllErrors();
	
	//Determine if the form has errors
	if(formHasErrors()){
		//prevent the form from submitting
		e.preventDefault();
		return false;
	}
	
	return true;
	
}

/*
 * Handles the load event of the document.
 */
function onload(){
     
     hideAllErrors();

     // Add event listener for the form submit
     document.getElementById("contact").addEventListener("submit", validate, false);
     
     //Reset the form using the default browser reset
     //This is done to ensure the radio buttons are unchecked when the page is refreshed
     //This line of code must be done before attaching the event listener for the customer reset
     document.getElementById("contact").reset();
     
     //Add event listener for reset function
     document.getElementById("contact").addEventListener("reset", resetForm, false);
	
}


document.addEventListener("DOMContentLoaded", onload, false);
