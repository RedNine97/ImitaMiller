/*!
* Start Bootstrap - New Age v6.0.7 (https://startbootstrap.com/theme/new-age)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-new-age/blob/master/LICENSE)
*/
//
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
            offset: 74,
        });
    };

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
        document.querySelectorAll('#navbarResponsive .nav-link')
    );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
            }
        });
    });

});


/**
 *  상품 필터 검색
 */

var filter1=[];
var filter2="";
var filter3="";
var filter4="";
var sort="";
/*
	조건별 정렬
*/
function sortChange(){
    
    if($('#SortBy option:selected').val()=="PID DESC"){
		sort="PID DESC";
	} else if($('#SortBy option:selected').val()=="pprice DESC"){
		sort="pprice DESC";
	} else if($('#SortBy option:selected').val()=="pprice ASC"){
		sort="pprice ASC";
	}
    
    console.log(sort);
    $('#divReloadLayer').load(location.href + ' #divReloadLayer', "pcategory=" + filter1 + "&ptype=" + filter2 + "&pprice=" + filter3 + "&count=" + filter4 + "&sort=" + sort);
}



