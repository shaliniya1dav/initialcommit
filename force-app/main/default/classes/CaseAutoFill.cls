global class CaseAutoFill implements Schedulable 
{
    list<Case> newCases;
    global CaseAutoFill(list<Case> newCases)
    {
        this.newCases = newCases;
    }
    global void execute(SchedulableContext SC) 
    {
        system.debug('newCases..!'+newCases);
        Set<String> accEmails = new Set<String>();
        Set<String> contactEmails = new Set<String>();
        for(Case c : newCases)
        {
            accEmails.add(c.SuppliedEmail);
            contactEmails.add(c.SuppliedEmail);
        }
        system.debug('accEmails..!'+accEmails);
        system.debug('contactEmails..!'+contactEmails);

        //Account map
        list<Account> accounts = [select Id,Web_Email__c from Account where Web_Email__c IN: accEmails];
        map<String,Account> accountMap = new map<String,Account>();
        for(Account acc : accounts){
            accountMap.put(acc.Web_Email__c,acc);
        
        }

        //Contact map
        list<Contact> contacts = [select Id,Email from Contact where Email IN: contactEmails];
        map<String,Contact> contactMap = new map<String,Contact>();
        for(Contact con : contacts){
            contactMap.put(con.Email,con);
        }

        //looping accounts
        list<Account> newAccounts = new list<Account>();        
        for(Case c : newCases)
        {
            Account acc = new Account();
            acc.Name = c.Subject;
            acc.Web_Email__c = c.SuppliedEmail;
            newAccounts.add(acc);
        }
        insert newAccounts;
        for(Account acc : newAccounts){
          
          accountMap.put(acc.Web_Email__c ,acc);
          
        }

        //looping contacts
        list<Contact> newContacts = new list<Contact>();        
        for(Case c : newCases)
        {
            if(!contactMap.containsKey(c.SuppliedEmail))
            {
                Contact con = new Contact();
                if(accountMap.containsKey(c.SuppliedEmail)){
                    con.accountId = accountMap.get(c.SuppliedEmail ).Id;
                }                
                con.Email = c.SuppliedEmail;
                con.lastName = c.Subject;
                
                
                newContacts.add(con);
            }
        }
        insert newContacts;
        for(Contact con : newContacts){
            contactMap.put(con.Email,con);
        }
        system.debug('accountMap..!'+accountMap);
        system.debug('contactMap..!'+contactMap);

        //final verification
        for(Case c : newCases)
        {
            if(String.isBlank(c.AccountId) && accountMap.containsKey(c.SuppliedEmail))
            {
                c.AccountId = accountMap.get(c.SuppliedEmail).Id;
            }
            if(String.isBlank(c.contactId) && contactMap.containsKey(c.SuppliedEmail))
            {
                c.contactId = contactMap.get(c.SuppliedEmail).Id;
            }
        }   
        system.debug('newCases..!'+newCases);
        update newCases;     
        }
        }