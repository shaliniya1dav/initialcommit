trigger trigger1 on Account (before insert,before update , before delete) {
    if(trigger.isinsert){
    for(account a: trigger.new){
        if(a.Website == null){
           a.Website = 'www.google.com' ;
        }
    }
    }
    
  if(trigger.isdelete){
      for(account a: trigger.old){
        if(a.Website == 'www.google.com'){
           a.addError ('www.yahoo.com' );
        
    }
  }
}
 if(trigger.isupdate){
    for(account a: trigger.new){
        if(a.Website == null){
           a.Website = 'www.gmail.com' ;
        }
    }
    }
}