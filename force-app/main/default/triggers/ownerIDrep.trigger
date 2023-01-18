Trigger ownerIDrep on Contact (before insert,after update)
{
  
   List<id> acctIds = new List<id>();
   Map<id,contact> contactMap = new Map<id,contact>();
   for(contact a: trigger.new)
   {
   
       acctIds .add(a.Id);
    
   }
   for(contact acc : [Select id,Ownerid from contact where id IN :acctIds ])
   {
    
     contactMap.put(acc.id,acc);

   }
for(contact b: trigger.new)
   {
   try{
      b.Owner_name__c = contactMap.get(b.Id).OwnerId;
    }catch (System.NullPointerException e){
    System.debug(e.getMessage());
    }
   }

  
}