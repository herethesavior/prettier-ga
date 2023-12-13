public with sharing class NcssMethodCount {
    public void main(Integer x) {
        test.method1(); //2
        //not counted
        method2(); //3
        method3(); //4
        //not counted
        //not counted
        x++; //not counted
        method4(); //5
        method5(); //6
        method6(); //7
        //not counted
        method7(); //8
        method8(); //9
        method9(); //10
        //not counted
        method10(); //11
        method11(); //12
        method12(); //13
        method13(); //14
        method14(); //15
        method15(); //16
        method16(); //17
        method17(); //18
        //not counted
        method18(); //19
        method19(); //20
        method20(); //21
        super.method21(); //22
        super.method22(); //23
        super.method23(); //24
        super.method24(); //25
        super.method25(); //26
        super.method26(); //27
        super.method27(); //28
        super.method28(); //29

        super.method29(); //30
        super.method30(); //31
        super.method31(); //32

        method32(); //33
        method33(); //34
        method34(); //35
        method35(); //36
        method36(); //37
        method37(); //38
        method38(); //39
        method39(); //40
        method40(); //41
        return 1; //42
    }
}
