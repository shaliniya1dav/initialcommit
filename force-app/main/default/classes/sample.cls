public class sample
{
    public List<Contact__c> code {get;set;}
   
    public sample()
    {
        Map<String,Contact__c> allCodes = Contact__c.getAll();
        code = allCodes.values();
    }  
   
}