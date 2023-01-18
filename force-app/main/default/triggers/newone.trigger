trigger newone on Account (before insert, before update) {
    
      set <string> str = new set<string>();  
      for(Account a:trigger.new){
     str.add(a.name);
      }
      
      list<account> acc=[select id,name from account where name in:str];
      
      map<id, account> m =new map<id, Account>();
      for(account a1: acc){
      m.put(a1.id,a1);
      }
      
      
      for(account a1: trigger.new){
      if(m.get(a1.id)!=null){
              a1.addError('Duplicates found ');
      }
      }     
      
       }
      
      
      
   
    
    
    /*   
    
    //for(Account a: trigger.new ){
  //List<Account>  existingacc= [select id, name from Account where Name=:a.Name]  ;
 //integer i = [select count() from account where name =: a.name];
        if(i>0){
            
            
        a.addError('Account already exist');
        }
  */