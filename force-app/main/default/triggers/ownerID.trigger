Trigger ownerID on Account (before insert,before update)
{
  
   List<id> acctIds = new List<id>();
   Map<id,account> accountMap = new Map<id,account>();
   for(Account a: trigger.new)
   {
   
       acctIds .add(a.Id);
    
   }
   for(Account acc : [Select id,Ownerid from Account where id in:acctIds ])
   {
    
     accountMap.put(acc.id,acc);

   }
for(Account b: trigger.new)
   {
   try{
      b.Owner_name__c = accountMap.get(b.Id).OwnerId;
    }catch (System.NullPointerException e){
    System.debug(e.getMessage());
    }
   }

  
}