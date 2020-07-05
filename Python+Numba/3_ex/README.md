# Numba (JIT)

It is important to mention that by using the Numba Module when you set a def function and you use Numpy Module inside, there is no support. The error message is: 

numba.core.errors.TypingError: Failed in nopython mode pipeline (step: nopython frontend)
Untyped global name 'sum': cannot determine Numba type of <classbuiltin_function_or_method'>

File "Python+Numba/3_ex/fibonacci_ite_JIT.py", line 57:
def arrayloop_fibonacci(k,F,S):
    <source elided>
        F[0]=S
        S = sum(F)
        ^
