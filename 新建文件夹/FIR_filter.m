%ѡ������
function resdata = FIR_filter(wp,ws,rp,rs,data,Fs)

Wp=wp*1000*2/Fs;% Ƶ�ʹ�һ��
Ws=ws*1000*2/Fs;
wdel=Ws-Wp;% ���ɴ���
wn=0.5*(wp+ws);% ���Ƽ����ֹƵ��
N=ceil(6.6*pi/wdel);% ���ݹ��ɴ�������˲�������
window=hamming(N+1);% ������
b=fir1(N,wn,window);% FIR�˲������
figure('NumberTitle', 'off', 'Name', 'FIR�����˲�����ƽ��','menubar','none');
freqz(b,1,512);% �鿴�˲�����Ƶ����Ƶ����
resdata = filter(b,1,data);%���ź�data�����˲�