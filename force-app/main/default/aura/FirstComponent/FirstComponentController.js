({
	doclick : function(component, event, helper) {
        
        alert(component.isValid());
        alert(component.getName());
        alert(component.get('v.Intro'));
        component.set('v.Intro',"Test Value");
        var auraid= component.find('TestInput');
         alert(auraid.get('v.Value'));
         auraid.set('v.Value',67);
        
        
              
        
		
	}
})