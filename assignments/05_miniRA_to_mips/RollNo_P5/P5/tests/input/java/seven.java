class seven{
    public static void main(String[] args){
        System.out.println(new huh().lol(1,2,3,4,5,6,7));
    }
}

class huh{
    public int lol(int a, int b, int c, int d, int e, int f, int g)
    {
        int ans;

        if(a!=7)
        {
            ans = (this.lol(b,c,d,e,f,g,a));
        }
        else
        {
            ans = (b+(c+d));
        }
        return ans;
    }

}