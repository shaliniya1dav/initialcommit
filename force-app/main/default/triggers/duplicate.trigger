trigger duplicate on Account (before insert,before update){

Set<String> names= new set<String>();

for(Account a : trigger.new){

names.add(a.name);

}
 
list<Account> acc= [select name from Account where Name IN :names];
   for(Account aa:trigger.new) 
   {
    if(acc.size()>0)
        
    {
        aa.adderror('duplicate name found');
    }
   }
}