/*
Name: 			Tables / Advanced - Examples
Written by: 	Okler Themes - (http://www.okler.net)
Theme Version: 	3.1.0
*/

(function($) {

	'use strict';

	var datatableInit = function() {

		$('#datatable-default').dataTable({
			dom: '<"row"<"col-lg-6"l><"col-lg-6"f>><"table-responsive"t>p',
       //      "language": {
			    // lengthMenu: "Show _MENU_ Vehicles"
       //      }
		});

	};

	$(function() {
		datatableInit();
	});

}).apply(this, [jQuery]);