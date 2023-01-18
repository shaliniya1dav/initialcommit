public class rendercontroller{

 Public boolean renderFlag{get;set;}
 Public Account acc{get;set;}
 
 public rendercontroller(){
 
 renderFlag=false;
 acc=[Select id , name from account LIMIT 1];

 }

public void  method5(){
renderFlag=true;
}





}