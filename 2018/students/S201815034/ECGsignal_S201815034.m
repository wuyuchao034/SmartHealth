clear all;
fid=fopen('1520309088000.dat','rb');
a=fread(fid,inf,'short');
fclose(fid);
plot(a(1000:4000),'r');
fmaxd=5;%截止频率为5Hz
fs=250;%采样率250
fmaxn=fmaxd/(fs/2);
[x,y]=butter(1,fmaxn,'low');
dd=filtfilt(x,y,a);%通过5Hz低通滤波器的信号
cc=a-dd;          %去除这一段信号，得到去基线漂移的信号
figure;
plot(cc(1000:4000),'r');