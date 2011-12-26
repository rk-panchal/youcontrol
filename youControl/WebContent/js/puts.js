/*
* Puts JavaScript Input Hint
*
* Author: Caires Vinicius
* License to MIT
*
* Date: 2009-11-27 (Fri,27 Nov 2009)
*/
jQuery.fn.puts = function(defaultMessage){
	this.val(defaultMessage);
	this.css("color","#708090");
	this.focus(function(){
		if(jQuery(this).val() == defaultMessage){
			jQuery(this).val('');
			jQuery(this).css("color","#000");
		}
	});
	this.blur(function(){
		if(jQuery(this).val() == ''){
			jQuery(this).val(defaultMessage);
			jQuery(this).css("color","#708090");
		}
	});
}