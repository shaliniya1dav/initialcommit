({
	doClick : function(component,event,helper) {
	
        alert(component.isValid());
        alert(component.getName());
        alert(component.get('v.whom'));
         alert(component.set('v.whom','testwame'));
        var getcomp= component.find('testclass');
        alert(getcomp.get('v.value'));
        getcomp.set('v.value',67);                          
	}
})