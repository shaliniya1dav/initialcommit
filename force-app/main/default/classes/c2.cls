public class c2{

 //List<Account> act=[Select Id, name,industry from Account ];
 // List<Account> act=[Select Id, name,industry from Account where type='customer' ];
   List<Account> act=[Select Id, name,industry from Account where type='prospect' LIMIT 5];//

public  List<Account> getact(){
return act;
}

//public List<Account> getact2(){
//return act2;
//}
}