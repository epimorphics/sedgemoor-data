// If the document isn't at a location matching urlPattern then rewrite all a href links 
// which do match urlPattern to point to the same server as this document
// Assumes jQuery
$(function() {
    var hostPattern = /^https?:\/\/([^\/]*)/;
    var pathPattern = /^https?:\/\/[^\/]*(.*)/;
    var schemePattern = /(^https?:\/\/).*/;
//    var contextPath	  = "/landregistry" ;
    var contextPath	  = "" ;
    
    var url = document.URL;
    var requestHost = url.match(hostPattern)[1];
    var requestScheme = url.match(schemePattern)[1];
    
    $("a[href]").each ( function (a) {
         var targetHost = this.href.match(hostPattern)[1];
         var targetPath = this.href.match(pathPattern)[1];
         
         if(targetHost == "data.sedgemoor.gov.uk") {
             this.href = this.href.replace(this.href,requestScheme+requestHost+contextPath+targetPath) ;
         };   
    });
});
