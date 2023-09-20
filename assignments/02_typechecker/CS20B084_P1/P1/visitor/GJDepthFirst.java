//
// Generated by JTB 1.3.2
//

package visitor;
import syntaxtree.*;
import java.util.*;

import javax.lang.model.element.VariableElement;
import javax.print.DocFlavor.STRING;

/**
 * Provides default methods which visit each node in the tree in depth-first
 * order.  Your visitors may extend this class.
 */
public class GJDepthFirst<R,A> implements GJVisitor<R,A> {
   //
   // Auto class visitors--probably don't need to be overridden.
   HashMap<String, ClassData> classes= new HashMap<String, ClassData>();
   // HashMap<String, Stack<Integer>> symbolTable= new HashMap<String, Stack<Integer>>();
   HashMap<String, String> symbolTable= new HashMap<String, String>();
   Stack<HashMap<String, String>> symbolTableStack= new Stack<HashMap<String, String>>();
   HashMap<String, MethodData> methodTable= new HashMap<String, MethodData>();
   Stack<HashMap<String, MethodData>> methodTableStack= new Stack<HashMap<String, MethodData>>();
   Boolean checking=false;
   Boolean debug=false;
   Boolean id_flag= false;
   String cur_class="";
   public void update_scope(HashMap<String, String> new_scope){
      for (Map.Entry<String,String> mapElement : new_scope.entrySet()) {
         String key = mapElement.getKey();
         String value = mapElement.getValue();
         symbolTable.put(key, value);
     }
   }
   public void update_method_scope(HashMap<String, MethodData> new_scope){
      for (Map.Entry<String,MethodData> mapElement : new_scope.entrySet()) {
         String key = mapElement.getKey();
         MethodData value = mapElement.getValue();
         methodTable.put(key, value);
     }
   }
   public boolean leq(String type1, String type2){
      String p = type1;
      
      while(p!=null)
      {
         if(p==type2)
         {
            return true;
         }
         if(!(classes.containsKey(p)))
         {
            return false;
         }
         p=classes.get(p).parent;
      }
      return false;
   }
   public static <K, V> HashMap<K, V>
   copyMap(HashMap<K, V> original)
   {

      HashMap<K, V> second_map = new HashMap<>();
      second_map.putAll(original);

      return second_map;
   }
	public R visit(NodeList n, A argu) {
      R _ret=null;
      int _count=0;
      for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
         e.nextElement().accept(this,argu);
         _count++;
      }
      return _ret;
   }

   public R visit(NodeListOptional n, A argu) {
      if ( n.present() ) {
         R _ret=null;
         int _count=0;
         for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
            e.nextElement().accept(this,argu);
            _count++;
         }
         return _ret;
      }
      else
         return null;
   }

   public R visit(NodeOptional n, A argu) {
      if ( n.present() )
         return n.node.accept(this,argu);
      else
         return null;
   }

   public R visit(NodeSequence n, A argu) {
      R _ret=null;
      int _count=0;
      for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
         e.nextElement().accept(this,argu);
         _count++;
      }
      return _ret;
   }

   public R visit(NodeToken n, A argu) { return (R)n.tokenImage; }

   //
   // User-generated visitor methods below
   //

   /**
    * f0 -> MainClass()
    * f1 -> ( TypeDeclaration() )*
    * f2 -> <EOF>
    */
   public R visit(Goal n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);

      checking=true;

      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      
      System.out.println("Program type checked successfully");
      return _ret;
   }

   /**
    * f0 -> "class"
    * f1 -> Identifier()
    * f2 -> "{"
    * f3 -> "public"
    * f4 -> "static"
    * f5 -> "void"
    * f6 -> "main"
    * f7 -> "("
    * f8 -> "String"
    * f9 -> "["
    * f10 -> "]"
    * f11 -> Identifier()
    * f12 -> ")"
    * f13 -> "{"
    * f14 -> PrintStatement()
    * f15 -> "}"
    * f16 -> "}"
    */
   public R visit(MainClass n, A argu) {
		/* YOUR CODE HERE */
      if(!checking)
      {
      R _ret=null;
      n.f0.accept(this, argu);
      String main= (String)n.f1.accept(this, null);
      n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      n.f5.accept(this, argu);
      n.f6.accept(this, argu);
      classes.put(main, null);
      n.f7.accept(this, argu);
      n.f8.accept(this, argu);
      n.f9.accept(this, argu);
      n.f10.accept(this, argu);
      n.f11.accept(this, null);
      n.f12.accept(this, argu);
      n.f13.accept(this, argu);
      n.f14.accept(this, argu);
      n.f15.accept(this, argu);
      n.f16.accept(this, argu);
      return _ret;
      }
      else
      {
         n.f14.accept(this, argu);
         return null;
      }
   }

   /**
    * f0 -> ClassDeclaration()
    *       | ClassExtendsDeclaration()
    */
   public R visit(TypeDeclaration n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);

      return _ret;
   }

   /**
    * f0 -> "class"
    * f1 -> Identifier()
    * f2 -> "{"
    * f3 -> ( VarDeclaration() )*
    * f4 -> ( MethodDeclaration() )*
    * f5 -> "}"
    */
   public R visit(ClassDeclaration n, A argu) {
		/* YOUR CODE HERE */
      // System.out.println("MethodTable" + methodTable);
      ClassData classData = new ClassData();
      classData.parent=null;
      R _ret=null;
      n.f0.accept(this, argu);
      String child= (String)n.f1.accept(this, null);
      if((!checking)&&classes.containsKey(child))
      {
         if(debug){
            System.out.println("Error: Class "+child+" already defined");
         }
         else{
            System.out.println("Type error");
         }
         System.exit(0);
      }
      cur_class=child;
      n.f2.accept(this, argu);
      HashMap<String,String> variables=new HashMap<String,String>();
      n.f3.accept(this, (A)variables);
      symbolTableStack.push(copyMap(symbolTable));
      update_scope(variables);
      HashMap<String,MethodData> methods=new HashMap<String,MethodData>();
      n.f4.accept(this, (A)methods);
      
      methodTableStack.push(copyMap(methodTable));
      update_method_scope(methods);
      // System.out.println("MethodTablemid" + methodTable);
      n.f5.accept(this, argu);
      
      classData.variables=variables;
      classData.methods=methods;
      classes.put(child, classData);
      // System.out.println("Class "+_ret+" defined");
      symbolTable=symbolTableStack.pop();
      HashMap<String, MethodData> x=methodTableStack.pop();
      methodTable=x;
      // System.out.println("MethodTablex" + x);
      return _ret;
      
   }

   /**
    * f0 -> "class"
    * f1 -> Identifier()
    * f2 -> "extends"
    * f3 -> Identifier()
    * f4 -> "{"
    * f5 -> ( VarDeclaration() )*
    * f6 -> ( MethodDeclaration() )*
    * f7 -> "}"
    */
   public R visit(ClassExtendsDeclaration n, A argu) {
		/* YOUR CODE HERE */
      // System.out.println("MethodTable" + methodTable);
      ClassData classData = new ClassData();
      R _ret=null;
      n.f0.accept(this, argu);
      String Child = (String)n.f1.accept(this, null);
      if((!checking)&&classes.containsKey(Child))
      {
         if(debug){
            System.out.println("Error: Class "+Child+" already defined");
         }
         else{
            System.out.println("Type error");
         }
         System.exit(0);
      }
      cur_class=Child;
      n.f2.accept(this, argu);
      String Parent= (String)n.f3.accept(this, null);
      if(checking)
      {
         if(!classes.containsKey(Parent))
         {
            if(debug){
               System.out.println("Error: Parent Class "+Parent+" not defined");
            }
            else{
               System.out.println("Type error");
            }
            System.exit(0);
         }
      }
      HashMap<String,String> variables=new HashMap<String,String>();
      HashMap<String,MethodData> methods=new HashMap<String,MethodData>();
      classData.parent=Parent;
      n.f4.accept(this, argu);
      String p = Parent; 
      Stack<String> parents = new Stack<String>();
      HashMap<String, Boolean>visited = new HashMap<String, Boolean>();
      visited.put(Child, true);
      if(checking)
      while(p!=null)
      {
         if(visited.containsKey(p))
         {
            if(debug){
               System.out.println("Error: Inheritance forms a cycle");
            }
            else{
               System.out.println("Type error");
            }
            System.exit(0);
         }
         parents.push(p);
         visited.put(p, true);
         p=classes.get(p).parent;
      }
      symbolTableStack.push(copyMap(symbolTable));
      methodTableStack.push(copyMap(methodTable));
      while(!(parents.isEmpty()))
      {
         String par= parents.pop();
         ClassData parentData=classes.get(par);
         update_scope(parentData.variables);
         update_method_scope(parentData.methods);
      }
      n.f5.accept(this, (A)variables);
      update_scope(variables);
      // System.out.println("symbol table is "+symbolTable);
      n.f6.accept(this, (A)methods);
      update_method_scope(methods);
      n.f7.accept(this, argu);
      classData.variables=variables;
      classData.methods=methods;
      classes.put(Child, classData);
      // System.out.println("Child: " + Child+ " of parent: "+ Parent);     
      p=Parent;
      symbolTable=symbolTableStack.pop();
      methodTable=methodTableStack.pop();
      // System.out.println("MethodTable" + methodTable);
      return _ret;
   }

   //Variable Declaration
   /**
    * f0 -> Type()
    * f1 -> Identifier()
    * f2 -> ";"
    */
   public R visit(VarDeclaration n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      HashMap<String, String> vars = (HashMap<String, String>) argu;
      if(vars.containsKey(n.f1.accept(this, argu))){
         if(debug)
         {
            System.out.println("Variable "+n.f1.accept(this, argu)+" already defined");
         }
         else
         {
            System.out.println("Type error");
         }
         System.exit(1);
      }
      String type= (String)n.f0.accept(this, argu);
      String id=(String)n.f1.accept(this, null);
      vars.put(id, type);
      n.f2.accept(this, argu);
      // System.out.println("Variable "+id+" of type "+type+" defined");
      return _ret;
   }

   /**
    * f0 -> "public"
    * f1 -> Type()
    * f2 -> Identifier()
    * f3 -> "("
    * f4 -> ( FormalParameterList() )?
    * f5 -> ")"
    * f6 -> "{"
    * f7 -> ( VarDeclaration() )*
    * f8 -> ( Statement() )*
    * f9 -> "return"
    * f10 -> Expression()
    * f11 -> ";"
    * f12 -> "}"
    */
   public R visit(MethodDeclaration n, A argu) {
		/* YOUR CODE HERE */
      
      R _ret=null;
      HashMap<String, MethodData> methods = (HashMap<String, MethodData>) argu;
      MethodData methodData =new MethodData();
      HashMap<String,String> variables=new HashMap<String,String>();
      n.f0.accept(this, argu);
      String returnType= (String)n.f1.accept(this, argu);
      String id= (String)n.f2.accept(this, null);
      n.f3.accept(this, argu);
      n.f4.accept(this,(A) methodData);
      symbolTableStack.push(copyMap(symbolTable));
      update_scope(methodData.arguments);
      n.f5.accept(this, argu);
      n.f6.accept(this, argu);
      n.f7.accept(this, (A) variables);
      update_scope(variables);
      // System.out.println("symbol table is "+symbolTable);
      n.f8.accept(this, argu);
      n.f9.accept(this, argu);
      String expr_type= (String)n.f10.accept(this, argu);
      n.f11.accept(this, argu);
      n.f12.accept(this, argu);
      methodData.return_type=returnType;
      methodData.variables=variables;
      symbolTable=symbolTableStack.pop();
      if(checking)
      {
         if(!returnType.equals(expr_type))
         {
            if(debug)
               System.out.println("Error: Return type of method "+id+" is not same as the type of expression "+expr_type);
            else
            {
               System.out.println("Type error");
            }
            System.exit(0);
         }
      }
      if(methods.containsKey(id))
      {
         if(debug)
            System.out.println("Error: Method "+id+" already defined");
         else
         {
            System.out.println("Type error");
         }
         System.exit(0);
      }
      //overriding check
      if(checking)
      {
         if(methodTable.containsKey(id))
         {
            MethodData method=methodTable.get(id);
            if(!method.return_type.equals(returnType))
            {
               if(debug)
                  System.out.println("Error: Return type of method "+id+" is not same as return type of parent method");
               else
               {
                  System.out.println("Type error");
               }
               System.exit(0);
            }
            if(method.argument_number!=methodData.argument_number)
            {
               if(debug)
                  System.out.println("Error: Number of arguments of method "+id+" is not same as the number of arguments in the overriden method");
               else
               {
                  System.out.println("Type error");
               }
               System.exit(0);
            }
            
            for(int i=0;i<method.argument_number;i++)
            {
               if(!(method.argument_types.get(i).equals(methodData.argument_types.get(i))))
               {
                  if(debug)
                     System.out.println("Error: Type of argument "+i+" of method "+id+" is not same as the type of argument in the overriden method");
                  else
                  {
                     System.out.println("Type error");
                  }
                  System.exit(0);
               }
            }
         }
      }
      
      
      methods.put(id, methodData);
      // methodData.argument_types=parameters;
      // methodData.argument_number=(int)parameters.size();
      // methodData.return_type=returnType;
      // System.out.println("Method "+id);
      // // Collections.reverse(parameters);
      // System.out.println(variables);
      // System.out.println(methodData.arguments);
      // System.out.println(methodData.argument_types);
      // System.out.println("Return type: "+returnType);
      return _ret;
   }

   /**
    * f0 -> FormalParameter()
    * f1 -> ( FormalParameterRest() )*
    */
   public R visit(FormalParameterList n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;    
      n.f0.accept(this, argu); 
      n.f1.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> Type()
    * f1 -> Identifier()
    */
   public R visit(FormalParameter n, A argu) {
		/* YOUR CODE HERE */
      R _ret=null;
      String type= (String)n.f0.accept(this, argu);
      String id = (String)n.f1.accept(this, null);
      MethodData methodData = (MethodData) argu;
      methodData.argument_types.add(type);
      methodData.argument_number++;
      if(methodData.arguments.containsKey(id))
      {
         if(debug)
            System.out.println("Error: Argument "+id+" already defined");
         else
         {
            System.out.println("Type error");
         }
         System.exit(0);
      }
      methodData.arguments.put(id, type);
      return _ret;
   }

   /**
    * f0 -> ","
    * f1 -> FormalParameter()
    */
   public R visit(FormalParameterRest n, A argu) {
		/* YOUR CODE HERE */

      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      return null;
   }

   /**
    * f0 -> ArrayType()
    *       | BooleanType()
    *       | IntegerType()
    *       | Identifier()
    */
   public R visit(Type n, A argu) {
		/* YOUR CODE HERE */

      R _ret=n.f0.accept(this, null);
      return _ret;
   }

   /**
    * f0 -> "int"
    * f1 -> "["
    * f2 -> "]"
    */
   public R visit(ArrayType n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      return (R)"int[]";
   }

   /**
    * f0 -> "boolean"
    */
   public R visit(BooleanType n, A argu) {
		/* YOUR CODE HERE */

      R _ret=n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "int"
    */
   public R visit(IntegerType n, A argu) {
		/* YOUR CODE HERE */

      R _ret=n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> Block()
    *       | AssignmentStatement()
    *       | ArrayAssignmentStatement()
    *       | IfStatement()
    *       | WhileStatement()
    *       | PrintStatement()
    */
   public R visit(Statement n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "{"
    * f1 -> ( Statement() )*
    * f2 -> "}"
    */
   public R visit(Block n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> Identifier()
    * f1 -> "="
    * f2 -> Expression()
    * f3 -> ";"
    */
   public R visit(AssignmentStatement n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String id=(String)n.f0.accept(this, null);
      n.f1.accept(this, argu);
      String expr_type= (String)n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      if(checking)
      {
         if(!(symbolTable.containsKey(id)))
         {
            if(debug)
               System.out.println("Error: Variable "+id+" not defined");
            else
            {
               System.out.println("Type error");
            }
            System.exit(0);
         }
         if(!(leq(expr_type,symbolTable.get(id))))
         {
            if(debug)
               System.out.println("Error: Type of expression "+expr_type+" is not same as the type of variable "+id+", "+symbolTable.get(id));
            else
            {
               System.out.println("Type error");
            }
            System.exit(0);
         }
      }
      return _ret;
   }

   /**
    * f0 -> Identifier()
    * f1 -> "["
    * f2 -> Expression()
    * f3 -> "]"
    * f4 -> "="
    * f5 -> Expression()
    * f6 -> ";"
    */
   public R visit(ArrayAssignmentStatement n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String id= (String)n.f0.accept(this, null);
      n.f1.accept(this, argu);
      String expr_type= (String)n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      String assgn_expr_type= (String)n.f5.accept(this, argu);
      n.f6.accept(this, argu);
      if(checking)
      {
         
         if(!(symbolTable.containsKey(id)))
         {
            if(debug)
               System.out.println("Error: Variable "+id+" not defined");
            else
            {
               System.out.println("Type error");
            }
            System.exit(0);
         }
         else
         {
            String type;
            type=symbolTable.get(id);
            if(!(type.equals("int[]")))
            {
               if(debug)
                  System.out.println("Error: Variable "+id+" is not an int array");
               else
               {
                  System.out.println("Type error");
               }
               System.exit(0);
            }
         }
         if(!expr_type.equals("int"))
         {
            if(debug)
               System.out.println("Error: Type of expression "+expr_type+" is not int");
            else
            {
               System.out.println("Type error");
            }
            System.exit(0);
         }
         if(!assgn_expr_type.equals("int"))
         {
            if(debug)
               System.out.println("Error: Type of expression "+assgn_expr_type+" is not same as the type of variable "+id+", int");
            else
            {
               System.out.println("Type error");
            }
            System.exit(0);
         }
      }
      return _ret;
   }

   /**
    * f0 -> IfthenElseStatement()
    *       | IfthenStatement()
    */
   public R visit(IfStatement n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "if"
    * f1 -> "("
    * f2 -> Expression()
    * f3 -> ")"
    * f4 -> Statement()
    */
   public R visit(IfthenStatement n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String expr_type= (String)n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "if"
    * f1 -> "("
    * f2 -> Expression()
    * f3 -> ")"
    * f4 -> Statement()
    * f5 -> "else"
    * f6 -> Statement()
    */
   public R visit(IfthenElseStatement n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String expr_type= (String)n.f2.accept(this, argu);
      if(checking)
      {
         if(!expr_type.equals("boolean"))
         {
            if(debug)
               System.out.println("Error: If condition must be boolean but given "+expr_type);
            else
            {
               System.out.println("Type error");
            }
            System.exit(0);
         }
      }
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      n.f5.accept(this, argu);
      n.f6.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "while"
    * f1 -> "("
    * f2 -> Expression()
    * f3 -> ")"
    * f4 -> Statement()
    */
   public R visit(WhileStatement n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String expr_type= (String)n.f2.accept(this, argu);
      if(checking)
      {
         if(!expr_type.equals("boolean"))
         {
            if(debug)
               System.out.println("Error: While condition must be boolean but given "+expr_type);
            else
            {
               System.out.println("Type error");
            }
            System.exit(0);
         }
      }
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "System.out.println"
    * f1 -> "("
    * f2 -> Expression()
    * f3 -> ")"
    * f4 -> ";"
    */
   public R visit(PrintStatement n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String expr_type= (String)n.f2.accept(this, argu);
      if(checking)
      {
         if(!expr_type.equals("int"))
         {
            if(debug)
               System.out.println("Error: print expression must be int but given "+expr_type);
            else
            {
               System.out.println("Type error");
            }
            System.exit(0);
         }
      }
      n.f3.accept(this, argu);
      n.f4.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> OrExpression()
    *       | AndExpression()
    *       | CompareExpression()
    *       | neqExpression()
    *       | PlusExpression()
    *       | MinusExpression()
    *       | TimesExpression()
    *       | DivExpression()
    *       | ArrayLookup()
    *       | ArrayLength()
    *       | MessageSend()
    *       | PrimaryExpression()
    */
   public R visit(Expression n, A argu) {
		/* YOUR CODE HERE */

      R _ret=n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "&&"
    * f2 -> PrimaryExpression()
    */
   public R visit(AndExpression n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String type1= (String)n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String type2= (String)n.f2.accept(this, argu);
      if(checking)
      {
         if(type1.equals("boolean") && type2.equals("boolean"))
            return (R)type1;
         else
         {
            if(debug)
               System.out.println("Error in AndExpression");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
      }
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "||"
    * f2 -> PrimaryExpression()
    */
   public R visit(OrExpression n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String type1= (String)n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String type2= (String)n.f2.accept(this, argu);
      if(checking)
      {
         if(type1.equals("boolean") && type2.equals("boolean"))
            return (R)type1;
         else
         {
            if(debug)
               System.out.println("Error in OrExpression");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
      }
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "<="
    * f2 -> PrimaryExpression()
    */
   public R visit(CompareExpression n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String type1= (String)n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String type2= (String)n.f2.accept(this, argu);
      if(checking)
      {
         if(type1.equals("int") && type2.equals("int"))
            return (R)"boolean";
         else
         {
            if(debug)
               System.out.println("Error in <= Expression");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
      }
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "!="
    * f2 -> PrimaryExpression()
    */
   public R visit(neqExpression n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String type1= (String)n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String type2= (String)n.f2.accept(this, argu);
      if(checking)
      {
         if((type1.equals("boolean") && type2.equals("boolean"))||(type1.equals("int") && type2.equals("int")))
            return (R)"boolean";
         else
         {
            if(debug)
               System.out.println("Error in != Expression");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
      }
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "+"
    * f2 -> PrimaryExpression()
    */
   public R visit(PlusExpression n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String type1= (String)n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String type2= (String)n.f2.accept(this, argu);
      if(checking)
      {
         if(type1.equals("int") && type2.equals("int"))
            return (R)type1;
         else
         {
            if(debug)
               System.out.println("Error in AddExpression");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
      }
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "-"
    * f2 -> PrimaryExpression()
    */
   public R visit(MinusExpression n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String type1= (String)n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String type2= (String)n.f2.accept(this, argu);
      if(checking)
      {
         if(type1.equals("int") && type2.equals("int"))
            return (R)type1;
         else
         {
            if(debug)
               System.out.println("Error in SubExpression");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
      }
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "*"
    * f2 -> PrimaryExpression()
    */
   public R visit(TimesExpression n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String type1= (String)n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String type2= (String)n.f2.accept(this, argu);
      if(checking)
      {
         if(type1.equals("int") && type2.equals("int"))
            return (R)type1;
         else
         {
            if(debug)
               System.out.println("Error in MulExpression");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
      }
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "/"
    * f2 -> PrimaryExpression()
    */
   public R visit(DivExpression n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String type1= (String)n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String type2= (String)n.f2.accept(this, argu);
      if(checking)
      {
         if(type1.equals("int") && type2.equals("int"))
            return (R)type1;
         else
         {
            if(debug)
               System.out.println("Error in DivExpression");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
      }
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "["
    * f2 -> PrimaryExpression()
    * f3 -> "]"
    */
   public R visit(ArrayLookup n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String type1= (String)n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      String type2= (String)n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      if(checking)
      {
         if(type1.equals("int[]") && type2.equals("int"))
            return (R)type2;
         else
         {
            if(debug)
               System.out.println("Error in ArrayExpression");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
      }
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "."
    * f2 -> "length"
    */
   public R visit(ArrayLength n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String type1= (String)n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      if(checking)
      {
         if(type1.equals("int[]"))
            return (R)"int";
         else
         {
            if(debug)
               System.out.println("Error in LengthExpression");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
      }
      return _ret;
   }

   /**
    * f0 -> PrimaryExpression()
    * f1 -> "."
    * f2 -> Identifier()
    * f3 -> "("
    * f4 -> ( ExpressionList() )?
    * f5 -> ")"
    */
   public R visit(MessageSend n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      String type= (String)n.f0.accept(this, argu);
      ClassData c=new ClassData();
      if(checking)
      {
         if(!classes.containsKey(type))
         {
            if(debug)
               System.out.println("class "+type+" not defined");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
         else
         {
            c=classes.get(type);
         }
      }
      n.f1.accept(this, argu);
      String id= (String)n.f2.accept(this, null);
      MethodData m=new MethodData();
      if(checking)
      {
         if(!c.methods.containsKey(id))
         {
            if(debug)
               System.out.println("method "+id+" not defined in class "+type);
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
         else
         {
            m=c.methods.get(id);
         }
      }
      n.f3.accept(this, argu);
      ArrayList<String> types= new ArrayList<String>();
      n.f4.accept(this, (A)types);
      if(checking)
      {
         if(types.size()!=m.argument_number)
         {
            if(debug)
               System.out.println("Wrong number of arguments in method call "+id);
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
         else
         {
            for(int i=0; i<types.size(); i++)
            {
               if(!leq(types.get(i),(m.argument_types.get(i))))
               {
                  if(debug)
                     System.out.println("Wrong type of argument "+i+" "+types.get(i)+" in method call "+id);
                  else
                  {
                     System.out.println("Type error");
                  }
                  System.exit(1);
               }
            }
         }
      }
      // System.out.println("types: "+types);
      n.f5.accept(this, argu);
      //change this
      return (R)(m.return_type);
   }

   /**
    * f0 -> Expression()
    * f1 -> ( ExpressionRest() )*
    */
   public R visit(ExpressionList n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      ArrayList<String> types= (ArrayList<String>)argu;
      String expr_type= (String) n.f0.accept(this, argu);
      types.add(expr_type);
      n.f1.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> ","
    * f1 -> Expression()
    */
   public R visit(ExpressionRest n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      n.f0.accept(this, argu);
      ArrayList<String> types= (ArrayList<String>)argu;
      String expr_type= (String)n.f1.accept(this, argu);
      types.add(expr_type);
      return _ret;
   }

   /**
    * f0 -> IntegerLiteral()
    *       | TrueLiteral()
    *       | FalseLiteral()
    *       | Identifier()
    *       | ThisExpression()
    *       | ArrayAllocationExpression()
    *       | AllocationExpression()
    *       | NotExpression()
    *       | BracketExpression()
    */
   public R visit(PrimaryExpression n, A argu) {
		/* YOUR CODE HERE */
      if(checking){
      ArrayList<String> exprs= new ArrayList<String>(Arrays.asList("int","boolean","int[]"));
      id_flag=false;
      R _ret=n.f0.accept(this, (A)"pr");
      // System.out.println("primary: "+_ret + " "+id_flag);
      if(exprs.contains(_ret))
         return _ret;
      if(!(id_flag)&&classes.containsKey(_ret))
         return _ret;
      if(symbolTable.containsKey(_ret))
         return (R)symbolTable.get(_ret);
      else
         // if(checking)
         // {
         {
            if(debug)
               System.out.println("Identifier "+ _ret+" not found");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
            return null;
         }}
         // }
         else
         return null;

   }

   /**
    * f0 -> <INTEGER_LITERAL>
    */
   public R visit(IntegerLiteral n, A argu) {
		/* YOUR CODE HERE */

      R _ret=n.f0.accept(this, argu);
      return (R) "int";
   }

   /**
    * f0 -> "true"
    */
   public R visit(TrueLiteral n, A argu) {
		/* YOUR CODE HERE */

      R _ret=n.f0.accept(this, argu);
      return (R)"boolean";
   }

   /**
    * f0 -> "false"
    */
   public R visit(FalseLiteral n, A argu) {
		/* YOUR CODE HERE */

      R _ret=n.f0.accept(this, argu);
      return (R)"boolean";
   }

   /**
    * f0 -> <IDENTIFIER>
    */
   public R visit(Identifier n, A argu) {
		/* YOUR CODE HERE */
      R _ret=n.f0.accept(this, argu);
      if(argu!=null)
      {
         if(argu.equals("pr"))
            id_flag=true;
      }
      else
      {
         id_flag=false;
      }
      // System.out.println("id32: "+_ret);
      return _ret;
   }

   /**
    * f0 -> "this"
    */
   public R visit(ThisExpression n, A argu) {
		/* YOUR CODE HERE */
      
      R _ret=n.f0.accept(this, argu);
      id_flag= false;
      return (R)cur_class;
   }

   /**
    * f0 -> "new"
    * f1 -> "int"
    * f2 -> "["
    * f3 -> Expression()
    * f4 -> "]"
    */
   public R visit(ArrayAllocationExpression n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      String expr_type= (String)n.f3.accept(this, argu);
      if(checking)
      {
         if(expr_type.equals("int"))
            return (R)"int[]";
         else
         {
            if(debug)
               System.out.println("Error in ArrayAllocationExpression");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
      }
      n.f4.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "new"
    * f1 -> Identifier()
    * f2 -> "("
    * f3 -> ")"
    */
   public R visit(AllocationExpression n, A argu) {
		/* YOUR CODE HERE */
      
      R _ret=null;
      n.f0.accept(this, argu);
      String id=(String)n.f1.accept(this, null);
      n.f2.accept(this, argu);
      n.f3.accept(this, argu);
      id_flag= false;
      return (R)id;
   }

   /**
    * f0 -> "!"
    * f1 -> Expression()
    */
   public R visit(NotExpression n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      n.f0.accept(this, argu);
      String expr_type= (String)n.f1.accept(this, argu);
      if(checking)
      {
         if(expr_type.equals("boolean"))
            return (R)"boolean";
         else
         {
            if(debug)
               System.out.println("Error in NotExpression");
            else
            {
               System.out.println("Type error");
            }
            System.exit(1);
         }
      }
      return _ret;
   }

   /**
    * f0 -> "("
    * f1 -> Expression()
    * f2 -> ")"
    */
   public R visit(BracketExpression n, A argu) {
		/* YOUR CODE HERE */

      R _ret=null;
      n.f0.accept(this, argu);
      String expr_type= (String)n.f1.accept(this, argu);
      n.f2.accept(this, argu);
      return (R)expr_type;
   }

   /**
    * f0 -> Identifier()
    * f1 -> ( IdentifierRest() )*
    */
   public R visit(IdentifierList n, A argu) {
      R _ret=null;
      n.f0.accept(this, null);
      n.f1.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> ","
    * f1 -> Identifier()
    */
   public R visit(IdentifierRest n, A argu) {
      R _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, null);
      return _ret;
   }

}

class ClassData{
   public String parent;
   public HashMap<String, MethodData> methods = new HashMap<String, MethodData>();
   public HashMap<String, String> variables = new HashMap<String, String>();
   public ClassData(){
   }
}

class MethodData{
   public String return_type;
   public int argument_number;
   public HashMap<String, String> variables;
   public ArrayList<String> argument_types;
   public HashMap<String, String> arguments;
   public   MethodData(){
      variables = new HashMap<String, String>();
      arguments = new HashMap<String, String>();
      argument_types = new ArrayList<String>();
   }
   public MethodData(String ret, int arg_num,ArrayList<String> params
   , HashMap<String, String> vars, HashMap<String, String> args)
   {
      return_type=ret;
      argument_number=arg_num;
      argument_types = params;
      variables=vars;
   }
}

