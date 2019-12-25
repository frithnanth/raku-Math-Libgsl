#include <gsl/gsl_complex.h>
#include <gsl/gsl_complex_math.h>
#include <stdlib.h>

/* Representation */
gsl_complex *alloc_gsl_complex(void)
{
  gsl_complex *c = malloc(sizeof(gsl_complex));
  return c;
}

void free_gsl_complex(gsl_complex *c)
{
  free(c);
}

void mgsl_complex_rect(double x, double y, gsl_complex *res)
{
  gsl_complex ret = gsl_complex_rect(x, y);
  *res = ret;
}

void mgsl_complex_polar(double r, double theta, gsl_complex *res)
{
  gsl_complex ret = gsl_complex_polar(r, theta);
  *res = ret;
}

/* Properties */
double mgsl_complex_arg(gsl_complex *c)
{
  return gsl_complex_arg(*c);
}

double mgsl_complex_abs(gsl_complex *c)
{
  return gsl_complex_abs(*c);
}

double mgsl_complex_abs2(gsl_complex *c)
{
  return gsl_complex_abs2(*c);
}

double mgsl_complex_logabs(gsl_complex *c)
{
  return gsl_complex_logabs(*c);
}

/* Arithmetic operators */

void mgsl_complex_add(gsl_complex *a, gsl_complex *b, gsl_complex *res)
{
  *res = gsl_complex_add(*a, *b);
}

void mgsl_complex_sub(gsl_complex *a, gsl_complex *b, gsl_complex *res)
{
  *res = gsl_complex_sub(*a, *b);
}

void mgsl_complex_mul(gsl_complex *a, gsl_complex *b, gsl_complex *res)
{
  *res = gsl_complex_mul(*a, *b);
}

void mgsl_complex_div(gsl_complex *a, gsl_complex *b, gsl_complex *res)
{
  *res = gsl_complex_div(*a, *b);
}

void mgsl_complex_add_real(gsl_complex *a, double x, gsl_complex *res)
{
  *res = gsl_complex_add_real(*a, x);
}

void mgsl_complex_sub_real(gsl_complex *a, double x, gsl_complex *res)
{
  *res = gsl_complex_sub_real(*a, x);
}

void mgsl_complex_mul_real(gsl_complex *a, double x, gsl_complex *res)
{
  *res = gsl_complex_mul_real(*a, x);
}

void mgsl_complex_div_real(gsl_complex *a, double x, gsl_complex *res)
{
  *res = gsl_complex_div_real(*a, x);
}

void mgsl_complex_add_imag(gsl_complex *a, double y, gsl_complex *res)
{
  *res = gsl_complex_add_imag(*a, y);
}

void mgsl_complex_sub_imag(gsl_complex *a, double y, gsl_complex *res)
{
  *res = gsl_complex_sub_imag(*a, y);
}

void mgsl_complex_mul_imag(gsl_complex *a, double y, gsl_complex *res)
{
  *res = gsl_complex_mul_imag(*a, y);
}

void mgsl_complex_div_imag(gsl_complex *a, double y, gsl_complex *res)
{
  *res = gsl_complex_div_imag(*a, y);
}

void mgsl_complex_conjugate(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_conjugate(*z);
}

void mgsl_complex_inverse(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_inverse(*z);
}

void mgsl_complex_negative(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_negative(*z);
}

/* Elementary Complex Functions */
void mgsl_complex_sqrt(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_sqrt(*z);
}

void mgsl_complex_sqrt_real(double x, gsl_complex *res)
{
  *res = gsl_complex_sqrt_real(x);
}

void mgsl_complex_pow(gsl_complex *z, gsl_complex *a, gsl_complex *res)
{
  *res = gsl_complex_pow(*z, *a);
}

void mgsl_complex_pow_real(gsl_complex *z, double x, gsl_complex *res)
{
  *res = gsl_complex_pow_real(*z, x);
}

void mgsl_complex_exp(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_exp(*z);
}

void mgsl_complex_log(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_log(*z);
}

void mgsl_complex_log10(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_log10(*z);
}

void mgsl_complex_log_b(gsl_complex *z, gsl_complex *b, gsl_complex *res)
{
  *res = gsl_complex_log_b(*z, *b);
}

/* Complex Trigonometric Functions */
void mgsl_complex_sin(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_sin(*z);
}

void mgsl_complex_cos(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_cos(*z);
}

void mgsl_complex_tan(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_tan(*z);
}

void mgsl_complex_sec(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_sec(*z);
}

void mgsl_complex_csc(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_csc(*z);
}

void mgsl_complex_cot(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_cot(*z);
}

/* Inverse Complex Trigonometric Functions */
void mgsl_complex_arcsin(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_arcsin(*z);
}

void mgsl_complex_arcsin_real(double z, gsl_complex *res)
{
  *res = gsl_complex_arcsin_real(z);
}

void mgsl_complex_arccos(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_arccos(*z);
}

void mgsl_complex_arccos_real(double z, gsl_complex *res)
{
  *res = gsl_complex_arccos_real(z);
}

void mgsl_complex_arctan(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_arctan(*z);
}

void mgsl_complex_arcsec(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_arcsec(*z);
}

void mgsl_complex_arcsec_real(double z, gsl_complex *res)
{
  *res = gsl_complex_arcsec_real(z);
}

void mgsl_complex_arccsc(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_arccsc(*z);
}

void mgsl_complex_arccsc_real(double z, gsl_complex *res)
{
  *res = gsl_complex_arccsc_real(z);
}

void mgsl_complex_arccot(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_arccot(*z);
}

/* Complex Hyperbolic Functions */
void mgsl_complex_sinh(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_sinh(*z);
}

void mgsl_complex_cosh(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_cosh(*z);
}

void mgsl_complex_tanh(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_tanh(*z);
}

void mgsl_complex_sech(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_sech(*z);
}

void mgsl_complex_csch(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_csch(*z);
}

void mgsl_complex_coth(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_coth(*z);
}

/* Inverse Complex Hyperbolic Functions */
void mgsl_complex_arcsinh(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_arcsinh(*z);
}

void mgsl_complex_arccosh(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_arccosh(*z);
}

void mgsl_complex_arccosh_real(double z, gsl_complex *res)
{
  *res = gsl_complex_arccosh_real(z);
}

void mgsl_complex_arctanh(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_arctanh(*z);
}

void mgsl_complex_arctanh_real(double z, gsl_complex *res)
{
  *res = gsl_complex_arctanh_real(z);
}

void mgsl_complex_arcsech(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_arcsech(*z);
}

void mgsl_complex_arccsch(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_arccsch(*z);
}

void mgsl_complex_arccoth(gsl_complex *z, gsl_complex *res)
{
  *res = gsl_complex_arccoth(*z);
}
