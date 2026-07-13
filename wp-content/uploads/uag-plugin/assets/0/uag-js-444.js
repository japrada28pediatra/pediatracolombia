document.addEventListener("DOMContentLoaded", function(){ window.addEventListener( 'load', function() {
	UAGBButtonChild.init( '.uagb-block-bec671ef' );
});
window.addEventListener( 'load', function() {
	UAGBButtonChild.init( '.uagb-block-42f32283' );
});
var ssLinksParent = document.querySelector( '.uagb-block-d1bf573d' );
ssLinksParent?.addEventListener( 'keyup', function ( e ) {
var link = e.target.closest( '.uagb-ss__link' );
if ( link && e.keyCode === 13 ) {
	handleSocialLinkClick( link );
}
});

ssLinksParent?.addEventListener( 'click', function ( e ) {
var link = e.target.closest( '.uagb-ss__link' );
if ( link ) {
	handleSocialLinkClick( link );
}
});

function handleSocialLinkClick( link ) {
var social_url = link.dataset.href;
var target = "";
if ( social_url == "mailto:?body=" ) {
	target = "_self";
}
var request_url = "";
if ( social_url.indexOf("/pin/create/link/?url=") !== -1 ) {
	request_url = social_url + encodeURIComponent( window.location.href ) + "&media=" + '';
} else {
	request_url = social_url + encodeURIComponent( window.location.href );
}
window.open( request_url, target );
}
window.addEventListener( 'load', function() {
	UAGBButtonChild.init( '.uagb-block-9dd44b02' );
});
window.addEventListener( 'load', function() {
	UAGBButtonChild.init( '.uagb-block-efc2bff3' );
});
window.addEventListener( 'load', function() {
	UAGBButtonChild.init( '.uagb-block-72ed11fa' );
});
window.addEventListener( 'load', function() {
	UAGBButtonChild.init( '.uagb-block-ee2596bd' );
});
 });