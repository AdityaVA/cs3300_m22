package visitor;
import syntaxtree.*;
import java.util.*;
import visitor.components.*;
public class test {
	public static int lineCount;
    public static HashMap<String, Function> FuncTable;
    public void fill_in_out()
    {
        for(Function f:FuncTable.values())
        {
            ArrayList<StmtNode> nodes = f.nodes;
            while(true)
            {
                boolean all = true;
                for (StmtNode node :nodes)
                {
                    Set<Integer> in2, out2, sub;
                    in2 = new HashSet<Integer>(node.in);
                    out2 = new HashSet<Integer>(node.out);
                    sub = new HashSet<Integer>(node.out);
                    sub.removeAll(node.def);
                    node.in.clear();
                    node.in.addAll(node.use);
                    node.in.addAll(sub);
                    node.out.clear();
                    // System.err.println("node: "+node.in);
                    for (Integer i : node.succ)
                    {
                        if(i<nodes.size())
                            node.out.addAll(nodes.get(i).in);
                    }
                    if(!node.in.equals(in2) || !node.out.equals(out2)) {
						all = false;
					}
                }
                if(all)
                {
                    break;
                }
                
            }
        }
    }

    public void find_start_end()
    {
        for(Function f:FuncTable.values())
        {
            ArrayList<StmtNode> nodes = f.nodes;
            StmtNode node0 = nodes.get(0);
            for(int i: node0.in)
            {
                TempVar t = new TempVar();
                t.id = i;

                t.startLine = 0;
                f.tempMap.put(i, t);
            }
            int itr =0 ;
            for(StmtNode node:nodes)
            {
                for(int i:node.out)
                {
                    if(!f.tempMap.containsKey(i))
                    {
                        TempVar t = new TempVar();
                        t.id = i;
                        t.startLine = itr;
                        f.tempMap.put(i, t);
                    }
                }

                for(int i:node.def)//unused vars
                {
                    if(!f.tempMap.containsKey(i))
                    {
                        TempVar t = new TempVar();
                        t.id = i;
                        t.startLine = itr;
                        t.endLine = itr;
                        f.tempMap.put(i, t);
                    }  
                    else 
                    {
                        TempVar t = f.tempMap.get(i);
                        t.endLine = itr;
                    }        
                }

                for(int i:node.in)
                {
                    if(f.tempMap.containsKey(i))
                    {
                        TempVar t = f.tempMap.get(i);
                        t.endLine = itr;
                    }
                }
                itr++;
            }   

        }
    }
    

    TempVar removelast(PriorityQueue<TempVar> pq)
    {

        PriorityQueue<TempVar> pq2 = new PriorityQueue<TempVar>(new Comparator2());

        while(pq.size() > 1)
        {
            pq2.add(pq.poll());
        }
        TempVar t = pq.poll();
        pq.clear();
        pq.addAll(pq2);
        return t;
    }
    
    class Comparator1 implements Comparator<TempVar> {
        public int compare(TempVar t1, TempVar t2)
        {
            if(t1.startLine > t2.startLine)
						return 1;
            else if (t1.startLine < t2.startLine)
                return -1;
            else { 
                if(t1.endLine > t2.endLine)
                    return 1;
                else if(t1.endLine < t2.endLine)
                    return -1;
                else if(t1.id == t2.id)
                    return 0;
                else return -1;
            }
        }
    }
    
    class Comparator2 implements Comparator<TempVar> {
        public int compare(TempVar t1, TempVar t2)
        {
            if(t1.endLine > t2.endLine)
						return 1;
            else if (t1.endLine < t2.endLine)
                return -1;
            else { 
                if(t1.startLine < t2.startLine)
                    return 1;
                else if(t1.startLine > t2.startLine)
                    return -1;
                else if(t1.id == t2.id)
                    return 0;
                else return -1;
                
            }
        }
    }
    
    public void linearScan()
    {
        int regCount = 18;
        String[] regs = {"s0", "s1", "s2", "s3", "s4", "s5",
                        "s6", "s7", "t0", "t1", "t2", "t3",
                        "t4", "t5", "t6", "t7", "t8", "t9" };
        for(Function f:FuncTable.values())
        {
            PriorityQueue<Integer> reg_avail = new PriorityQueue<Integer>();
            PriorityQueue<TempVar> temps_used = new PriorityQueue<TempVar>(new Comparator1());
            PriorityQueue<TempVar> active = new PriorityQueue<TempVar>(new Comparator2());
            HashMap<Integer, Integer> reg_map = new HashMap<Integer, Integer>(); 
            ArrayList<Integer> spilled = new ArrayList<Integer>();
            //stores reg as int which later will be interpreted as string of regs array
            for(int i=0;i< 18;i++)
            {
                reg_avail.add(i);
            }

            for(TempVar t:f.tempMap.values())
            {
                if(!((t.id>=4) && (t.id<f.args)))
                temps_used.add(t);
            }
            
            

            while(!temps_used.isEmpty())
            {
                if(f.regMap.containsKey(temps_used.peek().id))
                {
                    temps_used.poll();
                    continue;
                }
                while(!active.isEmpty() && active.peek().endLine < temps_used.peek().startLine)
                {
                    TempVar t = active.poll();
                    reg_avail.add(reg_map.get(t.id));
                }
                if(reg_avail.size()!=0)
                {
                    int reg = reg_avail.poll();
                    TempVar t = temps_used.poll();
                    reg_map.put(t.id, reg);
                    active.add(t);
                }
                else
                {
                    TempVar t = temps_used.poll();
                    TempVar t2 = removelast(active);
                    if(t2.endLine > t.endLine)
                    {
                        reg_map.put(t.id, reg_map.get(t2.id));
                        reg_map.remove(t2.id);
                        active.add(t);
                        spilled.add(t2.id);
                    }
                    else
                    {
                        active.add(t2);
                        spilled.add(t.id);
                    }
                }
            }
            
            for(Map.Entry<Integer, Integer> e : reg_map.entrySet()) {
				int temp = e.getKey();
				int reg = e.getValue();
				f.regMap.put(temp, regs[reg]);
                // System.out.println("temp: "+temp+" reg: "+regs[reg]);
                
			}
            // System.out.println("___");
            int stackPos = 0;
            for(int j=4;j<f.args;j++)
            {
                f.spilledMap.put(j, stackPos);
                stackPos++;
            }
            for(int i:spilled)
            {
                f.spilledMap.put(i, stackPos);
                // System.out.println("temp: "+i+" stackPos: "+stackPos);
                stackPos++;
            }
            f.stackPointer = stackPos;
            f.maxStackSpace+=stackPos;
        }
    }

    public test(Node n)
    {
        lineCount = 0;
        FuncTable = new HashMap<String, Function>();

        n.accept(new GJDepthFirst(), null);
        fill_in_out();
        find_start_end();
        linearScan();
        //debug
        // System.err.println("FuncTable");
        // for (Map.Entry<String, Function> entry : FuncTable.entrySet()) {
        //    System.err.println(entry.getKey());
        //    Function f = entry.getValue();
        //    System.err.println(f.args);
        //    System.err.println(f.maxArgs);
        //    System.err.println("Nodes:");
        //    int it=0;
        //    for (StmtNode nd: f.nodes) {
        //     System.err.println(it+" DEF"+nd.def + " USE" + nd.use + " SUCC"  + nd.succ + " \nIN" + nd.in + " OUT" + nd.out);
        //     it++;
        //    }
        // }
        // System.err.println("TempMap");
        // for (Map.Entry<String, Function> entry : FuncTable.entrySet()) {
        //    System.err.println(entry.getKey());
        //    Function f = entry.getValue();
        //    for (Map.Entry<Integer, TempVar> entry2 : f.tempMap.entrySet()) {
        //        TempVar t = entry2.getValue();
        //        System.err.println("id: "+t.id + " start: " + t.startLine + " end: " + t.endLine + " reg: " + f.regMap.get(t.id));
        //    }
        // }
        
        
        n.accept(new GJDepthFirst2(), null);
    }
}


