def ispalindrome(x):
    f = ''
    for i in range(len(x)-1, -1, -1):
        f += x[i]
    if x == f:
        return True
    else:
        return False


print(ispalindrome('faaf'))
print(ispalindrome('f2af'))
print(ispalindrome('1234321'))

user_input = input('Enter your frase: ')
print(f"{user_input} is a palindrome: {ispalindrome(user_input)}")
