def diff_fib_trib(n):

    def fibonacci(n):
        if n <= 1:
            return n
        else:
            return fibonacci(n-1) + fibonacci(n-2)
        
    def tribonacci(n):
        if n == 0:
            return 0
        elif n == 1 or n == 2:
            return 1
        else:
            return tribonacci(n-1) + tribonacci(n-2) + tribonacci(n-3)
    
    tri = tribonacci(n)
    fib = fibonacci(n)
    print("Tribonacci: ", tri)
    print("Fibonacci: ", fib)
    print("Difference: ", tri - fib)

n=7
diff_fib_trib(n)