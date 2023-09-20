#defineStmt NUM(a,b,c,d,e,f) {
  System.out.println(a);
  System.out.println(b);
  System.out.println(c);
  System.out.println(d);
  System.out.println(e);
  System.out.println(f);
}

class T8 {
    public static void main(String[] a){
      System.out.println (0);
    }
}

class Foo {
  public int foo () {
    NUM(1,2,3,4,5,6);
    return 0;
  }
}
