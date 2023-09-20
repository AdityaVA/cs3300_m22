#defineExpr0 NUM() (10+0)
#defineExpr1 ONE(x) (1+x)
class Factorial{
    public static void main(String[] a){
        System.out.println(new Fac().ComputeFac(NUM()));
    }
}

class Fac {
    public int ComputeFac(int num){
        int num_aux ;
        if ((num <= 1)&&(num != 1))
            num_aux = ONE(ONE((NUM())&&(NUM()))) ;
        else
            num_aux = num * (this.ComputeFac(num-1)) ;
        return num_aux ;
    }
}
