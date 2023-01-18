public class e2{

public e2(ApexPages.StandardController cont ){}
List<Campaign> camp= [ select Type, Status,StartDate,EndDate from Campaign];

public List<Campaign> getcamp(){

return camp;

}

}