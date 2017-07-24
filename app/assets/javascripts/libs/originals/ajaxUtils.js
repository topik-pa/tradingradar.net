var ajaxUtils = (function() {
    try {
        return {

            /* Ajax js con lazy loading */
            /*
             * 
               var xhr = createXHR();        
            	xhr.onreadystatechange = function(event){
            		if (xhr.readyState == 4){
            			if ((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304){
            				alert(xhr.responseText);
            			} else {
            				alert("Request was unsuccessful: " + xhr.status);
            			}
            		}
            	};
            	
            	//GET
            	xhr.open("get", "example.txt", true);
            	//POST
            	xhr.open("post", "postexample.php", true);
            	
            	xhr.setRequestHeader("MyHeader", "MyValue");
            	xhr.timeout = 1000;
            	xhr.ontimeout = function(){
            		alert("Request did not return in a second.");
            	}; 
            	xhr.onload = function(event){
            		if ((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304){
            			alert(xhr.responseText);
            			alert(xhr.getAllResponseHeaders());
            		} else {
            			alert("Request was unsuccessful: " + xhr.status);
            		}
            	};
            	xhr.onerror = function(event){
            		alert("Error!");
            	};
            	xhr.onprogress = function(event){
            		var divStatus = document.getElementById("status");
            		divStatus.innerHTML = "Received " + event.position + " of " + event.totalSize + " bytes";
            	};


            	//GET
            	xhr.send(null);
            	//POST
            	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            	var form = document.forms[0]; 
            	xhr.send(_mpjs.serialize(form));

             *
             * 
             * */
            createXHR: function(event) {
                if (typeof XMLHttpRequest != "undefined") {
                    createXHR = function() {
                        return new XMLHttpRequest();
                    };
                } else if (typeof ActiveXObject != "undefined") {
                    createXHR = function() {
                        if (typeof arguments.callee.activeXString != "string") {
                            var versions = ["MSXML2.XMLHttp.6.0", "MSXML2.XMLHttp.3.0",
                                "MSXML2.XMLHttp"
                            ];

                            for (var i = 0, len = versions.length; i < len; i++) {
                                try {
                                    var xhr = new ActiveXObject(versions[i]);
                                    arguments.callee.activeXString = versions[i];
                                    return xhr;
                                } catch (ex) {
                                    //skip
                                }
                            }
                        }
                    }

                    return new ActiveXObject(arguments.callee.activeXString);
                } else {
                    createXHR = function() {
                        throw new Error("No XHR object available.");
                    };

                }
                return createXHR();
            }
        }

    } catch (err) {
        console.error("Error: ", err.message);
    }

}());
