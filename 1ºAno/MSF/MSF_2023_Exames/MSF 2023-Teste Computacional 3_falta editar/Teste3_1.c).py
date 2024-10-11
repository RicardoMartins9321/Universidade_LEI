import numpy as np
import matplotlib.pyplot as plt


x0 = 2.2
v0 = 0
k = 1
m = 1
ti = 0
tf = 20
dt = 0.001
n = int((tf-ti)/dt)
alpha = 0.05

t = np.linspace(ti, tf, n+1)
ti_estac = 0

def fourier(x0,v0,m,k,alpha,t,n,ti_estac, dt): 
    #faz a preparação necessária ao cálculo dos coeficientes de Fourier e apresenta-os num gŕafico de barras
    #atenção: alterar a equação da aceleração se necessário
    x=np.empty(n+1)
    v=np.empty(n+1)
    a=np.empty(n+1)
    E=np.empty(n+1)
    
    v[0]=v0
    x[0]=x0
    cntMax=0
    ind=np.transpose([0 for i in range(1000)])
    afo=np.zeros(15)
    bfo=np.zeros(15)


    for i in range(n):
        a[i]=(-k*x[i]-3*alpha*(x[i]**2))/m
        v[i+1]=v[i]+a[i]*dt
        x[i+1]=x[i]+v[i+1]*dt
        E[i]= 0.5*m*(v[i]**2) + 0.5*k*(x[i]**2)+alpha*(x[i]**3)
        if t[i]>ti_estac and x[i-1] < x[i] and  x[i+1] < x[i]:
            cntMax+=1
            ind[cntMax]=int(i)
    		
    t0=ind[cntMax-1]
    t1=ind[cntMax]    
    for i in range(15):
        af, bf=fourier_calc(t,x,t0,t1,dt,i)
        afo[i]=af
        bfo[i]=bf

    ii=np.linspace(0,14,15)
    plt.figure()
    plt.bar(ii,np.sqrt(np.abs(afo)**2 + np.abs(bfo)**2))
    plt.grid()
    plt.show()

def fourier_calc(t,x,t0,t1,dt,nf):
    #faz os cálculos dos coeficientes de Fourier. Parte de 'fourier'
    T=t[t1]-t[t0]
    ome=2*np.pi/T

    s1=x[t0]*np.cos(nf*ome*t[t0])
    s2=x[t1]*np.cos(nf*ome*t[t1])
    st=x[t0+1:t1]*np.cos(nf*ome*t[t0+1:t1])
    soma=np.sum(st)
    
    q1=x[t0]*np.sin(nf*ome*t[t0])
    q2=x[t1]*np.sin(nf*ome*t[t1])
    qt=x[t0+1:t1]*np.sin(nf*ome*t[t0+1:t1])
    somq=np.sum(qt)
    
    intega=((s1+s2)/2+soma)*dt
    af=2/T*intega
    integq=((q1+q2)/2+somq)*dt
    bf=2/T*integq
    return af,bf

t = np.linspace(ti, tf, n+1)

fourier(x0,v0,m,k,alpha,t,n,ti_estac, dt)