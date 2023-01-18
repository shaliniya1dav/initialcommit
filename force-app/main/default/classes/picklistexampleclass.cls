public with sharing class picklistexampleclass {
    List<selectOption> options = new List<selectOption>();
    public List<selectOption> getAccNames() {
        for(Account acc : [select Id,name from Account LIMIT 500]) {
            options.add(new selectOption(acc.name,acc.name));
        }
        return options;
    }
}