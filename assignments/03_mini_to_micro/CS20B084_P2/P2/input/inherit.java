class Inherit {
    public static void main(String [] args) {
      System.out.println(new A().b());
    }
  }
  
  class A {
    public int b() {
      Visitor v;
      anotherVisitor vprime;
      int a;
      v = new myVisitor();
      vprime = new anotherVisitor();
      a = v.visit();
      System.out.println(a);
      v = new anotherVisitor();
      a = v.visit();
      System.out.println(a);
      a = (new extraComplexity()).accept(v);
      return a;
    }
  }
  
  class Visitor {
    public int visit() {
      return 1;
    }
  }
  
  class myVisitor extends Visitor {
    public int visit() {
      return 2;
    }
  }
  
  class anotherVisitor extends Visitor {
    public int visit() {
      return 3;
    }
  }
  class extraComplexity {
    public int accept(Visitor v){
      return v.visit();
    }
  }
  