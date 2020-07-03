# Numba (JIT)

It is important to mention that by using the Numba Module when you set a def function you use Numpy Module inside, there is no support. The error message is: 

numba.core.errors.TypingError: Failed in nopython mode pipeline (step: nopython frontend)
Use of unsupported NumPy function 'numpy.matmul' or unsupported use of the function.

File "Python+Numba/2_ex/mtx_multi_vec_JIT.py", line 28:
def multivec(mtx1, mtx2, z, mtx3):
    <source elided>

    mtx3 = np.matmul(A,B)