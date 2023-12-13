public with sharing class NcssConstructorCount {
    //1
    public NcssConstructorCount(Integer x) {
        super(); //not counted
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
        return 1; //22
    }
}
