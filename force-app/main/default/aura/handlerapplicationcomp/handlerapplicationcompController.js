({
	handleApplicationEvent : function(component, event, helper) {
        var msg=event.getParam("anyvalue");
        cmp.set("v.messageFromEvent",msg);
		
	}
})