#include <stdio.h>
#include <stdlib.h>
#include <gsl/gsl_block.h>
#include <gsl/gsl_vector.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_errno.h>

/* Block IO */
int mgsl_block_fwrite(const char *filename, const gsl_block *b)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_fwrite(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_fread(const char *filename, gsl_block *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_fread(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_fprintf(const char *filename, const gsl_block *b, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_fprintf(fp, b, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_fscanf(const char *filename, gsl_block *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_fscanf(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_float_fwrite(const char *filename, const gsl_block_float *b)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_float_fwrite(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_float_fread(const char *filename, gsl_block_float *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_float_fread(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_float_fprintf(const char *filename, const gsl_block_float *b, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_float_fprintf(fp, b, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_float_fscanf(const char *filename, gsl_block_float *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_float_fscanf(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_int_fwrite(const char *filename, const gsl_block_int *b)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_int_fwrite(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_int_fread(const char *filename, gsl_block_int *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_int_fread(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_int_fprintf(const char *filename, const gsl_block_int *b, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_int_fprintf(fp, b, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_int_fscanf(const char *filename, gsl_block_int *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_int_fscanf(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_uint_fwrite(const char *filename, const gsl_block_uint *b)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_uint_fwrite(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_uint_fread(const char *filename, gsl_block_uint *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_uint_fread(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_uint_fprintf(const char *filename, const gsl_block_uint *b, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_uint_fprintf(fp, b, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_uint_fscanf(const char *filename, gsl_block_uint *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_uint_fscanf(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_long_fwrite(const char *filename, const gsl_block_long *b)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_long_fwrite(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_long_fread(const char *filename, gsl_block_long *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_long_fread(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_long_fprintf(const char *filename, const gsl_block_long *b, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_long_fprintf(fp, b, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_long_fscanf(const char *filename, gsl_block_long *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_long_fscanf(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_ulong_fwrite(const char *filename, const gsl_block_ulong *b)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_ulong_fwrite(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_ulong_fread(const char *filename, gsl_block_ulong *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_ulong_fread(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_ulong_fprintf(const char *filename, const gsl_block_ulong *b, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_ulong_fprintf(fp, b, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_ulong_fscanf(const char *filename, gsl_block_ulong *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_ulong_fscanf(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_short_fwrite(const char *filename, const gsl_block_short *b)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_short_fwrite(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_short_fread(const char *filename, gsl_block_short *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_short_fread(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_short_fprintf(const char *filename, const gsl_block_short *b, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_short_fprintf(fp, b, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_short_fscanf(const char *filename, gsl_block_short *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_short_fscanf(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_ushort_fwrite(const char *filename, const gsl_block_ushort *b)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_ushort_fwrite(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_ushort_fread(const char *filename, gsl_block_ushort *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_ushort_fread(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_ushort_fprintf(const char *filename, const gsl_block_ushort *b, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_ushort_fprintf(fp, b, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_ushort_fscanf(const char *filename, gsl_block_ushort *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_ushort_fscanf(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_char_fwrite(const char *filename, const gsl_block_char *b)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_char_fwrite(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_char_fread(const char *filename, gsl_block_char *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_char_fread(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_char_fprintf(const char *filename, const gsl_block_char *b, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_char_fprintf(fp, b, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_char_fscanf(const char *filename, gsl_block_char *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_char_fscanf(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_uchar_fwrite(const char *filename, const gsl_block_uchar *b)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_uchar_fwrite(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_uchar_fread(const char *filename, gsl_block_uchar *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_uchar_fread(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_uchar_fprintf(const char *filename, const gsl_block_uchar *b, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_uchar_fprintf(fp, b, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_uchar_fscanf(const char *filename, gsl_block_uchar *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_uchar_fscanf(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_complex_fwrite(const char *filename, const gsl_block_complex *b)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_complex_fwrite(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_complex_fread(const char *filename, gsl_block_complex *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_complex_fread(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_complex_fprintf(const char *filename, const gsl_block_complex *b, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_complex_fprintf(fp, b, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_complex_fscanf(const char *filename, gsl_block_complex *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_complex_fscanf(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_complex_float_fwrite(const char *filename, const gsl_block_complex_float *b)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_complex_float_fwrite(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_complex_float_fread(const char *filename, gsl_block_complex_float *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_complex_float_fread(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_complex_float_fprintf(const char *filename, const gsl_block_complex_float *b, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_block_complex_float_fprintf(fp, b, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_block_complex_float_fscanf(const char *filename, gsl_block_complex_float *b)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_block_complex_float_fscanf(fp, b) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

/* Vector IO */
int mgsl_vector_fwrite(const char *filename, const gsl_vector *v)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_fwrite(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_fread(const char *filename, gsl_vector *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_fread(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_fprintf(const char *filename, const gsl_vector *v, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_fprintf(fp, v, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_fscanf(const char *filename, gsl_vector *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_fscanf(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_float_fwrite(const char *filename, const gsl_vector_float *v)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_float_fwrite(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_float_fread(const char *filename, gsl_vector_float *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_float_fread(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_float_fprintf(const char *filename, const gsl_vector_float *v, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_float_fprintf(fp, v, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_float_fscanf(const char *filename, gsl_vector_float *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_float_fscanf(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_int_fwrite(const char *filename, const gsl_vector_int *v)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_int_fwrite(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_int_fread(const char *filename, gsl_vector_int *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_int_fread(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_int_fprintf(const char *filename, const gsl_vector_int *v, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_int_fprintf(fp, v, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_int_fscanf(const char *filename, gsl_vector_int *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_int_fscanf(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_uint_fwrite(const char *filename, const gsl_vector_uint *v)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_uint_fwrite(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_uint_fread(const char *filename, gsl_vector_uint *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_uint_fread(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_uint_fprintf(const char *filename, const gsl_vector_uint *v, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_uint_fprintf(fp, v, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_uint_fscanf(const char *filename, gsl_vector_uint *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_uint_fscanf(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_long_fwrite(const char *filename, const gsl_vector_long *v)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_long_fwrite(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_long_fread(const char *filename, gsl_vector_long *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_long_fread(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_long_fprintf(const char *filename, const gsl_vector_long *v, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_long_fprintf(fp, v, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_long_fscanf(const char *filename, gsl_vector_long *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_long_fscanf(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_ulong_fwrite(const char *filename, const gsl_vector_ulong *v)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_ulong_fwrite(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_ulong_fread(const char *filename, gsl_vector_ulong *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_ulong_fread(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_ulong_fprintf(const char *filename, const gsl_vector_ulong *v, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_ulong_fprintf(fp, v, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_ulong_fscanf(const char *filename, gsl_vector_ulong *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_ulong_fscanf(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_short_fwrite(const char *filename, const gsl_vector_short *v)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_short_fwrite(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_short_fread(const char *filename, gsl_vector_short *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_short_fread(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_short_fprintf(const char *filename, const gsl_vector_short *v, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_short_fprintf(fp, v, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_short_fscanf(const char *filename, gsl_vector_short *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_short_fscanf(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_ushort_fwrite(const char *filename, const gsl_vector_ushort *v)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_ushort_fwrite(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_ushort_fread(const char *filename, gsl_vector_ushort *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_ushort_fread(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_ushort_fprintf(const char *filename, const gsl_vector_ushort *v, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_ushort_fprintf(fp, v, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_ushort_fscanf(const char *filename, gsl_vector_ushort *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_ushort_fscanf(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_char_fwrite(const char *filename, const gsl_vector_char *v)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_char_fwrite(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_char_fread(const char *filename, gsl_vector_char *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_char_fread(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_char_fprintf(const char *filename, const gsl_vector_char *v, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_char_fprintf(fp, v, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_char_fscanf(const char *filename, gsl_vector_char *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_char_fscanf(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_uchar_fwrite(const char *filename, const gsl_vector_uchar *v)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_uchar_fwrite(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_uchar_fread(const char *filename, gsl_vector_uchar *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_uchar_fread(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_uchar_fprintf(const char *filename, const gsl_vector_uchar *v, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_uchar_fprintf(fp, v, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_uchar_fscanf(const char *filename, gsl_vector_uchar *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_uchar_fscanf(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_complex_fwrite(const char *filename, const gsl_vector_complex *v)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_complex_fwrite(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_complex_fread(const char *filename, gsl_vector_complex *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_complex_fread(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_complex_fprintf(const char *filename, const gsl_vector_complex *v, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_complex_fprintf(fp, v, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_complex_fscanf(const char *filename, gsl_vector_complex *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_complex_fscanf(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_complex_float_fwrite(const char *filename, const gsl_vector_complex_float *v)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_complex_float_fwrite(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_complex_float_fread(const char *filename, gsl_vector_complex_float *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_complex_float_fread(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_complex_float_fprintf(const char *filename, const gsl_vector_complex_float *v, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_vector_complex_float_fprintf(fp, v, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_vector_complex_float_fscanf(const char *filename, gsl_vector_complex_float *v)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_vector_complex_float_fscanf(fp, v) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

/* Vector view */
gsl_vector_view *alloc_gsl_vector_view(void)
{
  gsl_vector_view *c = calloc(1, sizeof(gsl_vector_view));
  return c;
}

void free_gsl_vector_view(gsl_vector_view *c)
{
  if(c != NULL){
    free(c);
    c = NULL;
  }
}

gsl_vector *mgsl_vector_subvector(gsl_vector_view *view, gsl_vector *v, size_t offset, size_t n)
{
  *view = gsl_vector_subvector(v, offset, n);
  return &view->vector;
}

gsl_vector *mgsl_vector_subvector_with_stride(gsl_vector_view *view, gsl_vector *v, size_t offset, size_t stride, size_t n)
{
  *view = gsl_vector_subvector_with_stride(v, offset, stride, n);
  return &view->vector;
}

gsl_vector *mgsl_vector_complex_real(gsl_vector_view *view, gsl_vector_complex *v)
{
  *view = gsl_vector_complex_real(v);
  return &view->vector;
}

gsl_vector *mgsl_vector_complex_imag(gsl_vector_view *view, gsl_vector_complex *v)
{
  *view = gsl_vector_complex_imag(v);
  return &view->vector;
}

gsl_vector_float *mgsl_vector_complex_float_real(gsl_vector_float_view *view, gsl_vector_complex_float *v)
{
  *view = gsl_vector_complex_float_real(v);
  return &view->vector;
}

gsl_vector_float *mgsl_vector_complex_float_imag(gsl_vector_float_view *view, gsl_vector_complex_float *v)
{
  *view = gsl_vector_complex_float_imag(v);
  return &view->vector;
}

gsl_vector *mgsl_vector_view_array(gsl_vector_view *view, double *base, size_t n)
{
  *view = gsl_vector_view_array(base, n);
  return &view->vector;
}

gsl_vector *mgsl_vector_view_array_with_stride(gsl_vector_view *view, double *base, size_t stride, size_t n)
{
  *view = gsl_vector_view_array_with_stride(base, stride, n);
  return &view->vector;
}

gsl_vector_float_view *alloc_gsl_vector_float_view(void)
{
  gsl_vector_float_view *c = calloc(1, sizeof(gsl_vector_float_view));
  return c;
}

void free_gsl_vector_float_view(gsl_vector_float_view *c)
{
  if(c != NULL){
    free(c);
    c = NULL;
  }
}

gsl_vector_float *mgsl_vector_float_subvector(gsl_vector_float_view *view, gsl_vector_float *v, size_t offset, size_t n)
{
  *view = gsl_vector_float_subvector(v, offset, n);
  return &view->vector;
}

gsl_vector_float *mgsl_vector_float_subvector_with_stride(gsl_vector_float_view *view, gsl_vector_float *v, size_t offset, size_t stride, size_t n)
{
  *view = gsl_vector_float_subvector_with_stride(v, offset, stride, n);
  return &view->vector;
}

gsl_vector_float *mgsl_vector_float_view_array(gsl_vector_float_view *view, float *base, size_t n)
{
  *view = gsl_vector_float_view_array(base, n);
  return &view->vector;
}

gsl_vector_float *mgsl_vector_float_view_array_with_stride(gsl_vector_float_view *view, float *base, size_t stride, size_t n)
{
  *view = gsl_vector_float_view_array_with_stride(base, stride, n);
  return &view->vector;
}

gsl_vector_int_view *alloc_gsl_vector_int_view(void)
{
  gsl_vector_int_view *c = calloc(1, sizeof(gsl_vector_int_view));
  return c;
}

void free_gsl_vector_int_view(gsl_vector_int_view *c)
{
  if(c != NULL){
    free(c);
    c = NULL;
  }
}

gsl_vector_int *mgsl_vector_int_subvector(gsl_vector_int_view *view, gsl_vector_int *v, size_t offset, size_t n)
{
  *view = gsl_vector_int_subvector(v, offset, n);
  return &view->vector;
}

gsl_vector_int *mgsl_vector_int_subvector_with_stride(gsl_vector_int_view *view, gsl_vector_int *v, size_t offset, size_t stride, size_t n)
{
  *view = gsl_vector_int_subvector_with_stride(v, offset, stride, n);
  return &view->vector;
}

gsl_vector_int *mgsl_vector_int_view_array(gsl_vector_int_view *view, int *base, size_t n)
{
  *view = gsl_vector_int_view_array(base, n);
  return &view->vector;
}

gsl_vector_int *mgsl_vector_int_view_array_with_stride(gsl_vector_int_view *view, int *base, size_t stride, size_t n)
{
  *view = gsl_vector_int_view_array_with_stride(base, stride, n);
  return &view->vector;
}

gsl_vector_uint_view *alloc_gsl_vector_uint_view(void)
{
  gsl_vector_uint_view *c = calloc(1, sizeof(gsl_vector_uint_view));
  return c;
}

void free_gsl_vector_uint_view(gsl_vector_uint_view *c)
{
  if(c != NULL){
    free(c);
    c = NULL;
  }
}

gsl_vector_uint *mgsl_vector_uint_subvector(gsl_vector_uint_view *view, gsl_vector_uint *v, size_t offset, size_t n)
{
  *view = gsl_vector_uint_subvector(v, offset, n);
  return &view->vector;
}

gsl_vector_uint *mgsl_vector_uint_subvector_with_stride(gsl_vector_uint_view *view, gsl_vector_uint *v, size_t offset, size_t stride, size_t n)
{
  *view = gsl_vector_uint_subvector_with_stride(v, offset, stride, n);
  return &view->vector;
}

gsl_vector_uint *mgsl_vector_uint_view_array(gsl_vector_uint_view *view, unsigned int *base, size_t n)
{
  *view = gsl_vector_uint_view_array(base, n);
  return &view->vector;
}

gsl_vector_uint *mgsl_vector_uint_view_array_with_stride(gsl_vector_uint_view *view, unsigned int *base, size_t stride, size_t n)
{
  *view = gsl_vector_uint_view_array_with_stride(base, stride, n);
  return &view->vector;
}

gsl_vector_long_view *alloc_gsl_vector_long_view(void)
{
  gsl_vector_long_view *c = calloc(1, sizeof(gsl_vector_long_view));
  return c;
}

void free_gsl_vector_long_view(gsl_vector_long_view *c)
{
  if(c != NULL){
    free(c);
    c = NULL;
  }
}

gsl_vector_long *mgsl_vector_long_subvector(gsl_vector_long_view *view, gsl_vector_long *v, size_t offset, size_t n)
{
  *view = gsl_vector_long_subvector(v, offset, n);
  return &view->vector;
}

gsl_vector_long *mgsl_vector_long_subvector_with_stride(gsl_vector_long_view *view, gsl_vector_long *v, size_t offset, size_t stride, size_t n)
{
  *view = gsl_vector_long_subvector_with_stride(v, offset, stride, n);
  return &view->vector;
}

gsl_vector_long *mgsl_vector_long_view_array(gsl_vector_long_view *view, long *base, size_t n)
{
  *view = gsl_vector_long_view_array(base, n);
  return &view->vector;
}

gsl_vector_long *mgsl_vector_long_view_array_with_stride(gsl_vector_long_view *view, long *base, size_t stride, size_t n)
{
  *view = gsl_vector_long_view_array_with_stride(base, stride, n);
  return &view->vector;
}

gsl_vector_ulong_view *alloc_gsl_vector_ulong_view(void)
{
  gsl_vector_ulong_view *c = calloc(1, sizeof(gsl_vector_ulong_view));
  return c;
}

void free_gsl_vector_ulong_view(gsl_vector_ulong_view *c)
{
  if(c != NULL){
    free(c);
    c = NULL;
  }
}

gsl_vector_ulong *mgsl_vector_ulong_subvector(gsl_vector_ulong_view *view, gsl_vector_ulong *v, size_t offset, size_t n)
{
  *view = gsl_vector_ulong_subvector(v, offset, n);
  return &view->vector;
}

gsl_vector_ulong *mgsl_vector_ulong_subvector_with_stride(gsl_vector_ulong_view *view, gsl_vector_ulong *v, size_t offset, size_t stride, size_t n)
{
  *view = gsl_vector_ulong_subvector_with_stride(v, offset, stride, n);
  return &view->vector;
}

gsl_vector_ulong *mgsl_vector_ulong_view_array(gsl_vector_ulong_view *view, unsigned long *base, size_t n)
{
  *view = gsl_vector_ulong_view_array(base, n);
  return &view->vector;
}

gsl_vector_ulong *mgsl_vector_ulong_view_array_with_stride(gsl_vector_ulong_view *view, unsigned long *base, size_t stride, size_t n)
{
  *view = gsl_vector_ulong_view_array_with_stride(base, stride, n);
  return &view->vector;
}

gsl_vector_short_view *alloc_gsl_vector_short_view(void)
{
  gsl_vector_short_view *c = calloc(1, sizeof(gsl_vector_short_view));
  return c;
}

void free_gsl_vector_short_view(gsl_vector_short_view *c)
{
  if(c != NULL){
    free(c);
    c = NULL;
  }
}

gsl_vector_short *mgsl_vector_short_subvector(gsl_vector_short_view *view, gsl_vector_short *v, size_t offset, size_t n)
{
  *view = gsl_vector_short_subvector(v, offset, n);
  return &view->vector;
}

gsl_vector_short *mgsl_vector_short_subvector_with_stride(gsl_vector_short_view *view, gsl_vector_short *v, size_t offset, size_t stride, size_t n)
{
  *view = gsl_vector_short_subvector_with_stride(v, offset, stride, n);
  return &view->vector;
}

gsl_vector_short *mgsl_vector_short_view_array(gsl_vector_short_view *view, short *base, size_t n)
{
  *view = gsl_vector_short_view_array(base, n);
  return &view->vector;
}

gsl_vector_short *mgsl_vector_short_view_array_with_stride(gsl_vector_short_view *view, short *base, size_t stride, size_t n)
{
  *view = gsl_vector_short_view_array_with_stride(base, stride, n);
  return &view->vector;
}

gsl_vector_ushort_view *alloc_gsl_vector_ushort_view(void)
{
  gsl_vector_ushort_view *c = calloc(1, sizeof(gsl_vector_ushort_view));
  return c;
}

void free_gsl_vector_ushort_view(gsl_vector_ushort_view *c)
{
  if(c != NULL){
    free(c);
    c = NULL;
  }
}

gsl_vector_ushort *mgsl_vector_ushort_subvector(gsl_vector_ushort_view *view, gsl_vector_ushort *v, size_t offset, size_t n)
{
  *view = gsl_vector_ushort_subvector(v, offset, n);
  return &view->vector;
}

gsl_vector_ushort *mgsl_vector_ushort_subvector_with_stride(gsl_vector_ushort_view *view, gsl_vector_ushort *v, size_t offset, size_t stride, size_t n)
{
  *view = gsl_vector_ushort_subvector_with_stride(v, offset, stride, n);
  return &view->vector;
}

gsl_vector_ushort *mgsl_vector_ushort_view_array(gsl_vector_ushort_view *view, unsigned short *base, size_t n)
{
  *view = gsl_vector_ushort_view_array(base, n);
  return &view->vector;
}

gsl_vector_ushort *mgsl_vector_ushort_view_array_with_stride(gsl_vector_ushort_view *view, unsigned short *base, size_t stride, size_t n)
{
  *view = gsl_vector_ushort_view_array_with_stride(base, stride, n);
  return &view->vector;
}

gsl_vector_char_view *alloc_gsl_vector_char_view(void)
{
  gsl_vector_char_view *c = calloc(1, sizeof(gsl_vector_char_view));
  return c;
}

void free_gsl_vector_char_view(gsl_vector_char_view *c)
{
  if(c != NULL){
    free(c);
    c = NULL;
  }
}

gsl_vector_char *mgsl_vector_char_subvector(gsl_vector_char_view *view, gsl_vector_char *v, size_t offset, size_t n)
{
  *view = gsl_vector_char_subvector(v, offset, n);
  return &view->vector;
}

gsl_vector_char *mgsl_vector_char_subvector_with_stride(gsl_vector_char_view *view, gsl_vector_char *v, size_t offset, size_t stride, size_t n)
{
  *view = gsl_vector_char_subvector_with_stride(v, offset, stride, n);
  return &view->vector;
}

gsl_vector_char *mgsl_vector_char_view_array(gsl_vector_char_view *view, char *base, size_t n)
{
  *view = gsl_vector_char_view_array(base, n);
  return &view->vector;
}

gsl_vector_char *mgsl_vector_char_view_array_with_stride(gsl_vector_char_view *view, char *base, size_t stride, size_t n)
{
  *view = gsl_vector_char_view_array_with_stride(base, stride, n);
  return &view->vector;
}

gsl_vector_uchar_view *alloc_gsl_vector_uchar_view(void)
{
  gsl_vector_uchar_view *c = calloc(1, sizeof(gsl_vector_uchar_view));
  return c;
}

void free_gsl_vector_uchar_view(gsl_vector_uchar_view *c)
{
  if(c != NULL){
    free(c);
    c = NULL;
  }
}

gsl_vector_uchar *mgsl_vector_uchar_subvector(gsl_vector_uchar_view *view, gsl_vector_uchar *v, size_t offset, size_t n)
{
  *view = gsl_vector_uchar_subvector(v, offset, n);
  return &view->vector;
}

gsl_vector_uchar *mgsl_vector_uchar_subvector_with_stride(gsl_vector_uchar_view *view, gsl_vector_uchar *v, size_t offset, size_t stride, size_t n)
{
  *view = gsl_vector_uchar_subvector_with_stride(v, offset, stride, n);
  return &view->vector;
}

gsl_vector_uchar *mgsl_vector_uchar_view_array(gsl_vector_uchar_view *view, unsigned char *base, size_t n)
{
  *view = gsl_vector_uchar_view_array(base, n);
  return &view->vector;
}

gsl_vector_uchar *mgsl_vector_uchar_view_array_with_stride(gsl_vector_uchar_view *view, unsigned char *base, size_t stride, size_t n)
{
  *view = gsl_vector_uchar_view_array_with_stride(base, stride, n);
  return &view->vector;
}

gsl_vector_complex_view *alloc_gsl_vector_complex_view(void)
{
  gsl_vector_complex_view *c = calloc(1, sizeof(gsl_vector_complex_view));
  return c;
}

void free_gsl_vector_complex_view(gsl_vector_complex_view *c)
{
  if(c != NULL){
    free(c);
    c = NULL;
  }
}

gsl_vector_complex *mgsl_vector_complex_subvector(gsl_vector_complex_view *view, gsl_vector_complex *v, size_t offset, size_t n)
{
  *view = gsl_vector_complex_subvector(v, offset, n);
  return &view->vector;
}

gsl_vector_complex *mgsl_vector_complex_subvector_with_stride(gsl_vector_complex_view *view, gsl_vector_complex *v, size_t offset, size_t stride, size_t n)
{
  *view = gsl_vector_complex_subvector_with_stride(v, offset, stride, n);
  return &view->vector;
}

gsl_vector_complex *mgsl_vector_complex_view_array(gsl_vector_complex_view *view, double *base, size_t n)
{
  *view = gsl_vector_complex_view_array(base, n);
  return &view->vector;
}

gsl_vector_complex *mgsl_vector_complex_view_array_with_stride(gsl_vector_complex_view *view, double *base, size_t stride, size_t n)
{
  *view = gsl_vector_complex_view_array_with_stride(base, stride, n);
  return &view->vector;
}

gsl_vector_complex_float_view *alloc_gsl_vector_complex_float_view(void)
{
  gsl_vector_complex_float_view *c = calloc(1, sizeof(gsl_vector_complex_float_view));
  return c;
}

void free_gsl_vector_complex_float_view(gsl_vector_complex_float_view *c)
{
  if(c != NULL){
    free(c);
    c = NULL;
  }
}

gsl_vector_complex_float *mgsl_vector_complex_float_subvector(gsl_vector_complex_float_view *view, gsl_vector_complex_float *v, size_t offset, size_t n)
{
  *view = gsl_vector_complex_float_subvector(v, offset, n);
  return &view->vector;
}

gsl_vector_complex_float *mgsl_vector_complex_float_subvector_with_stride(gsl_vector_complex_float_view *view, gsl_vector_complex_float *v, size_t offset, size_t stride, size_t n)
{
  *view = gsl_vector_complex_float_subvector_with_stride(v, offset, stride, n);
  return &view->vector;
}

gsl_vector_complex_float *mgsl_vector_complex_float_view_array(gsl_vector_complex_float_view *view, float *base, size_t n)
{
  *view = gsl_vector_complex_float_view_array(base, n);
  return &view->vector;
}

gsl_vector_complex_float *mgsl_vector_complex_float_view_array_with_stride(gsl_vector_complex_float_view *view, float *base, size_t stride, size_t n)
{
  *view = gsl_vector_complex_float_view_array_with_stride(base, stride, n);
  return &view->vector;
}

/* Complex vectors */
void mgsl_vector_complex_get(gsl_vector_complex *v, size_t i, gsl_complex *res)
{
  *res = gsl_vector_complex_get(v, i);
}

void mgsl_vector_complex_set(gsl_vector_complex *v, size_t i, gsl_complex *x)
{
  gsl_vector_complex_set(v, i, *x);
}

void mgsl_vector_complex_float_get(gsl_vector_complex_float *v, size_t i, gsl_complex_float *res)
{
  *res = gsl_vector_complex_float_get(v, i);
}

void mgsl_vector_complex_float_set(gsl_vector_complex_float *v, size_t i, gsl_complex_float *x)
{
  gsl_vector_complex_float_set(v, i, *x);
}

void mgsl_vector_complex_set_all(gsl_vector_complex *v, gsl_complex *x)
{
  gsl_vector_complex_set_all(v, *x);
}

void mgsl_vector_complex_float_set_all(gsl_vector_complex_float *v, gsl_complex_float *x)
{
  gsl_vector_complex_float_set_all(v, *x);
}

int mgsl_vector_complex_scale(gsl_vector_complex *a, gsl_complex *x)
{
  return gsl_vector_complex_scale(a, *x);
}

int mgsl_vector_complex_float_scale(gsl_vector_complex_float *a, gsl_complex_float *x)
{
  return gsl_vector_complex_float_scale(a, *x);
}

int mgsl_vector_complex_add_constant(gsl_vector_complex *a, gsl_complex *x)
{
  return gsl_vector_complex_add_constant(a, *x);
}

int mgsl_vector_complex_float_add_constant(gsl_vector_complex_float *a, gsl_complex_float *x)
{
  return gsl_vector_complex_float_add_constant(a, *x);
}

/* Matrix IO */
void mgsl_matrix_complex_get(gsl_matrix_complex *v, size_t i, size_t j, gsl_complex *res)
{
  *res = gsl_matrix_complex_get(v, i, j);
}

void mgsl_matrix_complex_set(gsl_matrix_complex *v, size_t i, size_t j, gsl_complex *x)
{
  gsl_matrix_complex_set(v, i, j, *x);
}

void mgsl_matrix_complex_float_get(gsl_matrix_complex_float *v, size_t i, size_t j, gsl_complex_float *res)
{
  *res = gsl_matrix_complex_float_get(v, i, j);
}

void mgsl_matrix_complex_float_set(gsl_matrix_complex_float *v, size_t i, size_t j, gsl_complex_float *x)
{
  gsl_matrix_complex_float_set(v, i, j, *x);
}

void mgsl_matrix_complex_set_all(gsl_matrix_complex *v, gsl_complex *x)
{
  gsl_matrix_complex_set_all(v, *x);
}

void mgsl_matrix_complex_float_set_all(gsl_matrix_complex_float *v, gsl_complex_float *x)
{
  gsl_matrix_complex_float_set_all(v, *x);
}

int mgsl_matrix_fwrite(const char *filename, const gsl_matrix *m)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_fwrite(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_fread(const char *filename, gsl_matrix *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_fread(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_fprintf(const char *filename, const gsl_matrix *m, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_fprintf(fp, m, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_fscanf(const char *filename, gsl_matrix *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_fscanf(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_float_fwrite(const char *filename, const gsl_matrix_float *m)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_float_fwrite(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_float_fread(const char *filename, gsl_matrix_float *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_float_fread(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_float_fprintf(const char *filename, const gsl_matrix_float *m, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_float_fprintf(fp, m, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_float_fscanf(const char *filename, gsl_matrix_float *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_float_fscanf(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_int_fwrite(const char *filename, const gsl_matrix_int *m)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_int_fwrite(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_int_fread(const char *filename, gsl_matrix_int *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_int_fread(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_int_fprintf(const char *filename, const gsl_matrix_int *m, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_int_fprintf(fp, m, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_int_fscanf(const char *filename, gsl_matrix_int *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_int_fscanf(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_uint_fwrite(const char *filename, const gsl_matrix_uint *m)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_uint_fwrite(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_uint_fread(const char *filename, gsl_matrix_uint *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_uint_fread(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_uint_fprintf(const char *filename, const gsl_matrix_uint *m, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_uint_fprintf(fp, m, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_uint_fscanf(const char *filename, gsl_matrix_uint *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_uint_fscanf(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_long_fwrite(const char *filename, const gsl_matrix_long *m)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_long_fwrite(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_long_fread(const char *filename, gsl_matrix_long *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_long_fread(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_long_fprintf(const char *filename, const gsl_matrix_long *m, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_long_fprintf(fp, m, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_long_fscanf(const char *filename, gsl_matrix_long *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_long_fscanf(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_ulong_fwrite(const char *filename, const gsl_matrix_ulong *m)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_ulong_fwrite(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_ulong_fread(const char *filename, gsl_matrix_ulong *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_ulong_fread(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_ulong_fprintf(const char *filename, const gsl_matrix_ulong *m, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_ulong_fprintf(fp, m, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_ulong_fscanf(const char *filename, gsl_matrix_ulong *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_ulong_fscanf(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_short_fwrite(const char *filename, const gsl_matrix_short *m)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_short_fwrite(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_short_fread(const char *filename, gsl_matrix_short *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_short_fread(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_short_fprintf(const char *filename, const gsl_matrix_short *m, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_short_fprintf(fp, m, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_short_fscanf(const char *filename, gsl_matrix_short *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_short_fscanf(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_ushort_fwrite(const char *filename, const gsl_matrix_ushort *m)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_ushort_fwrite(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_ushort_fread(const char *filename, gsl_matrix_ushort *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_ushort_fread(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_ushort_fprintf(const char *filename, const gsl_matrix_ushort *m, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_ushort_fprintf(fp, m, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_ushort_fscanf(const char *filename, gsl_matrix_ushort *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_ushort_fscanf(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_char_fwrite(const char *filename, const gsl_matrix_char *m)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_char_fwrite(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_char_fread(const char *filename, gsl_matrix_char *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_char_fread(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_char_fprintf(const char *filename, const gsl_matrix_char *m, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_char_fprintf(fp, m, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_char_fscanf(const char *filename, gsl_matrix_char *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_char_fscanf(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_uchar_fwrite(const char *filename, const gsl_matrix_uchar *m)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_uchar_fwrite(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_uchar_fread(const char *filename, gsl_matrix_uchar *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_uchar_fread(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_uchar_fprintf(const char *filename, const gsl_matrix_uchar *m, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_uchar_fprintf(fp, m, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_uchar_fscanf(const char *filename, gsl_matrix_uchar *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_uchar_fscanf(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_complex_fwrite(const char *filename, const gsl_matrix_complex *m)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_complex_fwrite(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_complex_fread(const char *filename, gsl_matrix_complex *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_complex_fread(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_complex_fprintf(const char *filename, const gsl_matrix_complex *m, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_complex_fprintf(fp, m, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_complex_fscanf(const char *filename, gsl_matrix_complex *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_complex_fscanf(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_complex_float_fwrite(const char *filename, const gsl_matrix_complex_float *m)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_complex_float_fwrite(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_complex_float_fread(const char *filename, gsl_matrix_complex_float *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_complex_float_fread(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_complex_float_fprintf(const char *filename, const gsl_matrix_complex_float *m, const char *format)
{
  FILE *fp;
  if((fp = fopen(filename, "w")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_complex_float_fprintf(fp, m, format) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

int mgsl_matrix_complex_float_fscanf(const char *filename, gsl_matrix_complex_float *m)
{
  FILE *fp;
  if((fp = fopen(filename, "r")) == NULL) return GSL_EFAILED;
  if(gsl_matrix_complex_float_fscanf(fp, m) != GSL_SUCCESS) return GSL_EFAILED;
  fclose(fp);
  return GSL_SUCCESS;
}

/* Matrix view */
gsl_matrix_view *alloc_gsl_matrix_view(void)
{
  gsl_matrix_view *m = calloc(1, sizeof(gsl_matrix_view));
  return m;
}

void free_gsl_matrix_view(gsl_matrix_view *m)
{
  if(m != NULL){
    free(m);
    m = NULL;
  }
}

gsl_matrix *mgsl_matrix_submatrix(gsl_matrix_view *view, gsl_matrix *m, size_t k1, size_t k2, size_t n1, size_t n2)
{
  *view = gsl_matrix_submatrix(m, k1, k2, n1, n2);
  return &view->matrix;
}

gsl_matrix *mgsl_matrix_view_array(gsl_matrix_view *view, double *base, size_t n1, size_t n2)
{
  *view = gsl_matrix_view_array(base, n1, n2);
  return &view->matrix;
}

gsl_matrix *mgsl_matrix_view_array_with_tda(gsl_matrix_view *view, double *base, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_view_array_with_tda(base, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix *mgsl_matrix_view_vector(gsl_matrix_view *view, gsl_vector *v, size_t n1, size_t n2)
{
  *view = gsl_matrix_view_vector(v, n1, n2);
  return &view->matrix;
}

gsl_matrix *mgsl_matrix_view_vector_with_tda(gsl_matrix_view *view, gsl_vector *v, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_view_vector_with_tda(v, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_float_view *alloc_gsl_matrix_float_view(void)
{
  gsl_matrix_float_view *m = calloc(1, sizeof(gsl_matrix_float_view));
  return m;
}

void free_gsl_matrix_float_view(gsl_matrix_float_view *m)
{
  if(m != NULL){
    free(m);
    m = NULL;
  }
}

gsl_matrix_float *mgsl_matrix_float_submatrix(gsl_matrix_float_view *view, gsl_matrix_float *m, size_t k1, size_t k2, size_t n1, size_t n2)
{
  *view = gsl_matrix_float_submatrix(m, k1, k2, n1, n2);
  return &view->matrix;
}

gsl_matrix_float *mgsl_matrix_float_view_array(gsl_matrix_float_view *view, float *base, size_t n1, size_t n2)
{
  *view = gsl_matrix_float_view_array(base, n1, n2);
  return &view->matrix;
}

gsl_matrix_float *mgsl_matrix_float_view_array_with_tda(gsl_matrix_float_view *view, float *base, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_float_view_array_with_tda(base, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_float *mgsl_matrix_float_view_vector(gsl_matrix_float_view *view, gsl_vector_float *v, size_t n1, size_t n2)
{
  *view = gsl_matrix_float_view_vector(v, n1, n2);
  return &view->matrix;
}

gsl_matrix_float *mgsl_matrix_float_view_vector_with_tda(gsl_matrix_float_view *view, gsl_vector_float *v, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_float_view_vector_with_tda(v, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_int_view *alloc_gsl_matrix_int_view(void)
{
  gsl_matrix_int_view *m = calloc(1, sizeof(gsl_matrix_int_view));
  return m;
}

void free_gsl_matrix_int_view(gsl_matrix_int_view *m)
{
  if(m != NULL){
    free(m);
    m = NULL;
  }
}

gsl_matrix_int *mgsl_matrix_int_submatrix(gsl_matrix_int_view *view, gsl_matrix_int *m, size_t k1, size_t k2, size_t n1, size_t n2)
{
  *view = gsl_matrix_int_submatrix(m, k1, k2, n1, n2);
  return &view->matrix;
}

gsl_matrix_int *mgsl_matrix_int_view_array(gsl_matrix_int_view *view, int *base, size_t n1, size_t n2)
{
  *view = gsl_matrix_int_view_array(base, n1, n2);
  return &view->matrix;
}

gsl_matrix_int *mgsl_matrix_int_view_array_with_tda(gsl_matrix_int_view *view, int *base, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_int_view_array_with_tda(base, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_int *mgsl_matrix_int_view_vector(gsl_matrix_int_view *view, gsl_vector_int *v, size_t n1, size_t n2)
{
  *view = gsl_matrix_int_view_vector(v, n1, n2);
  return &view->matrix;
}

gsl_matrix_int *mgsl_matrix_int_view_vector_with_tda(gsl_matrix_int_view *view, gsl_vector_int *v, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_int_view_vector_with_tda(v, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_uint_view *alloc_gsl_matrix_uint_view(void)
{
  gsl_matrix_uint_view *m = calloc(1, sizeof(gsl_matrix_uint_view));
  return m;
}

void free_gsl_matrix_uint_view(gsl_matrix_uint_view *m)
{
  if(m != NULL){
    free(m);
    m = NULL;
  }
}

gsl_matrix_uint *mgsl_matrix_uint_submatrix(gsl_matrix_uint_view *view, gsl_matrix_uint *m, size_t k1, size_t k2, size_t n1, size_t n2)
{
  *view = gsl_matrix_uint_submatrix(m, k1, k2, n1, n2);
  return &view->matrix;
}

gsl_matrix_uint *mgsl_matrix_uint_view_array(gsl_matrix_uint_view *view, unsigned int *base, size_t n1, size_t n2)
{
  *view = gsl_matrix_uint_view_array(base, n1, n2);
  return &view->matrix;
}

gsl_matrix_uint *mgsl_matrix_uint_view_array_with_tda(gsl_matrix_uint_view *view, unsigned int *base, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_uint_view_array_with_tda(base, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_uint *mgsl_matrix_uint_view_vector(gsl_matrix_uint_view *view, gsl_vector_uint *v, size_t n1, size_t n2)
{
  *view = gsl_matrix_uint_view_vector(v, n1, n2);
  return &view->matrix;
}

gsl_matrix_uint *mgsl_matrix_uint_view_vector_with_tda(gsl_matrix_uint_view *view, gsl_vector_uint *v, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_uint_view_vector_with_tda(v, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_long_view *alloc_gsl_matrix_long_view(void)
{
  gsl_matrix_long_view *m = calloc(1, sizeof(gsl_matrix_long_view));
  return m;
}

void free_gsl_matrix_long_view(gsl_matrix_long_view *m)
{
  if(m != NULL){
    free(m);
    m = NULL;
  }
}

gsl_matrix_long *mgsl_matrix_long_submatrix(gsl_matrix_long_view *view, gsl_matrix_long *m, size_t k1, size_t k2, size_t n1, size_t n2)
{
  *view = gsl_matrix_long_submatrix(m, k1, k2, n1, n2);
  return &view->matrix;
}

gsl_matrix_long *mgsl_matrix_long_view_array(gsl_matrix_long_view *view, long *base, size_t n1, size_t n2)
{
  *view = gsl_matrix_long_view_array(base, n1, n2);
  return &view->matrix;
}

gsl_matrix_long *mgsl_matrix_long_view_array_with_tda(gsl_matrix_long_view *view, long *base, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_long_view_array_with_tda(base, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_long *mgsl_matrix_long_view_vector(gsl_matrix_long_view *view, gsl_vector_long *v, size_t n1, size_t n2)
{
  *view = gsl_matrix_long_view_vector(v, n1, n2);
  return &view->matrix;
}

gsl_matrix_long *mgsl_matrix_long_view_vector_with_tda(gsl_matrix_long_view *view, gsl_vector_long *v, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_long_view_vector_with_tda(v, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_ulong_view *alloc_gsl_matrix_ulong_view(void)
{
  gsl_matrix_ulong_view *m = calloc(1, sizeof(gsl_matrix_ulong_view));
  return m;
}

void free_gsl_matrix_ulong_view(gsl_matrix_ulong_view *m)
{
  if(m != NULL){
    free(m);
    m = NULL;
  }
}

gsl_matrix_ulong *mgsl_matrix_ulong_submatrix(gsl_matrix_ulong_view *view, gsl_matrix_ulong *m, size_t k1, size_t k2, size_t n1, size_t n2)
{
  *view = gsl_matrix_ulong_submatrix(m, k1, k2, n1, n2);
  return &view->matrix;
}

gsl_matrix_ulong *mgsl_matrix_ulong_view_array(gsl_matrix_ulong_view *view, unsigned long *base, size_t n1, size_t n2)
{
  *view = gsl_matrix_ulong_view_array(base, n1, n2);
  return &view->matrix;
}

gsl_matrix_ulong *mgsl_matrix_ulong_view_array_with_tda(gsl_matrix_ulong_view *view, unsigned long *base, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_ulong_view_array_with_tda(base, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_ulong *mgsl_matrix_ulong_view_vector(gsl_matrix_ulong_view *view, gsl_vector_ulong *v, size_t n1, size_t n2)
{
  *view = gsl_matrix_ulong_view_vector(v, n1, n2);
  return &view->matrix;
}

gsl_matrix_ulong *mgsl_matrix_ulong_view_vector_with_tda(gsl_matrix_ulong_view *view, gsl_vector_ulong *v, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_ulong_view_vector_with_tda(v, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_short_view *alloc_gsl_matrix_short_view(void)
{
  gsl_matrix_short_view *m = calloc(1, sizeof(gsl_matrix_short_view));
  return m;
}

void free_gsl_matrix_short_view(gsl_matrix_short_view *m)
{
  if(m != NULL){
    free(m);
    m = NULL;
  }
}

gsl_matrix_short *mgsl_matrix_short_submatrix(gsl_matrix_short_view *view, gsl_matrix_short *m, size_t k1, size_t k2, size_t n1, size_t n2)
{
  *view = gsl_matrix_short_submatrix(m, k1, k2, n1, n2);
  return &view->matrix;
}

gsl_matrix_short *mgsl_matrix_short_view_array(gsl_matrix_short_view *view, short *base, size_t n1, size_t n2)
{
  *view = gsl_matrix_short_view_array(base, n1, n2);
  return &view->matrix;
}

gsl_matrix_short *mgsl_matrix_short_view_array_with_tda(gsl_matrix_short_view *view, short *base, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_short_view_array_with_tda(base, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_short *mgsl_matrix_short_view_vector(gsl_matrix_short_view *view, gsl_vector_short *v, size_t n1, size_t n2)
{
  *view = gsl_matrix_short_view_vector(v, n1, n2);
  return &view->matrix;
}

gsl_matrix_short *mgsl_matrix_short_view_vector_with_tda(gsl_matrix_short_view *view, gsl_vector_short *v, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_short_view_vector_with_tda(v, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_ushort_view *alloc_gsl_matrix_ushort_view(void)
{
  gsl_matrix_ushort_view *m = calloc(1, sizeof(gsl_matrix_ushort_view));
  return m;
}

void free_gsl_matrix_ushort_view(gsl_matrix_ushort_view *m)
{
  if(m != NULL){
    free(m);
    m = NULL;
  }
}

gsl_matrix_ushort *mgsl_matrix_ushort_submatrix(gsl_matrix_ushort_view *view, gsl_matrix_ushort *m, size_t k1, size_t k2, size_t n1, size_t n2)
{
  *view = gsl_matrix_ushort_submatrix(m, k1, k2, n1, n2);
  return &view->matrix;
}

gsl_matrix_ushort *mgsl_matrix_ushort_view_array(gsl_matrix_ushort_view *view, unsigned short *base, size_t n1, size_t n2)
{
  *view = gsl_matrix_ushort_view_array(base, n1, n2);
  return &view->matrix;
}

gsl_matrix_ushort *mgsl_matrix_ushort_view_array_with_tda(gsl_matrix_ushort_view *view, unsigned short *base, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_ushort_view_array_with_tda(base, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_ushort *mgsl_matrix_ushort_view_vector(gsl_matrix_ushort_view *view, gsl_vector_ushort *v, size_t n1, size_t n2)
{
  *view = gsl_matrix_ushort_view_vector(v, n1, n2);
  return &view->matrix;
}

gsl_matrix_ushort *mgsl_matrix_ushort_view_vector_with_tda(gsl_matrix_ushort_view *view, gsl_vector_ushort *v, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_ushort_view_vector_with_tda(v, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_char_view *alloc_gsl_matrix_char_view(void)
{
  gsl_matrix_char_view *m = calloc(1, sizeof(gsl_matrix_char_view));
  return m;
}

void free_gsl_matrix_char_view(gsl_matrix_char_view *m)
{
  if(m != NULL){
    free(m);
    m = NULL;
  }
}

gsl_matrix_char *mgsl_matrix_char_submatrix(gsl_matrix_char_view *view, gsl_matrix_char *m, size_t k1, size_t k2, size_t n1, size_t n2)
{
  *view = gsl_matrix_char_submatrix(m, k1, k2, n1, n2);
  return &view->matrix;
}

gsl_matrix_char *mgsl_matrix_char_view_array(gsl_matrix_char_view *view, char *base, size_t n1, size_t n2)
{
  *view = gsl_matrix_char_view_array(base, n1, n2);
  return &view->matrix;
}

gsl_matrix_char *mgsl_matrix_char_view_array_with_tda(gsl_matrix_char_view *view, char *base, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_char_view_array_with_tda(base, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_char *mgsl_matrix_char_view_vector(gsl_matrix_char_view *view, gsl_vector_char *v, size_t n1, size_t n2)
{
  *view = gsl_matrix_char_view_vector(v, n1, n2);
  return &view->matrix;
}

gsl_matrix_char *mgsl_matrix_char_view_vector_with_tda(gsl_matrix_char_view *view, gsl_vector_char *v, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_char_view_vector_with_tda(v, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_uchar_view *alloc_gsl_matrix_uchar_view(void)
{
  gsl_matrix_uchar_view *m = calloc(1, sizeof(gsl_matrix_uchar_view));
  return m;
}

void free_gsl_matrix_uchar_view(gsl_matrix_uchar_view *m)
{
  if(m != NULL){
    free(m);
    m = NULL;
  }
}

gsl_matrix_uchar *mgsl_matrix_uchar_submatrix(gsl_matrix_uchar_view *view, gsl_matrix_uchar *m, size_t k1, size_t k2, size_t n1, size_t n2)
{
  *view = gsl_matrix_uchar_submatrix(m, k1, k2, n1, n2);
  return &view->matrix;
}

gsl_matrix_uchar *mgsl_matrix_uchar_view_array(gsl_matrix_uchar_view *view, unsigned char *base, size_t n1, size_t n2)
{
  *view = gsl_matrix_uchar_view_array(base, n1, n2);
  return &view->matrix;
}

gsl_matrix_uchar *mgsl_matrix_uchar_view_array_with_tda(gsl_matrix_uchar_view *view, unsigned char *base, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_uchar_view_array_with_tda(base, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_uchar *mgsl_matrix_uchar_view_vector(gsl_matrix_uchar_view *view, gsl_vector_uchar *v, size_t n1, size_t n2)
{
  *view = gsl_matrix_uchar_view_vector(v, n1, n2);
  return &view->matrix;
}

gsl_matrix_uchar *mgsl_matrix_uchar_view_vector_with_tda(gsl_matrix_uchar_view *view, gsl_vector_uchar *v, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_uchar_view_vector_with_tda(v, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_complex_view *alloc_gsl_matrix_complex_view(void)
{
  gsl_matrix_complex_view *m = calloc(1, sizeof(gsl_matrix_complex_view));
  return m;
}

void free_gsl_matrix_complex_view(gsl_matrix_complex_view *m)
{
  if(m != NULL){
    free(m);
    m = NULL;
  }
}

gsl_matrix_complex *mgsl_matrix_complex_submatrix(gsl_matrix_complex_view *view, gsl_matrix_complex *m, size_t k1, size_t k2, size_t n1, size_t n2)
{
  *view = gsl_matrix_complex_submatrix(m, k1, k2, n1, n2);
  return &view->matrix;
}

gsl_matrix_complex *mgsl_matrix_complex_view_array(gsl_matrix_complex_view *view, double *base, size_t n1, size_t n2)
{
  *view = gsl_matrix_complex_view_array(base, n1, n2);
  return &view->matrix;
}

gsl_matrix_complex *mgsl_matrix_complex_view_array_with_tda(gsl_matrix_complex_view *view, double *base, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_complex_view_array_with_tda(base, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_complex *mgsl_matrix_complex_view_vector(gsl_matrix_complex_view *view, gsl_vector_complex *v, size_t n1, size_t n2)
{
  *view = gsl_matrix_complex_view_vector(v, n1, n2);
  return &view->matrix;
}

gsl_matrix_complex *mgsl_matrix_complex_view_vector_with_tda(gsl_matrix_complex_view *view, gsl_vector_complex *v, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_complex_view_vector_with_tda(v, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_complex_float_view *alloc_gsl_matrix_complex_float_view(void)
{
  gsl_matrix_complex_float_view *m = calloc(1, sizeof(gsl_matrix_complex_float_view));
  return m;
}

void free_gsl_matrix_complex_float_view(gsl_matrix_complex_float_view *m)
{
  if(m != NULL){
    free(m);
    m = NULL;
  }
}

gsl_matrix_complex_float *mgsl_matrix_complex_float_submatrix(gsl_matrix_complex_float_view *view, gsl_matrix_complex_float *m, size_t k1, size_t k2, size_t n1, size_t n2)
{
  *view = gsl_matrix_complex_float_submatrix(m, k1, k2, n1, n2);
  return &view->matrix;
}

gsl_matrix_complex_float *mgsl_matrix_complex_float_view_array(gsl_matrix_complex_float_view *view, float *base, size_t n1, size_t n2)
{
  *view = gsl_matrix_complex_float_view_array(base, n1, n2);
  return &view->matrix;
}

gsl_matrix_complex_float *mgsl_matrix_complex_float_view_array_with_tda(gsl_matrix_complex_float_view *view, float *base, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_complex_float_view_array_with_tda(base, n1, n2, tda);
  return &view->matrix;
}

gsl_matrix_complex_float *mgsl_matrix_complex_float_view_vector(gsl_matrix_complex_float_view *view, gsl_vector_complex_float *v, size_t n1, size_t n2)
{
  *view = gsl_matrix_complex_float_view_vector(v, n1, n2);
  return &view->matrix;
}

gsl_matrix_complex_float *mgsl_matrix_complex_float_view_vector_with_tda(gsl_matrix_complex_float_view *view, gsl_vector_complex_float *v, size_t n1, size_t n2, size_t tda)
{
  *view = gsl_matrix_complex_float_view_vector_with_tda(v, n1, n2, tda);
  return &view->matrix;
}

/* Matrix row and column view */
gsl_vector *mgsl_matrix_row(gsl_vector_view *view, gsl_matrix *m, size_t i)
{
  *view = gsl_matrix_row(m, i);
  return &view->vector;
}

gsl_vector_float *mgsl_matrix_float_row(gsl_vector_float_view *view, gsl_matrix_float *m, size_t i)
{
  *view = gsl_matrix_float_row(m, i);
  return &view->vector;
}

gsl_vector_int *mgsl_matrix_int_row(gsl_vector_int_view *view, gsl_matrix_int *m, size_t i)
{
  *view = gsl_matrix_int_row(m, i);
  return &view->vector;
}

gsl_vector_uint *mgsl_matrix_uint_row(gsl_vector_uint_view *view, gsl_matrix_uint *m, size_t i)
{
  *view = gsl_matrix_uint_row(m, i);
  return &view->vector;
}

gsl_vector_long *mgsl_matrix_long_row(gsl_vector_long_view *view, gsl_matrix_long *m, size_t i)
{
  *view = gsl_matrix_long_row(m, i);
  return &view->vector;
}

gsl_vector_ulong *mgsl_matrix_ulong_row(gsl_vector_ulong_view *view, gsl_matrix_ulong *m, size_t i)
{
  *view = gsl_matrix_ulong_row(m, i);
  return &view->vector;
}

gsl_vector_short *mgsl_matrix_short_row(gsl_vector_short_view *view, gsl_matrix_short *m, size_t i)
{
  *view = gsl_matrix_short_row(m, i);
  return &view->vector;
}

gsl_vector_ushort *mgsl_matrix_ushort_row(gsl_vector_ushort_view *view, gsl_matrix_ushort *m, size_t i)
{
  *view = gsl_matrix_ushort_row(m, i);
  return &view->vector;
}

gsl_vector_char *mgsl_matrix_char_row(gsl_vector_char_view *view, gsl_matrix_char *m, size_t i)
{
  *view = gsl_matrix_char_row(m, i);
  return &view->vector;
}

gsl_vector_uchar *mgsl_matrix_uchar_row(gsl_vector_uchar_view *view, gsl_matrix_uchar *m, size_t i)
{
  *view = gsl_matrix_uchar_row(m, i);
  return &view->vector;
}

gsl_vector_complex *mgsl_matrix_complex_row(gsl_vector_complex_view *view, gsl_matrix_complex *m, size_t i)
{
  *view = gsl_matrix_complex_row(m, i);
  return &view->vector;
}

gsl_vector_complex_float *mgsl_matrix_complex_float_row(gsl_vector_complex_float_view *view, gsl_matrix_complex_float *m, size_t i)
{
  *view = gsl_matrix_complex_float_row(m, i);
  return &view->vector;
}

gsl_vector *mgsl_matrix_column(gsl_vector_view *view, gsl_matrix *m, size_t j)
{
  *view = gsl_matrix_column(m, j);
  return &view->vector;
}

gsl_vector_float *mgsl_matrix_float_column(gsl_vector_float_view *view, gsl_matrix_float *m, size_t j)
{
  *view = gsl_matrix_float_column(m, j);
  return &view->vector;
}

gsl_vector_int *mgsl_matrix_int_column(gsl_vector_int_view *view, gsl_matrix_int *m, size_t j)
{
  *view = gsl_matrix_int_column(m, j);
  return &view->vector;
}

gsl_vector_uint *mgsl_matrix_uint_column(gsl_vector_uint_view *view, gsl_matrix_uint *m, size_t j)
{
  *view = gsl_matrix_uint_column(m, j);
  return &view->vector;
}

gsl_vector_long *mgsl_matrix_long_column(gsl_vector_long_view *view, gsl_matrix_long *m, size_t j)
{
  *view = gsl_matrix_long_column(m, j);
  return &view->vector;
}

gsl_vector_ulong *mgsl_matrix_ulong_column(gsl_vector_ulong_view *view, gsl_matrix_ulong *m, size_t j)
{
  *view = gsl_matrix_ulong_column(m, j);
  return &view->vector;
}

gsl_vector_short *mgsl_matrix_short_column(gsl_vector_short_view *view, gsl_matrix_short *m, size_t j)
{
  *view = gsl_matrix_short_column(m, j);
  return &view->vector;
}

gsl_vector_ushort *mgsl_matrix_ushort_column(gsl_vector_ushort_view *view, gsl_matrix_ushort *m, size_t j)
{
  *view = gsl_matrix_ushort_column(m, j);
  return &view->vector;
}

gsl_vector_char *mgsl_matrix_char_column(gsl_vector_char_view *view, gsl_matrix_char *m, size_t j)
{
  *view = gsl_matrix_char_column(m, j);
  return &view->vector;
}

gsl_vector_uchar *mgsl_matrix_uchar_column(gsl_vector_uchar_view *view, gsl_matrix_uchar *m, size_t j)
{
  *view = gsl_matrix_uchar_column(m, j);
  return &view->vector;
}

gsl_vector_complex *mgsl_matrix_complex_column(gsl_vector_complex_view *view, gsl_matrix_complex *m, size_t j)
{
  *view = gsl_matrix_complex_column(m, j);
  return &view->vector;
}

gsl_vector_complex_float *mgsl_matrix_complex_float_column(gsl_vector_complex_float_view *view, gsl_matrix_complex_float *m, size_t j)
{
  *view = gsl_matrix_complex_float_column(m, j);
  return &view->vector;
}

gsl_vector *mgsl_matrix_subrow(gsl_vector_view *view, gsl_matrix *m, size_t i, size_t offset, size_t n)
{
  *view = gsl_matrix_subrow(m, i, offset, n);
  return &view->vector;
}

gsl_vector_float *mgsl_matrix_float_subrow(gsl_vector_float_view *view, gsl_matrix_float *m, size_t i, size_t offset, size_t n)
{
  *view = gsl_matrix_float_subrow(m, i, offset, n);
  return &view->vector;
}

gsl_vector_int *mgsl_matrix_int_subrow(gsl_vector_int_view *view, gsl_matrix_int *m, size_t i, size_t offset, size_t n)
{
  *view = gsl_matrix_int_subrow(m, i, offset, n);
  return &view->vector;
}

gsl_vector_uint *mgsl_matrix_uint_subrow(gsl_vector_uint_view *view, gsl_matrix_uint *m, size_t i, size_t offset, size_t n)
{
  *view = gsl_matrix_uint_subrow(m, i, offset, n);
  return &view->vector;
}

gsl_vector_long *mgsl_matrix_long_subrow(gsl_vector_long_view *view, gsl_matrix_long *m, size_t i, size_t offset, size_t n)
{
  *view = gsl_matrix_long_subrow(m, i, offset, n);
  return &view->vector;
}

gsl_vector_ulong *mgsl_matrix_ulong_subrow(gsl_vector_ulong_view *view, gsl_matrix_ulong *m, size_t i, size_t offset, size_t n)
{
  *view = gsl_matrix_ulong_subrow(m, i, offset, n);
  return &view->vector;
}

gsl_vector_short *mgsl_matrix_short_subrow(gsl_vector_short_view *view, gsl_matrix_short *m, size_t i, size_t offset, size_t n)
{
  *view = gsl_matrix_short_subrow(m, i, offset, n);
  return &view->vector;
}

gsl_vector_ushort *mgsl_matrix_ushort_subrow(gsl_vector_ushort_view *view, gsl_matrix_ushort *m, size_t i, size_t offset, size_t n)
{
  *view = gsl_matrix_ushort_subrow(m, i, offset, n);
  return &view->vector;
}

gsl_vector_char *mgsl_matrix_char_subrow(gsl_vector_char_view *view, gsl_matrix_char *m, size_t i, size_t offset, size_t n)
{
  *view = gsl_matrix_char_subrow(m, i, offset, n);
  return &view->vector;
}

gsl_vector_uchar *mgsl_matrix_uchar_subrow(gsl_vector_uchar_view *view, gsl_matrix_uchar *m, size_t i, size_t offset, size_t n)
{
  *view = gsl_matrix_uchar_subrow(m, i, offset, n);
  return &view->vector;
}

gsl_vector_complex *mgsl_matrix_complex_subrow(gsl_vector_complex_view *view, gsl_matrix_complex *m, size_t i, size_t offset, size_t n)
{
  *view = gsl_matrix_complex_subrow(m, i, offset, n);
  return &view->vector;
}

gsl_vector_complex_float *mgsl_matrix_complex_float_subrow(gsl_vector_complex_float_view *view, gsl_matrix_complex_float *m, size_t i, size_t offset, size_t n)
{
  *view = gsl_matrix_complex_float_subrow(m, i, offset, n);
  return &view->vector;
}

gsl_vector *mgsl_matrix_subcolumn(gsl_vector_view *view, gsl_matrix *m, size_t j, size_t offset, size_t n)
{
  *view = gsl_matrix_subcolumn(m, j, offset, n);
  return &view->vector;
}

gsl_vector_float *mgsl_matrix_float_subcolumn(gsl_vector_float_view *view, gsl_matrix_float *m, size_t j, size_t offset, size_t n)
{
  *view = gsl_matrix_float_subcolumn(m, j, offset, n);
  return &view->vector;
}

gsl_vector_int *mgsl_matrix_int_subcolumn(gsl_vector_int_view *view, gsl_matrix_int *m, size_t j, size_t offset, size_t n)
{
  *view = gsl_matrix_int_subcolumn(m, j, offset, n);
  return &view->vector;
}

gsl_vector_uint *mgsl_matrix_uint_subcolumn(gsl_vector_uint_view *view, gsl_matrix_uint *m, size_t j, size_t offset, size_t n)
{
  *view = gsl_matrix_uint_subcolumn(m, j, offset, n);
  return &view->vector;
}

gsl_vector_long *mgsl_matrix_long_subcolumn(gsl_vector_long_view *view, gsl_matrix_long *m, size_t j, size_t offset, size_t n)
{
  *view = gsl_matrix_long_subcolumn(m, j, offset, n);
  return &view->vector;
}

gsl_vector_ulong *mgsl_matrix_ulong_subcolumn(gsl_vector_ulong_view *view, gsl_matrix_ulong *m, size_t j, size_t offset, size_t n)
{
  *view = gsl_matrix_ulong_subcolumn(m, j, offset, n);
  return &view->vector;
}

gsl_vector_short *mgsl_matrix_short_subcolumn(gsl_vector_short_view *view, gsl_matrix_short *m, size_t j, size_t offset, size_t n)
{
  *view = gsl_matrix_short_subcolumn(m, j, offset, n);
  return &view->vector;
}

gsl_vector_ushort *mgsl_matrix_ushort_subcolumn(gsl_vector_ushort_view *view, gsl_matrix_ushort *m, size_t j, size_t offset, size_t n)
{
  *view = gsl_matrix_ushort_subcolumn(m, j, offset, n);
  return &view->vector;
}

gsl_vector_char *mgsl_matrix_char_subcolumn(gsl_vector_char_view *view, gsl_matrix_char *m, size_t j, size_t offset, size_t n)
{
  *view = gsl_matrix_char_subcolumn(m, j, offset, n);
  return &view->vector;
}

gsl_vector_uchar *mgsl_matrix_uchar_subcolumn(gsl_vector_uchar_view *view, gsl_matrix_uchar *m, size_t j, size_t offset, size_t n)
{
  *view = gsl_matrix_uchar_subcolumn(m, j, offset, n);
  return &view->vector;
}

gsl_vector_complex *mgsl_matrix_complex_subcolumn(gsl_vector_complex_view *view, gsl_matrix_complex *m, size_t j, size_t offset, size_t n)
{
  *view = gsl_matrix_complex_subcolumn(m, j, offset, n);
  return &view->vector;
}

gsl_vector_complex_float *mgsl_matrix_complex_float_subcolumn(gsl_vector_complex_float_view *view, gsl_matrix_complex_float *m, size_t j, size_t offset, size_t n)
{
  *view = gsl_matrix_complex_float_subcolumn(m, j, offset, n);
  return &view->vector;
}

gsl_vector *mgsl_matrix_diagonal(gsl_vector_view *view, gsl_matrix *m)
{
  *view = gsl_matrix_diagonal(m);
  return &view->vector;
}

gsl_vector_float *mgsl_matrix_float_diagonal(gsl_vector_float_view *view, gsl_matrix_float *m)
{
  *view = gsl_matrix_float_diagonal(m);
  return &view->vector;
}

gsl_vector_int *mgsl_matrix_int_diagonal(gsl_vector_int_view *view, gsl_matrix_int *m)
{
  *view = gsl_matrix_int_diagonal(m);
  return &view->vector;
}

gsl_vector_uint *mgsl_matrix_uint_diagonal(gsl_vector_uint_view *view, gsl_matrix_uint *m)
{
  *view = gsl_matrix_uint_diagonal(m);
  return &view->vector;
}

gsl_vector_long *mgsl_matrix_long_diagonal(gsl_vector_long_view *view, gsl_matrix_long *m)
{
  *view = gsl_matrix_long_diagonal(m);
  return &view->vector;
}

gsl_vector_ulong *mgsl_matrix_ulong_diagonal(gsl_vector_ulong_view *view, gsl_matrix_ulong *m)
{
  *view = gsl_matrix_ulong_diagonal(m);
  return &view->vector;
}

gsl_vector_short *mgsl_matrix_short_diagonal(gsl_vector_short_view *view, gsl_matrix_short *m)
{
  *view = gsl_matrix_short_diagonal(m);
  return &view->vector;
}

gsl_vector_ushort *mgsl_matrix_ushort_diagonal(gsl_vector_ushort_view *view, gsl_matrix_ushort *m)
{
  *view = gsl_matrix_ushort_diagonal(m);
  return &view->vector;
}

gsl_vector_char *mgsl_matrix_char_diagonal(gsl_vector_char_view *view, gsl_matrix_char *m)
{
  *view = gsl_matrix_char_diagonal(m);
  return &view->vector;
}

gsl_vector_uchar *mgsl_matrix_uchar_diagonal(gsl_vector_uchar_view *view, gsl_matrix_uchar *m)
{
  *view = gsl_matrix_uchar_diagonal(m);
  return &view->vector;
}

gsl_vector_complex *mgsl_matrix_complex_diagonal(gsl_vector_complex_view *view, gsl_matrix_complex *m)
{
  *view = gsl_matrix_complex_diagonal(m);
  return &view->vector;
}

gsl_vector_complex_float *mgsl_matrix_complex_float_diagonal(gsl_vector_complex_float_view *view, gsl_matrix_complex_float *m)
{
  *view = gsl_matrix_complex_float_diagonal(m);
  return &view->vector;
}

gsl_vector *mgsl_matrix_subdiagonal(gsl_vector_view *view, gsl_matrix *m, size_t k)
{
  *view = gsl_matrix_subdiagonal(m, k);
  return &view->vector;
}

gsl_vector_float *mgsl_matrix_float_subdiagonal(gsl_vector_float_view *view, gsl_matrix_float *m, size_t k)
{
  *view = gsl_matrix_float_subdiagonal(m, k);
  return &view->vector;
}

gsl_vector_int *mgsl_matrix_int_subdiagonal(gsl_vector_int_view *view, gsl_matrix_int *m, size_t k)
{
  *view = gsl_matrix_int_subdiagonal(m, k);
  return &view->vector;
}

gsl_vector_uint *mgsl_matrix_uint_subdiagonal(gsl_vector_uint_view *view, gsl_matrix_uint *m, size_t k)
{
  *view = gsl_matrix_uint_subdiagonal(m, k);
  return &view->vector;
}

gsl_vector_long *mgsl_matrix_long_subdiagonal(gsl_vector_long_view *view, gsl_matrix_long *m, size_t k)
{
  *view = gsl_matrix_long_subdiagonal(m, k);
  return &view->vector;
}

gsl_vector_ulong *mgsl_matrix_ulong_subdiagonal(gsl_vector_ulong_view *view, gsl_matrix_ulong *m, size_t k)
{
  *view = gsl_matrix_ulong_subdiagonal(m, k);
  return &view->vector;
}

gsl_vector_short *mgsl_matrix_short_subdiagonal(gsl_vector_short_view *view, gsl_matrix_short *m, size_t k)
{
  *view = gsl_matrix_short_subdiagonal(m, k);
  return &view->vector;
}

gsl_vector_ushort *mgsl_matrix_ushort_subdiagonal(gsl_vector_ushort_view *view, gsl_matrix_ushort *m, size_t k)
{
  *view = gsl_matrix_ushort_subdiagonal(m, k);
  return &view->vector;
}

gsl_vector_char *mgsl_matrix_char_subdiagonal(gsl_vector_char_view *view, gsl_matrix_char *m, size_t k)
{
  *view = gsl_matrix_char_subdiagonal(m, k);
  return &view->vector;
}

gsl_vector_uchar *mgsl_matrix_uchar_subdiagonal(gsl_vector_uchar_view *view, gsl_matrix_uchar *m, size_t k)
{
  *view = gsl_matrix_uchar_subdiagonal(m, k);
  return &view->vector;
}

gsl_vector_complex *mgsl_matrix_complex_subdiagonal(gsl_vector_complex_view *view, gsl_matrix_complex *m, size_t k)
{
  *view = gsl_matrix_complex_subdiagonal(m, k);
  return &view->vector;
}

gsl_vector_complex_float *mgsl_matrix_complex_float_subdiagonal(gsl_vector_complex_float_view *view, gsl_matrix_complex_float *m, size_t k)
{
  *view = gsl_matrix_complex_float_subdiagonal(m, k);
  return &view->vector;
}

gsl_vector *mgsl_matrix_superdiagonal(gsl_vector_view *view, gsl_matrix *m, size_t k)
{
  *view = gsl_matrix_superdiagonal(m, k);
  return &view->vector;
}

gsl_vector_float *mgsl_matrix_float_superdiagonal(gsl_vector_float_view *view, gsl_matrix_float *m, size_t k)
{
  *view = gsl_matrix_float_superdiagonal(m, k);
  return &view->vector;
}

gsl_vector_int *mgsl_matrix_int_superdiagonal(gsl_vector_int_view *view, gsl_matrix_int *m, size_t k)
{
  *view = gsl_matrix_int_superdiagonal(m, k);
  return &view->vector;
}

gsl_vector_uint *mgsl_matrix_uint_superdiagonal(gsl_vector_uint_view *view, gsl_matrix_uint *m, size_t k)
{
  *view = gsl_matrix_uint_superdiagonal(m, k);
  return &view->vector;
}

gsl_vector_long *mgsl_matrix_long_superdiagonal(gsl_vector_long_view *view, gsl_matrix_long *m, size_t k)
{
  *view = gsl_matrix_long_superdiagonal(m, k);
  return &view->vector;
}

gsl_vector_ulong *mgsl_matrix_ulong_superdiagonal(gsl_vector_ulong_view *view, gsl_matrix_ulong *m, size_t k)
{
  *view = gsl_matrix_ulong_superdiagonal(m, k);
  return &view->vector;
}

gsl_vector_short *mgsl_matrix_short_superdiagonal(gsl_vector_short_view *view, gsl_matrix_short *m, size_t k)
{
  *view = gsl_matrix_short_superdiagonal(m, k);
  return &view->vector;
}

gsl_vector_ushort *mgsl_matrix_ushort_superdiagonal(gsl_vector_ushort_view *view, gsl_matrix_ushort *m, size_t k)
{
  *view = gsl_matrix_ushort_superdiagonal(m, k);
  return &view->vector;
}

gsl_vector_char *mgsl_matrix_char_superdiagonal(gsl_vector_char_view *view, gsl_matrix_char *m, size_t k)
{
  *view = gsl_matrix_char_superdiagonal(m, k);
  return &view->vector;
}

gsl_vector_uchar *mgsl_matrix_uchar_superdiagonal(gsl_vector_uchar_view *view, gsl_matrix_uchar *m, size_t k)
{
  *view = gsl_matrix_uchar_superdiagonal(m, k);
  return &view->vector;
}

gsl_vector_complex *mgsl_matrix_complex_superdiagonal(gsl_vector_complex_view *view, gsl_matrix_complex *m, size_t k)
{
  *view = gsl_matrix_complex_superdiagonal(m, k);
  return &view->vector;
}

gsl_vector_complex_float *mgsl_matrix_complex_float_superdiagonal(gsl_vector_complex_float_view *view, gsl_matrix_complex_float *m, size_t k)
{
  *view = gsl_matrix_complex_float_superdiagonal(m, k);
  return &view->vector;
}
