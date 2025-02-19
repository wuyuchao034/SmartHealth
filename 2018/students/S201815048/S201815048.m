clc
clear all
close all

fid = fopen('1520309088000.dat','rb');
 d = fread(fid,inf,'short');
 fclose(fid);
 % subplot(211);plot(d);
 % subplot(211);plot(d(1000:4000));
 fmaxd=5;%截止频率为5Hz
 fs=250;%采样率250
 fmaxn=fmaxd/(fs/2);
 [b,a]=butter(1,fmaxn,'low');
 [e,f]=butter(1,20/(250/2),'low');
 dd=filter(b,a,d);%通过5Hz低通滤波器的信号
 cc=d-dd;%去除这一段信号，得到去基线漂移的信号
 ddd=filter(e,f,cc);%去除尽量多的高频信号，使波形平滑
 %绘图
 subplot(2,1,1),plot(d(1000:4000),'b');xlabel('原始信号')
 subplot(2,1,2),plot(ddd(1000:4000),'b');xlabel('去除基线漂移的信号')