trigger opptrigger on Account (after update) {

 List<Opportunity> opps= [SELECT amount FROM Opportunity
        WHERE AccountId IN :Trigger.New];

List<Opportunity> oppsToUpdate = new List<Opportunity>();
for(Opportunity a: opps){

if((a.amount <50)&& (a.amount>100)){
a.Description='amount cxan be between 50 to 100';
oppsToUpdate .add(a);

}

}

update oppsToUpdate ;


}