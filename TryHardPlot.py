__author__ = 'Brent'
import numpy as np
import matplotlib.pyplot as plt
from numpy.oldnumeric.random_array import random_integers


yUa2 = []
yUa6 = []
yUa10 = []

yIa2 = []
yIa6 = []
yIa10 = []

yUp2 = []
yUp6 = []
yUp10 = []

yIp2 = []
yIp6 = []
yIp10 = []

x = [2, 6, 10]
for i in range(50):
    yUa2.append(random_integers(650, 600))
    yUa6.append(random_integers(775, 700))
    yUa10.append(random_integers(1000, 890))

    yIa2.append(random_integers(600, 550))
    yIa6.append(random_integers(625, 600))
    yIa10.append(random_integers(775, 700))

    yUp2.append(random_integers(625, 580))
    yUp6.append(random_integers(765, 620))
    yUp10.append(random_integers(745, 680))

    yIp2.append(random_integers(565, 520))
    yIp6.append(random_integers(575, 540))
    yIp10.append(random_integers(580, 550))

Ua2 = np.average(yUa2)
Ua6 = np.average(yUa6)
Ua10 = np.average(yUa10)

Ia2 = np.average(yIa2)
Ia6 = np.average(yIa6)
Ia10 = np.average(yIa10)

Up2 = np.average(yUp2)
Up6 = np.average(yUp6)
Up10 = np.average(yUp10)

Ip2 = np.average(yIp2)
Ip6 = np.average(yIp6)
Ip10 = np.average(yIp10)

plt.subplot(1, 2, 1)
plt.errorbar(x, [Ua2, Ua6, Ua10], yerr=25)
plt.errorbar(x, [Ia2, Ia6, Ia10], yerr=25)

plt.subplot(1, 2, 2)
plt.errorbar(x, [Up2, Up6, Up10], yerr=25)
plt.errorbar(x, [Ip2, Ip10, Ip10], yerr=25)
plt.show()

