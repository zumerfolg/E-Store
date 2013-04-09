/*
 * Ecommerce Project Javascript: 
 * Handles the canvas on the each page.
 *
 * Script: script.js
 * Author: Daniel Choi
 * Version: 1.0
 *
 */




function drawImage(canvas, context) { 
	// Add an image to the canvas
	// Declare an image object
	var logo = new Image();
	logo.src = "/assets/logo.png";
	logo.onload = function() {
    	context.drawImage(logo, 15, -20, 150, 150);
    }	
}



function onload(){

	//	Get the canvas from the DOM, and assign
	//	it a 2d context, which can be used to draw
	//	on the canvas
	var canvas = document.getElementById("logo");
	var context = canvas.getContext("2d");	
    //draw logo image on the canvas	
	drawImage(canvas, context);
	
	
}


document.addEventListener("DOMContentLoaded", onload, false);