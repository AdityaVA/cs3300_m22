package visitor.components;
import java.util.*;
public class Function {
    public ArrayList<StmtNode> nodes = new ArrayList<>();
	public HashMap<Integer, TempVar> tempMap = new HashMap<>();
	public HashMap<Integer, String> regMap = new HashMap<>();
	public HashMap<Integer, Integer> spilledMap = new HashMap<>();
    public int args, maxArgs = -1;
	public int maxStackSpace = 0, stackPointer;
}
