package visitor.components;
import java.util.*;
public class StmtNode {
    public ArrayList<Integer> succ = new ArrayList<Integer>();
    public Set<Integer> in = new HashSet<Integer>(), out = new HashSet<Integer>(), 
               def = new HashSet<Integer>(), use = new HashSet<Integer>();
    public StmtNode()
    {
    }
}
