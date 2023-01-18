@isTest 
public class AccountUpdateBatchJobTest 
{
    static testMethod void testMethod1() 
    {
        List<Account> lstAccount= new List<Account>();
        for(Integer i=0 ;i<50;i++)
        {
            Account acc = new Account();
            acc.Name ='Name'+i;
            lstAccount.add(acc);
        }
        
        insert lstAccount;
        
        Test.startTest();
    String q='Select description from account';
String e='Account';
String f='Description';
String v='Long Batch test';
batchableaccount obj = new batchableaccount (q,e,f,v);
            
            DataBase.executeBatch(obj ); 
            
        Test.stopTest();
    }
    
            

    
}