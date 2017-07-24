var eventUtils = (function() {
    try {
        return {

            /*
            EventUtil.addHandler(window, "load", function(event){
            	document.forms[0].elements[0].focus();
            }); 
            */
            addHandler: function(element, type, handler) {
                if (element.addEventListener) {
                    element.addEventListener(type, handler, false);
                } else if (element.attachEvent) {
                    element.attachEvent("on" + type, handler);
                } else {
                    element["on" + type] = handler;
                }
            },

            /*
			
            */
            getButton: function(event) {
                if (document.implementation.hasFeature("MouseEvents", "2.0")) {
                    return event.button;
                } else {
                    switch (event.button) {
                        case 0:
                        case 1:
                        case 3:
                        case 5:
                        case 7:
                            return 0;
                        case 2:
                        case 6:
                            return 2;
                        case 4:
                            return 1;
                    }
                }
            },

            /*
             
            */
            getCharCode: function(event) {
                if (typeof event.charCode == "number") {
                    return event.charCode;
                } else {
                    return event.keyCode;
                }
            },

            /*
			EventUtil.addHandler(textbox, "paste", function(event){
                event = EventUtil.getEvent(event);
                var text = EventUtil.getClipboardText(event);
            });
			*/
            getClipboardText: function(event) {
                var clipboardData = (event.clipboardData || window.clipboardData);
                return clipboardData.getData("text");
            },

            /*
            var event = EventUtil.getEvent(event);
            */
            getEvent: function(event) {
                return event ? event : window.event;
            },

            /*
             
            */
            getRelatedTarget: function(event) {
                if (event.relatedTarget) {
                    return event.relatedTarget;
                } else if (event.toElement) {
                    return event.toElement;
                } else if (event.fromElement) {
                    return event.fromElement;
                } else {
                    return null;
                }

            },

            /*
            var target = EventUtil.getTarget(event); 
            */
            getTarget: function(event) {
                if (event.target) {
                    return event.target;
                } else {
                    return event.srcElement;
                }
            },

            /*
             
            */
            getWheelDelta: function(event) {
                if (event.wheelDelta) {
                    return (client.opera && client.opera < 9.5 ? -event.wheelDelta : event.wheelDelta);
                } else {
                    return -event.detail * 40;
                }
            },

            /*
             EventUtil.preventDefault(event); 
            */
            preventDefault: function(event) {
                if (event.preventDefault) {
                    event.preventDefault();
                } else {
                    event.returnValue = false;
                }
            },

            /*
            EventUtil.removeHandler(form, "reset", callback());
            */
            removeHandler: function(element, type, handler) {
                if (element.removeEventListener) {
                    element.removeEventListener(type, handler, false);
                } else if (element.detachEvent) {
                    element.detachEvent("on" + type, handler);
                } else {
                    element["on" + type] = null;
                }
            },

            /*
			EventUtil.addHandler(textbox, "copy", function(event){
                event = EventUtil.getEvent(event);
                EventUtil.preventDefault(event);
                EventUtil.setClipboardText(event, "Hello world!");                 
            });
			*/
            setClipboardText: function(event, value) {
                if (event.clipboardData) {
                    event.clipboardData.setData("text/plain", value);
                } else if (window.clipboardData) {
                    window.clipboardData.setData("text", value);
                }
            },

            /*
			
            */
            stopPropagation: function(event) {
                if (event.stopPropagation) {
                    event.stopPropagation();
                } else {
                    event.cancelBubble = true;
                }
            }

        }

    } catch (err) {
        console.error("Error: ", err.message);
    }

}());
