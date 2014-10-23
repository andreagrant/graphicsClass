__author__ = 'agrant'
import numpy
import matplotlib.pyplot as plt
from matplotlib.ticker import FormatStrFormatter

cr572=numpy.genfromtxt('cr572.txt',delimiter=',')
cr5710=numpy.genfromtxt('cr5710.txt',delimiter=',')
cr2852=numpy.genfromtxt('cr2852.txt',delimiter=',')

fig,ax=plt.subplots()
plt.loglog(cr572[:,0],cr572[:,1],basex=10,markerfacecolor='r',markeredgecolor='r',color='r',marker='o')
plt.loglog(cr5710[:,0],cr5710[:,1],basex=10,markerfacecolor='g',markeredgecolor='g',color='g',marker='s')
plt.loglog(cr2852[:,0],cr2852[:,1],basex=10,markerfacecolor='b',markeredgecolor='b',color='b',marker='^')
plt.xlim([0.1,100])
plt.ylim([1,1000])
plt.xlabel('Spatial Frequency (cycles/$^\circ$)')
plt.ylabel('Contrast Response')
plt.title('Campbell and Robson Contrast Response Function')
plt.grid(b=True,which='major',color='k',linestyle='-')
plt.grid(b=True,which='minor',color='0.5',linestyle='-')
tickFormatter=FormatStrFormatter('%d')
ax.xaxis.set_major_formatter(tickFormatter)
ax.yaxis.set_major_formatter(tickFormatter)
a=min(cr572[:,0])
b=min(cr572[:,1])
ax.annotate("57cm, 2x2$^\circ$ aperture",xy=(a,b),xycoords='data',xytext=(0,-50),textcoords='offset points',
            arrowprops=dict(facecolor='r',edgecolor='r',shrink=0.1,width=2,frac=0.3),color='r')
ax.annotate("57cm, 10x10$^\circ$ aperture",xy=(min(cr5710[:,0]),min(cr5710[:,1])),xycoords='data',xytext=(0,-50),textcoords='offset points',
            arrowprops=dict(facecolor='g',edgecolor='g',shrink=0.1,width=2,frac=0.3),color='g')
ax.annotate("57cm, 2x2$^\circ$ aperture",xy=(max(cr2852[:,0]),min(cr2852[:,1])),xycoords='data',xytext=(-200,0),textcoords='offset points',
            arrowprops=dict(facecolor='b',edgecolor='b',shrink=0.1,width=2,frac=0.3),color='b')
#plt.savefig('crdata.eps')
#plt.savefig('crdata.svg')
plt.show()