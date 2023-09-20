class Hi {
    public static void main(String [] args) {
        System.out.println(1);
    }
}

class Bye {
    public int add(int a){
        return 1;
    } 
}
class Byee extends Bye{
    
}

class Byeee extends Byee {
    public int add(int a, int b){
        return 5;
    }
}