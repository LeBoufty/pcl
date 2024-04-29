def hanoi(n, source, cible, auxiliaire):
    if n == 1:
        print("Déplacer le disque 1 de {} à {}.".format(source, cible))
        return
    hanoi(n-1, source, auxiliaire, cible)
    print("Déplacer le disque {} de {} à {}.".format(n, source, cible))
    hanoi(n-1, auxiliaire, cible, source)

def resoudre_hanoi(n):
    print("Configuration initiale:")
    print("Tour A:", list(range(n, 0, -1)))
    print("Tour B:", [])
    print("Tour C:", [])
    print("\nRésolution du problème des Tours de Hanoi pour {} disques:".format(n))
    hanoi(n, 'A', 'C', 'B')
    print("\nConfiguration finale:")
    print("Tour A:", [])
    print("Tour B:", [])
    print("Tour C:", list(range(n, 0, -1)))

# Exemple d'utilisation :
nombre_disques = 3
resoudre_hanoi(nombre_disques)
