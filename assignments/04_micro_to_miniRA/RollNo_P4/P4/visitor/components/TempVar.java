package visitor.components;

public class TempVar {
   public int id;
   public int startLine, endLine;
   public TempVar(){}
   public TempVar(int id, int startLine, int endLine)
   {
       this.id = id;
       this.startLine = startLine;
       this.endLine = endLine;
   }
}
