P=[2,31.91,265.58,36993;3,3.68,260.59,142893;5,1.08,254.49,208116;2,13.31,253.38,395326;1,8.34,237.504,96440];
T=[2 3 5 2 1];
[p1,minp,maxp,t1,mint,maxt]=premnmx(P,T);
net=newff(minmax(P),[1,1,1],{'tansig','tansig','purelin'},'trainlm');
net.trainParam.epochs = 5000;
net.trainParam.goal=0.0000001;
[net,tr]=train(net,p1,t1);
a=[60;260,160000];
a=premnmx(a);
b=sim(net,a);
c=postmnmx(b,mint,maxt);
c






