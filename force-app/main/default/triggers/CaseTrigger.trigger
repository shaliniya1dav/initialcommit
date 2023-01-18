trigger CaseTrigger on Case (after insert) 
{
    Set<Id> caseIds = new Set<Id>();
    if(Trigger.isAfter && Trigger.isInsert)
    {
        for(Case caseObj: Trigger.new)
        {
            
                caseIds.add(caseObj.Id);
            
        }

        List<Case> lstCase = [SELECT Id, AccountId, ContactId FROM Case WHERE Id IN:caseIds];

        CaseAutoFill ca = new CaseAutoFill(lstCase);
        DateTime nextRun = system.now().addMinutes(1);
        String cron = nextRun.second()+' '+nextRun.minute()+' '+nextRun.hour()+' ? '+nextRun.month()+' * '+nextRun.year();
        String jobID = system.schedule('ca-'+system.now(), cron, ca); 
    }
    }