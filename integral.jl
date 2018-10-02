# I
function simpsonrep(f, a, b; m = 101)
    m % 2 == 0 && (m += 1)
    h = (b - a) / (m - 1)
    i=0
    p=0
    xj=a+h

    for j=2:(m-1)

        if j%2==0
            p=p+f(xj)
        else
            i=i+f(xj)
        end
    xj+=h
    end
        g=(h/3)*(f(a)+4*p+2*i+f(b))
        return (g)
         return 0.0
end

function simpsoneps(f, a, b, ϵ; M = 1.0)
    # Calcule h, m e use a função simpsonrep
    h=(180*eps/((b-a)*M))^(1/4)
    m=seil(((b-a)/h)+1)

    if m%2==0 # se m não for impar
        m+=1
    end

    xj=a+h

    for j=2:(m-1)

        if j%2==0
            p=p+f(xj)
        else
            i=i+f(xj)
        end
    xj+=h
    end
        g=(h/3)*(f(a)+4*p+2*i+f(b))
        return (g)


end


# II
function simpson(f, a, b)
    # Simpson sem repetição
     h = (b - a) / 2
    return h * (f(a) + 4 * f(a + h) + f(b)) / 3

end

function simpson_adaptivo(f, a, b, ϵ)
    I = simpson(f, a, b)
    return simpson_adaptivo_recursivo(f, a, b, ϵ, I)
    
end

function simpson_adaptivo_recursivo(f, a, b, ϵ, I)
    # Implementação de Simpson adaptativo
             c=(a+b)/2
             S(x,y)=((y-x)/6)*(f(x)+4f((x+y)/2)+f(y))

             esq=S(a,c)
             dir=S(c,b)
             if (abs(I-esq-dir))<=eps
                          return(esq+dir)
             end
            
             return(simpson_adaptivo_recursivo(f, a, b, eps/2, esq) + simpson_adaptivo_recursivo(f, a, b, eps/2, dir))

end


# não consegui rodar o teste. E não consegui entender o que seria os graficos
