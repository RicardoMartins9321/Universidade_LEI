import numpy as np
import matplotlib.pyplot as plt


# parámetros e condições iniciais
tf = 2
t0 = 0.0

x0 = 0
y0 = 0
z0 = 23.8

v0x = 25
v0y = 5
v0z = -50
g = 9.80
vt = 100/3.6
dres=g/vt**2

w = 400
m = 0.45
ro_ar = 1.225
raio = 0.11
area = np.pi*raio**2
f_magnus = 0.5 * area * ro_ar * raio


for dt in [0.1,0.01,0.001,0.0001,0.00001]:			# experimentar várias passos de tempo

    # criar variáveis
    n2=int((tf-t0)/dt+0.1)	# +0.1 para garantir não arredondar para baixo
    t2=np.zeros(n2+1)		    # n+1 elementos; último índice n

    x2=np.zeros(n2+1)
    y2=np.zeros(n2+1)
    z2=np.zeros(n2+1)

    vx2=np.zeros(n2+1)
    vy2=np.zeros(n2+1)
    vz2=np.zeros(n2+1)

    ax2=np.zeros(n2+1)
    ay2=np.zeros(n2+1)
    az2=np.zeros(n2+1)
    
    # valores iniciais
    t2[0]=t0
    x2[0]=x0
    y2[0]=y0
    z2[0]=z0
    vx2[0]=v0x
    vy2[0]=v0y
    vz2[0]=v0z
    
    # método de Euler com resistência do ar e força de Magnus
    for i in range(n2):
        t2[i+1] = t2[i]+dt
        vv = np.sqrt(vx2[i]**2 + vy2[i]**2 + vz2[i]**2)
        aceleracao_magnusx = (f_magnus * w * vz2[i])/m
        aceleracao_magnusz = (-f_magnus * w * vx2[i])/m

        ax2[i] = -dres*vv*vx2[i] + aceleracao_magnusx
        ay2[i] = -g-dres*vv*vy2[i] 
        az2[i] = -dres*vv*vz2[i] + aceleracao_magnusz

        vx2[i+1] = vx2[i]+ax2[i]*dt  
        vy2[i+1] = vy2[i]+ay2[i]*dt
        vz2[i+1] = vz2[i]+az2[i]*dt         

        x2[i+1] = x2[i]+vx2[i]*dt  
        y2[i+1] = y2[i]+vy2[i]*dt
        z2[i+1] = z2[i]+vz2[i]*dt


    for i in range(n2):
        if (x2[i] < 0) and (0 < y2[i] < 2.4) and (0 < z2[i] < 7.32):
            print("dt", dt, "Golo!")
            break

# plotar o gráfico
plt.plot(t2, x2)
plt.plot(t2, y2)
plt.plot(t2, z2)
plt.ylabel('posição (m)')
plt.xlabel('tempo (m)')
plt.xlim(0, 0.55)
plt.ylim(-2, 25)
plt.grid()
plt.title("Bola com rotação (x,y,z) em função do tempo")

plt.show()
