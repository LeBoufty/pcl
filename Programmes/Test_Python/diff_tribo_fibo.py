def diff_fib_trib(n):
    
    def fibonacci(n, x1,x2):
        if n == 0:
            return x1
        else:
            return fibonacci(n-1,x2,x1+x2)
    
    def tribonacci(n, a=0, b=1, c=1):
        if n == 0:
            return a
        elif n == 1:
            return b
        elif n == 2:
            return c
        else:
            return tribonacci(n-1, b, c, a+b+c)
    
    def get_acceleration(f0,f1,f2,n1,n2):
        return (f2-2*f1+f0)/((n2-n1)*(n-n1))

    tri = tribonacci(n,0,1,1)
    fib = fibonacci(n,0,1)
    print("Tribonacci: ", tri)
    print("Fibonacci: ", fib)
    print("Difference: ", tri - fib)
    if(n>1):
        f0=tribonacci(n-2)-fibonacci(n-2,0,1)
        f1=tribonacci(n-1)-fibonacci(n-1,0,1)
        f2=tri-fib
        print("Acceleration: ", get_acceleration(f0,f1,f2,n-1,n))


n=8
diff_fib_trib(n)