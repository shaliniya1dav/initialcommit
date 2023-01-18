trigger cogtrigger on Account (before update) {

    
    for(Account a:trigger.new){
        if(  trigger.oldMap.get(a.id).NumberOfEmployees==101)  
        {
            a.NumberOfEmployees=100;
        }
           /* else
            {
              a.addError('You cannot update this field');              
            }   */         
            //acc.add(a);
        }     
        
        
  
        
        
    }