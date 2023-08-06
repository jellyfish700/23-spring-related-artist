public class Artist{
  String name;
  int pop;
  String id;
  int number;
  
  Artist( String name,int pop,String id,int number){
  this.name=name;
  this.pop=pop;
  this.id=id;
  this.number=number;
  }
  
  float rad(){
    return pop*2;
  }
     
  float x1(){
    if(number==0){
      return -list.get(0).rad()/2;
    }else if(number==1){
      return list.get(0).rad()/2;
    }else if(number==4 || number==6){
      return -list.get(0).rad()/14*5;
    }else if(number==5 || number==7){
      return list.get(0).rad()/14*5;
    }
    return 0;
  }
  
 float y1(){
  if(number==2){
    return -list.get(0).rad()/2;
  }else if(number==3){
    return list.get(0).rad()/2;
  }else if(number==4 || number==5){
    return -list.get(0).rad()/14*5;
  }else if(number==6 || number==7){
    return list.get(0).rad()/14*5;
  }
  return 0;
  }
  
 float x2(){
  if(number==0){
    return -200;
  }else if(number==1){
    return 200;
  }else if(number==4 || number==6){
    return -143;
  }else if(number==5 || number==7){
    return 143;
  }
  return 0;
  }
 float y2(){
  if(number==2){
    return -200;
  }else if(number==3){
    return 200;
  }else if(number==4 || number==5){
    return -143;
  }else if(number==6 || number==7){
    return 143;
  }
  return 0;
  }
  
  float ex(){
    if(number==0){
      return 200;
    }else if(number==1){
      return -200;
    }else if(number==4 || number==5){
      return 143;
    }else if(number==6 || number==7){
      return -143;
    }else if(number==10 || number==11){
      return 400;
    }else if(number==12 || number==13){
      return -400;
    }else if(number==14 || number==16){
      return 100;
    }else if(number==15 || number==17){
      return -100;
    }else if(number==18 || number==20){
      return 335;
    }else if(number==19 || number==21){
      return 235;
    }else if(number==22 || number==24){
      return -335;
    }else if(number==23 || number==25){
      return -235;
    }
    return 0;
  }
   float ey(){
    if(number==2){
      return 200;
    }else if(number==3){
      return -200;
    }else if(number==4 || number==6){
      return 143;
    }else if(number==5 || number==7){
      return -143;
    }else if(number==10 || number==12){
      return 100;
    }else if(number==11 || number==13){
      return -100;
    }else if(number==14 || number==15){
      return 400;
    }else if(number==16 || number==17){
      return -400;
    }else if(number==18 || number==22){
      return 235;
    }else if(number==19 || number==23){
      return 335;
    }else if(number==20 || number==24){
      return -235;
    }else if(number==21 || number==25){
      return -335;
    }
    return 0;
  }
}
