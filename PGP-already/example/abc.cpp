#include "abc.h"
double add(int x)
{
    ZZ a;
    ZZX f;
    a=x*5;
    //cout<<a;
    return 2*x;
   // mpz_t t;
   //mpz_init(t);
    /*  mpz_ui_pow_ui(t,2,100);*/
    //gmp_printf("%d",t);
    Vec< Pair< ZZX, long > > factors;
    ZZ c;
    factor(c, factors, f);

}
QString pkword()
{

    return "我成功了";
}
