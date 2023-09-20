import syntaxtree.*;
import visitor.*;

public class P4 {
   Object a = new GJDepthFirst<>();
   public static void main(String [] args) {
      try {
         Node root = new microIRParser(System.in).Goal();
         //System.out.println("Program parsed successfully");
         test tst = new test(root);
         // Your assignment part is invoked here.
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 



