def count_change(base_coins, coins, n, path=[]):
    if n == 0:
        print(reducepath(path,base_coins))
        return 1
    if n < 0:
        return 0
    if len(coins) == 0 and n >= 1:
        return 0
    return count_change(base_coins, coins[:-1], n, path) + count_change(base_coins, coins, n - coins[-1], path + [coins[-1]])

def reducepath(path,coins):
    newpath =[]
    for j in range(len(coins)):
        newpath.append(0)
    for i in range(len(path)):
        for j in range(len(coins)):
            if(path[i]==coins[j]):
                newpath[j]+=1
    return(newpath)

coins = [1,2,5,10]
amount = 11
print(count_change(coins, coins, amount))
