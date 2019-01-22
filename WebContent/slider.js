/*var slideIndex = 1;

showImage(slideIndex);

function plusIndex(n){
	showImage(slideIndex += n);
}
function showImage(n){
	var slide = document.getElementByClassName("slides");
	
	if(n > slide.length){
		slideIndex = 1
	};
	
	if(n < 1){
		slideIndex = slide.length
	};
	
	for (var i = 0; i < slide.length; i++) {
		slide[i].style.display = "none";
	};
	slide[slideIndex-1].style.display = "block";
}
*/
/*$(function() {
	
	var width = 720;
	var animationSpeed = 1000;
	var pause = 1000;
	var currentSlide = 1;
	
	var $slider = $('#slider');
	var $slideContainer = $slider.find('.slides');
	var $slide = $slideContainer.find('.slide');
	
	setInterval(function() {
		$slider.animate({'margin-left': '-='+width}, animationSpeed, function() {
			currentSlide++;
			if (currentSlide === $slides.length) {
				currentSlide = 1;
				$slideContainer.css('margin-left', 0);
			}
		});
	}, pause);
	
});*/

/*require(["dojo/on", "dojo/dom", "dojo/_base/lang", "dojo/domReady!"],
    function(on, dom, lang) {

        var myScopedButton1 = dom.byId("myScopedButton1"),
           
            myObject = {
                id: "myObject",
                onClick: function(evt){
                    alert("The scope of this handler is " + this.id);
                }
            };

        // This will alert "myScopedButton1"
        on(myScopedButton1, "click", myObject.onClick);
        // This will alert "myObject" rather than "myScopedButton2"
       
});*/
