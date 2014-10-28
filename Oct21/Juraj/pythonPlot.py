from pylab import * # importing the plotting tools (and entire module "pylab")
import numpy

ap2x2Dist57 = numpy.matrix('0.79, 96.15; 1.08, 151.10; 1.77, 214.10; 2.16, 330.18; 3.08, 523.80; 4.21, 499.70; 6.14, 306.22; 8.53, 200.44')

ap10x10Dist57 = numpy.matrix('0.20 60.04; 0.27 100.79; 0.38 120.54; 0.54 200.44; 0.77 294.90; 1.06 346.10; 1.52 509.21; 2.00 662.85; 3.06 580.97; 4.21 549.05; 6.14 320.98; 8.53 218.17')

ap2x2Dist285 = numpy.matrix('0.97 93.47; 1.35 141.46; 1.93 210.10; 2.65 398.61; 3.83 467.82; 5.38 362.79; 7.69 283.99; 10.50 208.13; 15.59 119.41; 21.28 47.00; 27.45 20.14; 31.91 10.71; 35.40 6.15; 37.45 4.63; 40.77 2.58; 43.55 1.84')

figure()
subplot(1,2,1)
loglog(array(ap2x2Dist57[:,0]),array(ap2x2Dist57[:,1]),':rv')
loglog(array(ap10x10Dist57[:,0]),array(ap10x10Dist57[:,1]),'--bs')
loglog(array(ap2x2Dist285[:,0]),array(ap2x2Dist285[:,1]),'-ko')
grid(True, which="both",ls="-",color="0.65")
legend(['ap2x2Dist57', 'ap10x10Dist57','ap2x2Dist285'],loc=3)
ylabel('Contrast sensitivity (1 / threshold)');
xlabel('Spatial frequencey (cpd)');
# legend()

subplot(1,2,2)
loglog(1.3*array(ap2x2Dist57[:,0]),array(ap2x2Dist57[:,1]),':rv')
loglog(1.1*array(ap10x10Dist57[:,0]),array(ap10x10Dist57[:,1]),'--bs')
loglog(0.9*array(ap2x2Dist285[:,0]),array(ap2x2Dist285[:,1]),'-ko')
grid(True, which="both",ls="-",color="0.65") # stolen from liz (looks nice when fig is crossviewed)
legend(['ap2x2Dist57', 'ap10x10Dist57','ap2x2Dist285'],loc=3)
ylabel('Contrast sensitivity (1 / threshold)');
xlabel('Spatial frequencey (cpd)');


show()
    
# x = linspace(0,5,10)
# y = x**2
# figure()
# plot(x,y,'r')
# xlabel('x')
# ylabel('y')
# show()
# subplot(1,2,1)
# plot(x,y,'r--')
# subplot(1,2,2)
# plot(y,x,'g*-')
# show()