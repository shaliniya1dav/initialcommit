trigger firsttrigger on Account (before insert) {
    for(Account a: Trigger.New){
        a.Description='I am shivangi';
    }

    
    
}