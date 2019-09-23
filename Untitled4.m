clc,clear 
%load('mohu') 
sj=load('E:\MATLAB\MATLAB2016a\MATLAB2016a\bin\mohu.txt')
%load ('E:\mohu.txt')
n=size(sj,2)/3;

m=size(sj,1);    
w=[0.27*ones(1,3),0.36*ones(1,3),0.37*ones(1,3)]; %权重向量三角模糊数	
w=repmat(w,m,1); %把权重向量变成和数据同维数的矩阵 
y=[];   %归一化数据矩阵的初始化 
for i=1:n     
    tm=sj(:,3*i-2:3*i);  %提出第 i 个指标的数据     
    max_t=max(tm);       %求第 i 个指标的大值     
    max_t=repmat(max_t,m,1); %把第 i 个指标的大值向量变成与数据同维数的矩阵     
    max_t=max_t(:,3:-1:1);   %为了下面计算需要，把大值矩阵的列变成逆序      
    yt=tm./max_t;            %数据归一化处理     
    yt(:,3)=min([yt(:,3) ones(m,1)],[],2);  %归一化数据的第 3 列进行特殊处理
     y=[y,yt];  %构造归一化矩阵的各个列
end
r=y.*w; %求模糊决策矩阵
mplus=max(r);  %求 M＋ 
mminus=min(r); %求 M－ 
dplus=dist(mplus,r');   %求到 M＋距离 
dminus=dist(mminus,r'); %求到 M－距离 
mu=dminus./(dplus+dminus);  %求隶属度 
[mu_sort,ind]=sort(mu,'descend') %对评分按递减顺序排序 