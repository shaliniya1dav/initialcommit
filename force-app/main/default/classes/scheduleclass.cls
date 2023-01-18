public class scheduleclass implements Schedulable{


public  static void execute(SchedulableContext sc){

string q='Select Description from account';
string e='Account';
string f='Description';
String v='I am sapna';

Database.executeBatch(new batchableaccount (q,e,f,v) );
}



}