var utils = (function() {
    try {
        return {


            //Returns true if it is a DOM node
            isNode: function isNode(o) {
                return (
                    typeof Node === "object" ? o instanceof Node :
                    o && typeof o === "object" && typeof o.nodeType === "number" && typeof o.nodeName === "string"
                );
            },


            //Returns true if it is a DOM element
            isElement: function isElement(o) {
                return (
                    typeof HTMLElement === "object" ? o instanceof HTMLElement : //DOM2
                    o && typeof o === "object" && o !== null && o.nodeType === 1 && typeof o.nodeName === "string"
                );
            },


            //Client detection
            /*client().engine.ie
            client().engine.webkit
            client().engine.gecko
            client().engine.khtml
            client().engine.opera
            client().engine.ver
            client().browser.ie
            client().browser.safari
            client().browser.firefox
            client().browser.konq
            client().browser.opera
            client().browser.chrome
            client().browser.ver
            client().system.win
            client().system.mac
            client().system.x11
            client().system.iphone
            client().system.ipod
            client().system.macMobile
            client().system.nokiaN
            client().system.winMobile
            client().system.wii
            client().system.ps*/
            client: function client() {

                //rendering engines
                var engine = {
                    ie: 0,
                    gecko: 0,
                    webkit: 0,
                    khtml: 0,
                    opera: 0,

                    //complete version
                    ver: null
                };

                //browsers
                var browser = {

                    //browsers
                    ie: 0,
                    firefox: 0,
                    safari: 0,
                    konq: 0,
                    opera: 0,
                    chrome: 0,
                    safari: 0,

                    //specific version
                    ver: null
                };


                //platform/device/OS
                var system = {
                    win: false,
                    mac: false,
                    x11: false,

                    //mobile devices
                    iphone: false,
                    ipod: false,
                    nokiaN: false,
                    winMobile: false,
                    macMobile: false,

                    //game systems
                    wii: false,
                    ps: false
                };

                //detect rendering engines/browsers
                var ua = navigator.userAgent;
                if (window.opera) {
                    engine.ver = browser.ver = window.opera.version();
                    engine.opera = browser.opera = parseFloat(engine.ver);
                } else if (/AppleWebKit\/(\S+)/.test(ua)) {
                    engine.ver = RegExp["$1"];
                    engine.webkit = parseFloat(engine.ver);

                    //figure out if it's Chrome or Safari
                    if (/Chrome\/(\S+)/.test(ua)) {
                        browser.ver = RegExp["$1"];
                        browser.chrome = parseFloat(browser.ver);
                    } else if (/Version\/(\S+)/.test(ua)) {
                        browser.ver = RegExp["$1"];
                        browser.safari = parseFloat(browser.ver);
                    } else {
                        //approximate version
                        var safariVersion = 1;
                        if (engine.webkit < 100) {
                            safariVersion = 1;
                        } else if (engine.webkit < 312) {
                            safariVersion = 1.2;
                        } else if (engine.webkit < 412) {
                            safariVersion = 1.3;
                        } else {
                            safariVersion = 2;
                        }

                        browser.safari = browser.ver = safariVersion;
                    }
                } else if (/KHTML\/(\S+)/.test(ua) || /Konqueror\/([^;]+)/.test(ua)) {
                    engine.ver = browser.ver = RegExp["$1"];
                    engine.khtml = browser.konq = parseFloat(engine.ver);
                } else if (/rv:([^\)]+)\) Gecko\/\d{8}/.test(ua)) {
                    engine.ver = RegExp["$1"];
                    engine.gecko = parseFloat(engine.ver);

                    //determine if it's Firefox
                    if (/Firefox\/(\S+)/.test(ua)) {
                        browser.ver = RegExp["$1"];
                        browser.firefox = parseFloat(browser.ver);
                    }
                } else if (/MSIE ([^;]+)/.test(ua)) {
                    engine.ver = browser.ver = RegExp["$1"];
                    engine.ie = browser.ie = parseFloat(engine.ver);
                }

                //detect browsers
                browser.ie = engine.ie;
                browser.opera = engine.opera;


                //detect platform
                var p = navigator.platform;
                system.win = p.indexOf("Win") == 0;
                system.mac = p.indexOf("Mac") == 0;
                system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);

                //detect windows operating systems
                if (system.win) {
                    if (/Win(?:dows )?([^do]{2})\s?(\d+\.\d+)?/.test(ua)) {
                        if (RegExp["$1"] == "NT") {
                            switch (RegExp["$2"]) {
                                case "5.0":
                                    system.win = "2000";
                                    break;
                                case "5.1":
                                    system.win = "XP";
                                    break;
                                case "6.0":
                                    system.win = "Vista";
                                    break;
                                default:
                                    system.win = "NT";
                                    break;
                            }
                        } else if (RegExp["$1"] == "9x") {
                            system.win = "ME";
                        } else {
                            system.win = RegExp["$1"];
                        }
                    }
                }

                //mobile devices
                system.iphone = ua.indexOf("iPhone") > -1;
                system.ipod = ua.indexOf("iPod") > -1;
                system.nokiaN = ua.indexOf("NokiaN") > -1;
                system.winMobile = (system.win == "CE");
                system.macMobile = (system.iphone || system.ipod);

                //gaming systems
                system.wii = ua.indexOf("Wii") > -1;
                system.ps = /playstation/i.test(ua);

                //return it
                return {
                    engine: engine,
                    browser: browser,
                    system: system
                };

            },


            //Assign attribute to html element
            assignAttribute: function assignAttribute(HTMLElement, attrName, attrValue) {
                if (this.isElement(HTMLElement) && typeof(attrName) === 'string' && typeof(attrValue) === 'string') {
                    var attr = document.createAttribute(attrName);
                    attr.value = attrValue;
                    HTMLElement.setAttributeNode(attr);
                } else {
                    throw new Error("Called function: " + arguments.callee.name);
                }

            },


            //Check if an element is under another element
            contains: function contains(refNode, otherNode) {
                if (typeof refNode.contains == "function" && (!this.client().engine.webkit || this.client().engine.webkit >= 522)) {
                    return refNode.contains(otherNode);
                } else if (typeof refNode.compareDocumentPosition == "function") {
                    return !!(refNode.compareDocumentPosition(otherNode) & 16);
                } else {
                    var node = otherNode.parentNode;
                    do {
                        if (node === refNode) {
                            return true;
                        } else {
                            node = node.parentNode;
                        }
                    } while (node !== null);
                    return false;
                }
            },



            //Output element attributes
            outputAttributes: function outputAttributes(element) {
                var pairs = new Array();
                for (var i = 0, len = element.attributes.length; i < len; i++) {
                    var attrName = element.attributes[i].nodeName;
                    var attrValue = element.attributes[i].nodeValue;
                    pairs.push(attrName + "=\"" + attrValue + "\"");
                }
                return pairs.join(" ");
            },



            //Count element's children
            countChildren: function countChildren(HTMLElement) {
                if (this.isElement(HTMLElement)) {
                    return HTMLElement.childNodes.length
                } else {
                    throw new Error("Called function: " + arguments.callee.name);
                }

            },


            //Get element text
            getInnerText: function getInnerText(HTMLElement) {
                if (this.isElement(HTMLElement)) {
                    return (typeof element.textContent == "string") ? element.textContent : element.innerText;
                } else {
                    throw new Error("Called function: " + arguments.callee.name);
                }
            },


            //Set element text
            setInnerText: function setInnerText(HTMLElement, text) {
                if (this.isElement(HTMLElement) && typeof(text) === 'string') {
                    if (typeof element.textContent == "string") {
                        element.textContent = text;
                    } else {
                        element.innerText = text;
                    }
                } else {
                    throw new Error("Called function: " + arguments.callee.name);
                }
            },



            //Get element position from left
            getElementLeft: function getElementLeft(HTMLElement) {
                if (this.isElement(HTMLElement)) {
                    var actualLeft = HTMLElement.offsetLeft;
                    var current = HTMLElement.offsetParent;

                    while (current !== null) {
                        actualLeft += current.offsetLeft;
                        current = current.offsetParent;
                    }

                    return actualLeft;
                } else {
                    throw new Error("Called function: " + arguments.callee.name);
                }
            },



            //Get element position from top
            getElementTop: function getElementTop(HTMLElement) {
                if (this.isElement(HTMLElement)) {
                    var actualTop = HTMLElement.offsetTop;
                    var current = HTMLElement.offsetParent;

                    while (current !== null) {
                        actualTop += current.offsetTop;
                        current = current.offsetParent;
                    }

                    return actualTop;
                } else {
                    throw new Error("Called function: " + arguments.callee.name);
                }
            },


            //Get element dimension
            getBoundingClientRect: function getBoundingClientRect(HTMLElement) {
                if (this.isElement(HTMLElement)) {
                    var scrollTop = document.documentElement.scrollTop;
                    var scrollLeft = document.documentElement.scrollLeft;

                    if (HTMLElement.getBoundingClientRect) {
                        if (typeof arguments.callee.offset != "number") {
                            var temp = document.createElement("div");
                            temp.style.cssText = "position:absolute;left:0;top:0;";
                            document.body.appendChild(temp);
                            arguments.callee.offset = -temp.getBoundingClientRect().top - scrollTop;
                            document.body.removeChild(temp);
                            temp = null;
                        }

                        var rect = HTMLElement.getBoundingClientRect();
                        var offset = arguments.callee.offset;

                        return {
                            left: rect.left + offset,
                            right: rect.right + offset,
                            top: rect.top + offset,
                            bottom: rect.bottom + offset

                        };
                    } else {

                        var actualLeft = this.getElementLeft(element);
                        var actualTop = this.getElementTop(element);

                        return {
                            left: actualLeft - scrollLeft,
                            right: actualLeft + element.offsetWidth - scrollLeft,
                            top: actualTop - scrollTop,
                            bottom: actualTop + element.offsetHeight - scrollTop
                        }
                    }

                } else {
                    throw new Error("Called function: " + arguments.callee.name);
                }
            },


            //Form serialization
            serialize: function serialize(form) {
                if (this.isElement(form)) {
                    var parts = new Array();
                    var field = null;

                    for (var i = 0, len = form.elements.length; i < len; i++) {
                        field = form.elements[i];

                        switch (field.type) {
                            case "select-one":
                            case "select-multiple":
                                for (var j = 0, optLen = field.options.length; j < optLen; j++) {
                                    var option = field.options[j];
                                    if (option.selected) {
                                        var optValue = "";
                                        if (option.hasAttribute) {
                                            optValue = (option.hasAttribute("value") ? option.value : option.text);
                                        } else {
                                            optValue = (option.attributes["value"].specified ? option.value : option.text);
                                        }
                                        parts.push(encodeURIComponent(field.name) + "=" + encodeURIComponent(optValue));
                                    }
                                }
                                break;

                            case undefined: //fieldset
                            case "file": //file input
                            case "submit": //submit button
                            case "reset": //reset button
                            case "button": //custom button
                                break;

                            case "radio": //radio button
                            case "checkbox": //checkbox
                                if (!field.checked) {
                                    break;
                                }
                                /* falls through */

                            default:
                                parts.push(encodeURIComponent(field.name) + "=" + encodeURIComponent(field.value));
                        }
                    }
                    return parts.join("&");

                } else {
                    throw new Error("Called function: " + arguments.callee.name);
                }

            },



            //Get selected text
            getSelectedText: function getSelectedText(textbox) {
                if (this.isElement(textbox)) {

                    var getSelectedText = function(textbox) {
                        if (document.selection) {
                            return document.selection.createRange().text;
                        } else {
                            return textbox.value.substring(textbox.selectionStart, textbox.selectionEnd);
                        }
                    }

                    _mpEventUtil.addHandler(window, "load", function(event) {

                        _mpEventUtil.addHandler(textbox, "select", function(event) {
                            alert(getSelectedText(textbox));
                        });

                        textbox.focus();
                    });


                } else {
                    throw new Error("Called function: " + arguments.callee.name);
                }
            },


            //Add query string
            addQueryStringArg: function addQueryStringArg(url, name, value) {
                if (url.indexOf("?") == -1) {
                    url += "?";
                } else {
                    url += "&";
                }

                url += encodeURIComponent(name) + "=" + encodeURIComponent(value);

                window.location.href = url;
            },


            testWindowPosition: function(edge, stops) {

                if (edge === undefined || (stops === undefined && stops.length > 0)) {
                    return;
                }
                var currentPosition;

                var checkNewPosition = myApp.debounce(function() {
                    for (var i = 0; i <= stops.length; i++) {
                        if (currentPosition !== i && window.pageYOffset >= stops[i] && window.pageYOffset < stops[i + 1]) {
                            currentPosition = i;
                        }
                    }
                }, 50);

                $(window).scroll(function() {
                    checkNewPosition();
                });

            },

            getAbsoluteUrl: function(url) {
                var a;
                a = document.createElement('a');
                a.href = url;
                return a.href;
            },

            moveElement: function($from, $to) {
                if (typeof $from !== 'object' && typeof $to !== 'object') {
                    return;
                }
                var $clone = $from.clone();
                $from.remove();
                $to.append($clone);
            },

            // Returns a function, that, as long as it continues to be invoked, will not
            // be triggered. The function will be called after it stops being called for
            // N milliseconds. If `immediate` is passed, trigger the function on the
            // leading edge, instead of the trailing.
            debounce: function(func, wait, immediate) {
                var timeout;
                return function() {
                    var context = this,
                        args = arguments;
                    var later = function() {
                        timeout = null;
                        if (!immediate) func.apply(context, args);
                    };
                    var callNow = immediate && !timeout;
                    clearTimeout(timeout);
                    timeout = setTimeout(later, wait);
                    if (callNow) func.apply(context, args);
                };
            },

            getCurrentUrl: function() {
                return window.location.origin + window.location.pathname;
            },

            getParameterByName: function(name) {
                if (name !== undefined) {
                    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
                    var regexS = "[\\?&]" + name + "=([^&#]*)";
                    var regex = new RegExp(regexS);
                    var results = regex.exec(window.location.href);
                    if (results === null) {
                        return null;
                    } else {
                        return decodeURIComponent(results[1].replace(/\+/g, " "));
                    }
                } else {
                    return null;
                }
            },

            addElementLoadListener: function($elem, func) { //doesnt works on ios
                if ($elem && utils.isElement($elem[0]) && $.isFunction(func)) {
                    $($elem).load(function() {
                        func($elem);
                    });
                }
            },

            addImageFileLoadListener: function(absUrl, func) {
                if (absUrl && typeof absUrl === 'string' && $.isFunction(func)) {
                    $('<img/>').attr('src', absUrl).load(function() {
                        func();
                        $(this).remove(); // prevent memory leaks												
                    });
                }
            }



        };
    } catch (err) {
        console.error("Error: ", err.message);
    }

}());
