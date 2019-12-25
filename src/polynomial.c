#include <gsl/gsl_complex.h>
#include <gsl/gsl_complex_math.h>
#include <gsl/gsl_poly.h>

void mgsl_poly_complex_eval(const double c[], const int len, const gsl_complex *z, gsl_complex *ret)
{
  *ret = gsl_poly_complex_eval(c, len, *z);
}

void mgsl_complex_poly_complex_eval(gsl_complex **c, const int len, const gsl_complex *z, gsl_complex *ret)
{
  gsl_complex zc[len];
  int i;
  for(i=0; i<len; i++) zc[i] = *c[i];
  *ret = gsl_complex_poly_complex_eval(zc, len, *z);
}
