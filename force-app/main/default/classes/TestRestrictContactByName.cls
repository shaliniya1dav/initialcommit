@isTest

private class TestRestrictContactByName {
    
@isTest static void TestContactByName()  {
        
   Contact c=new contact();
    c.LastName='INVALIDNAME';
    insert c;
   /* Test.startTest();
         Database.SaveResult r=Database.insert(c,false);
         Test.stopTest();*/
    
 //System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML',
                          //  r.getErrors()[0].getMessage() );
   System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML',
                           'error');
    
    
        
    }
      
}