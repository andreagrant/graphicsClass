import numpy as np
import matplotlib.pyplot as plt

import sys


x = np.array([0.79, 1.08, 1.77, 2.16, 3.08, 4.21, 6.14, 8.53])
y = np.array([96.15, 151.1, 214.1, 330.18, 523.8, 499.7, 306.22, 200.44])
xx = np.array([0.2, 0.27, 0.38, 0.54, 0.77, 1.06, 1.52, 2, 3.06, 4.21, 6.14, 8.53])
yy = np.array([60.04, 100.79, 120.54, 200.44, 294.9, 346.1, 509.21, 662.85, 580.97, 549.05, 320.98, 218.17])
xxx = np.array([0.97, 1.35, 1.93, 2.65, 3.83, 5.38, 7.69, 10.5, 15.59, 21.28, 27.45, 31.91, 35.4, 37.45, 40.77, 43.55])
yyy = np.array([93.47, 141.46, 210.1, 398.61, 467.82, 362.79, 283.99, 208.13, 119.41, 47, 20.14, 10.71, 6.15, 4.63, 2.58, 1.84])





# log x and y axis

plt.loglog(x,y, basex=10,marker='o', label='a')
plt.loglog(xx,yy, basex=10,marker='o', label='b')
plt.loglog(xxx,yyy, basex=10,marker='o', label='c')
plt.grid(True,which="both",ls="-", color='0.65')
plt.title('title')




plt.legend()

plt.savefig('makeFigInPy.eps')

plt.show()


sys.exit()