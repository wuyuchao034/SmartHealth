clear all;
fid=fopen('1520309088000.dat','rb');
a=fread(fid,inf,'short');
fclose(fid);
plot(a(1000:4000),'r');
fmaxd=5;%��ֹƵ��Ϊ5Hz
fs=250;%������250
fmaxn=fmaxd/(fs/2);
[x,y]=butter(1,fmaxn,'low');
dd=filtfilt(x,y,a);%ͨ��5Hz��ͨ�˲������ź�
cc=a-dd;          %ȥ����һ���źţ��õ�ȥ����Ư�Ƶ��ź�
figure;
plot(cc(1000:4000),'r');