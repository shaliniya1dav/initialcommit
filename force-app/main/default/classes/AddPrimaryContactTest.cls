@isTest
public class AddPrimaryContactTest {

    
     @isTest static void TestList()
         {
        List<Account>ac= new List<Account>();
        List<Contact>contactlist =new List<Contact> (); 
        for(integer i; i<=50;i++)  {
            
         Account b =new Account();
            b.name='Shivangi'+i;
            b.BillingState ='NY';
              ac.add(b);   
            
        }  
        
           for(integer i; i<=50;i++)  {
            
         Account b =new Account();
            b.name='Shivangi'+i;
            b.BillingState ='CA';
              ac.add(b);            
        }  
             insert ac;   
             
        for (Account c:ac)    {
            if(c.BillingState=='CA') {
             Contact cons= new Contact();
            cons.LastName='Trailhead';
            cons.AccountId= c.Id;
            contactlist.add(cons);    
            }    
         
        }   
      insert contactlist;   
     String state = 'CA';
   
AddPrimaryContact check = new AddPrimaryContact(state);
    Test.startTest();
            System.enqueueJob(check);
          Test.stopTest();     




        
    } 
    
    
    
    
    
    
    
    
   
}