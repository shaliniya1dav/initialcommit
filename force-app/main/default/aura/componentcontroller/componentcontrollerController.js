({
	doInit : function(component, event, helper) {
        var action=component.get('c.listmn');
        action.setParams({
            
        });
        action.setCallback(this,function(response){
            var responsevalue=response.getReturnValue();
            console.log('responseValue','responseValue');
            component.set('v.listm',responseValue)
        },'SUCCESS');
        $A.enqueueAction(action,false);
		
	}
})