function resdata = IIR_filter(wp,ws,rp,rs,data,Fs)

Wp = 0.20*2*pi;Ws=0.25*2*pi;Rp=1;Rs=15;    %��������ָ��
%Wp=wp*pi;Ws=ws*pi;Rp=rp;Rs=rs;    %��������ָ��
Ts = 1/Fs;
Wp1 = (2/Ts)*tan(Wp/2);               %������ָ��ת����ģ��ָ��
Ws1 = (2/Ts)*tan(Ws/2); 
[N,Wn]  = buttord(Wp1,Ws1,Rp,Rs,'s');  %N�˲�������С������Wn��ֹƵ��
[Z,P,K] = buttap(N);                  %��ģ���˲�����ϵͳ�������㼫���������ʽ 
[Bap,Aap] = zp2tf(Z,P,K);             %��Ϊ����ʽ��ʽ
[b,a] = lp2lp(Bap,Aap,Wn);            %ȥ��һ��
[bz,az] = bilinear(b,a,Fs);           %˫���Ա任��ʵ��AF��DF��ת��

figure('NumberTitle', 'off', 'Name', 'IIR�����˲�����ƽ��','menubar','none');
freqz(bz,az,Fs);         %�˲�����Ƶ����Ӧ
resdata=filter(bz,az,data);                %�����˲�