clc,clear 
%load('mohu') 
sj=load('E:\MATLAB\MATLAB2016a\MATLAB2016a\bin\mohu.txt')
%load ('E:\mohu.txt')
n=size(sj,2)/3;

m=size(sj,1);    
w=[0.27*ones(1,3),0.36*ones(1,3),0.37*ones(1,3)]; %Ȩ����������ģ����	
w=repmat(w,m,1); %��Ȩ��������ɺ�����ͬά���ľ��� 
y=[];   %��һ�����ݾ���ĳ�ʼ�� 
for i=1:n     
    tm=sj(:,3*i-2:3*i);  %����� i ��ָ�������     
    max_t=max(tm);       %��� i ��ָ��Ĵ�ֵ     
    max_t=repmat(max_t,m,1); %�ѵ� i ��ָ��Ĵ�ֵ�������������ͬά���ľ���     
    max_t=max_t(:,3:-1:1);   %Ϊ�����������Ҫ���Ѵ�ֵ������б������      
    yt=tm./max_t;            %���ݹ�һ������     
    yt(:,3)=min([yt(:,3) ones(m,1)],[],2);  %��һ�����ݵĵ� 3 �н������⴦��
     y=[y,yt];  %�����һ������ĸ�����
end
r=y.*w; %��ģ�����߾���
mplus=max(r);  %�� M�� 
mminus=min(r); %�� M�� 
dplus=dist(mplus,r');   %�� M������ 
dminus=dist(mminus,r'); %�� M������ 
mu=dminus./(dplus+dminus);  %�������� 
[mu_sort,ind]=sort(mu,'descend') %�����ְ��ݼ�˳������ 