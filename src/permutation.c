#include <gsl/gsl_permutation.h>
#include <gsl/gsl_errno.h>
#include <stdio.h>

int mgsl_permutation_fwrite(const char *filename, const gsl_permutation *p)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_permutation_fwrite(fp, p) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_permutation_fread(const char *filename, gsl_permutation *p)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_permutation_fread(fp, p) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_permutation_fprintf(const char *filename, const gsl_permutation *p, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_permutation_fprintf(fp, p, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_permutation_fscanf(const char *filename, gsl_permutation *p)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_permutation_fscanf(fp, p) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}
