trigger AccountTrigger on Account (before insert,before update) {
    for(Account a : Trigger.New) {
        a.rep_name__c = a.Owner.Name;
    }   
}