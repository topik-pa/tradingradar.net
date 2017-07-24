var cookieUtils = (function() {
    try {
        return {

            get: function(name) {
                var cookieName = encodeURIComponent(name) + "=",
                    cookieStart = document.cookie.indexOf(cookieName),
                    cookieValue = null;

                if (cookieStart > -1) {
                    var cookieEnd = document.cookie.indexOf(";", cookieStart)
                    if (cookieEnd == -1) {
                        cookieEnd = document.cookie.length;
                    }
                    cookieValue = decodeURIComponent(document.cookie.substring(cookieStart + cookieName.length, cookieEnd));
                }

                return cookieValue;
            },

            set: function(name, value, expires, path, domain, secure) {
                var cookieText = encodeURIComponent(name) + "=" + encodeURIComponent(value);

                if (expires instanceof Date) {
                    cookieText += "; expires=" + expires.toGMTString();
                }

                if (path) {
                    cookieText += "; path=" + path;
                }

                if (domain) {
                    cookieText += "; domain=" + domain;
                }

                if (secure) {
                    cookieText += "; secure";
                }

                document.cookie = cookieText;
            },

            unset: function(name, path, domain, secure) {
                this.set(name, "", new Date(0), path, domain, secure);
            },

            //Data storage
            /*
			 * var dataStore = getLocalStorage();
			 * dataStore.name =  "Nicholas";
			 * dataStore.removeItem("name");
			 * for (var i=0, len = dataStore.length; i < len; i++){
                    var key = dataStore.key(i);
                    var value = dataStore.getItem(key);
                    alert(key + "=" + value);
                }
			 * 
			 * */
            getLocalStorage: function() {
                if (typeof localStorage == "object") {
                    return localStorage;
                } else if (typeof globalStorage == "object") {
                    return globalStorage[location.host];
                } else {
                    throw new Error("Local storage not available.");
                }
            },

        }

    } catch (err) {
        console.error("Error: ", err.message);
    }

}());
