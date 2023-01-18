({
	callingapplicationevent : function(component, event, helper) {
        var appevent=$A.get("e.c:eventfirst");
        appEvent.setParams({   
        
            "anyvalue" : "This is a text from attribute value from event"
        
        });
        appEvent.fire();
		
	}
})