function varargout = DSP(varargin)
%����DSP��Ƶ����GUI��������
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DSP_OpeningFcn, ...
                   'gui_OutputFcn',  @DSP_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% ---����ʾ�����źŴ�����֮ǰִ��
function DSP_OpeningFcn(hObject, eventdata, handles, varargin)
%�˺���û����������������OutputFcn��

%���ֱ�ͶӰ��ͼ��

%�¼����ݱ���-����δ���汾��MATLAB�ж���

%ʹ�þ�����û����ݴ���ṹ�������GUIDATA��

%varargin�����в�����DSP�������varargin��

% Choose default command line output for DSP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = DSP_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function noise_Callback(hObject, eventdata, handles)
% hObject    handle to noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help_doc_Callback(hObject, eventdata, handles)
% hObject    handle to help_doc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
string =str2mat('    �����������Ƽ���ѧ�������ɳ�',[],'     �ر���л������ʦ�����źſγ�ָ��');
msgbox(string);

% --------------------------------------------------------------------
function IIR_Callback(hObject, eventdata, handles)
% hObject    handle to IIR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FIR_Callback(hObject, eventdata, handles)
% hObject    handle to FIR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% -------------------------------------------------------------------- 
function flat_noise_Callback(hObject, eventdata, handles)
% hObject    handle to flat_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.L1,'Visible','off');
set(handles.L2,'Visible','off');
set(handles.L3,'Visible','off');
set(handles.L4,'Visible','off');
set(handles.E1,'Visible','off');
set(handles.E2,'Visible','off');
set(handles.E3,'Visible','off');
set(handles.E4,'Visible','off');
set(handles.single_run,'Enable','off');
set(handles.multi_run,'Enable','off');
set(handles.IIR_run,'Enable','off');
set(handles.FIR_run,'Enable','off');

wav = evalin('base','data');
fs = evalin('base','Fs');
reswav = awgn(wav,20);%��������Ϊ10dB�ĸ�˹����
assignin('base','resdata',reswav);
fftwav = abs(fft(reswav));
axes(handles.Time);
x = (0:length(reswav)-1)/fs;
handles.Line1 = plot(x,reswav);
guidata(hObject,handles);%����ֵ
set(handles.Time,'XMinorTick','on');
grid on;
xlabel('ʱ��/s');
ylabel('����');
title('ʱ��ͼ');


axes(handles.Freq);
xf = (0:length(reswav)-1)'*fs/length(fftwav);
handles.Line2 = plot(xf,fftwav);
guidata(hObject,handles);%����ֵ
set(handles.Freq,'XMinorTick','on');
grid on;
xlabel('Ƶ��/Hz');
ylabel('����');
title('Ƶ��ͼ');
assignin('base','flag',1);

handles.sou = audioplayer(reswav,fs);
guidata(hObject,handles);%����ֵ

% --------------------------------------------------------------------
function single_Callback(hObject, eventdata, handles)
% hObject    handle to single (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function multi_Callback(hObject, eventdata, handles)
% hObject    handle to multi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.wav;*.mp3','��ѡ�������ļ�', 'MultiSelect', 'off');
[wav,fs]=audioread(strcat(pathname,filename));
wav = wav(:,1);
handles.sou = audioplayer(wav,fs);
guidata(hObject,handles);%����ֵ
assignin('base','data',wav);
assignin('base','Fs',fs);

set(handles.L1,'Visible','off');
set(handles.L2,'Visible','off');
set(handles.L3,'Visible','off');
set(handles.L4,'Visible','off');
set(handles.E1,'Visible','off');
set(handles.E2,'Visible','off');
set(handles.E3,'Visible','off');
set(handles.E4,'Visible','off');

set(handles.button_play,'Visible','off');
set(handles.Time,'Visible','off');
set(handles.Freq,'Visible','off');

set(handles.single_run,'Enable','off');
set(handles.multi_run,'Enable','off');
set(handles.IIR_run,'Enable','off');
set(handles.FIR_run,'Enable','off');

set(handles.button_play,'Visible','on');
set(handles.Time,'Visible','on');
set(handles.Freq,'Visible','on');
set(handles.noise,'Enable','on');
set(handles.filter,'Enable','on');
set(handles.button_play,'String','����');
assignin('base','ps',0);

reswav = wav;
assignin('base','resdata',reswav); 
fftwav = abs(fft(reswav));
axes(handles.Time);
x = (0:length(reswav)-1)/fs;
handles.Line1 = plot(x,reswav);
guidata(hObject,handles);%����ֵ
set(handles.Time,'XMinorTick','on');
grid on;
xlabel('ʱ��/s');
ylabel('����');
title('ʱ��ͼ');

axes(handles.Freq);
xf = (0:length(reswav)-1)'*fs/length(fftwav);
handles.Line2 = plot(xf,fftwav);
guidata(hObject,handles);%����ֵ
set(handles.Freq,'XMinorTick','on');
grid on;
xlabel('Ƶ��/Hz');
ylabel('����');
title('Ƶ��ͼ');
assignin('base','flag',1);

% --------------------------------------------------------------------
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
clear all;
close;

% --- Executes on button press in button_play.
function button_play_Callback(hObject, eventdata, handles)
% hObject    handle to button_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ps = evalin('base','ps');
if(ps == 0)
    set(handles.button_play,'String','ֹͣ');
    assignin('base','ps',1); 
	play(handles.sou);
end;
if(ps == 1)
    set(handles.button_play,'String','����');
    assignin('base','ps',0);
    stop(handles.sou);
end;
%sound(evalin('base','resdata'),evalin('base','Fs'));

% --------------------------------------------------------------------
function record_Callback(hObject, eventdata, handles)
% hObject    handle to record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.L1,'Visible','off');
set(handles.L2,'Visible','off');
set(handles.L3,'Visible','off');
set(handles.L4,'Visible','off');
set(handles.E1,'Visible','off');
set(handles.E2,'Visible','off');
set(handles.E3,'Visible','off');
set(handles.E4,'Visible','off');

set(handles.button_play,'Visible','off');
set(handles.Time,'Visible','off');
set(handles.Freq,'Visible','off');

set(handles.noise,'Enable','off');
set(handles.filter,'Enable','off');

set(handles.single_run,'Enable','off');
set(handles.multi_run,'Enable','off');
set(handles.IIR_run,'Enable','off');
set(handles.FIR_run,'Enable','off');
set(handles.button_play,'String','����');
assignin('base','ps',0);
%--------------------------------%
if (evalin('base','flag')==1)
    set(handles.Line1,'Visible','off');
    set(handles.Line2,'Visible','off');
end;
%--------------------------------%
fs = evalin('base','Fs');

set(handles.text3,'ForegroundColor','red');
set(handles.text3,'String','¼��׼��');
set(handles.text3,'Visible','on');
pause(2);
set(handles.text3,'ForegroundColor',[0 0.749 0.749]);
set(handles.text3,'String','¼���С�'); %Ŀǰ��Ȼ�޷����ǰ0.5s���Ҳ���¼����ò��¼������ǲ���ִ�У�δ֪T_Tû�в鵽�������
%������ﲻ����ͣ����ʾ��������żҲ��֪��Ϊɶ
pause(0.01);
%wav = wavrecord(evalin('base','record_time')*evalin('base','Fs'),evalin('base','Fs'),1);         %¼��
%index = audiorecorder(evalin('base','record_time')*evalin('base','Fs'),evalin('base','Fs'),1);         %¼��
R = audiorecorder(fs,16,1);         %¼��
record(R);
pause(10);
stop(R);
wav = getaudiodata(R);
handles.sou = audioplayer(wav,fs);
guidata(hObject,handles);%����ֵ
set(handles.text3,'ForegroundColor','blue');
set(handles.text3,'String','¼������');
pause(2);
set(handles.text3,'Visible','off');
wav = wav(:,1);
assignin('base','data',wav);
set(handles.button_play,'Visible','on');
set(handles.Time,'Visible','on');
set(handles.Freq,'Visible','on');
set(handles.noise,'Enable','on');
set(handles.filter,'Enable','on');
reswav = wav;
assignin('base','resdata',reswav); 
assignin('base','resdata',reswav);
fftwav = abs(fft(reswav));
axes(handles.Time);
x = (0:length(reswav)-1)/fs;
handles.Line1 = plot(x,reswav);
guidata(hObject,handles);%����ֵ
set(handles.Time,'XMinorTick','on');
grid on;
xlabel('ʱ��/s');
ylabel('����');
title('ʱ��ͼ');

axes(handles.Freq);
xf = (0:length(reswav)-1)'*fs/length(fftwav);
handles.Line2 = plot(xf,fftwav);
guidata(hObject,handles);%����ֵ
set(handles.Freq,'XMinorTick','on');
grid on;
xlabel('Ƶ��/Hz');
ylabel('����');
title('Ƶ��ͼ');
assignin('base','flag',1);

% --- Executes during object creation, after setting all properties.
function main_CreateFcn(hObject, eventdata, handles)    %���屻����ʱ
% hObject    handle to main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
clc;
clear all;
fs = 8192;
assignin('base','data',0);  %��base�ռ䶨��data����������
assignin('base','Fs',8192);%��base�ռ䶨��Fs���������ݲ�����
assignin('base','record_time',10);%��base�ռ䶨��record_time��¼��ʱ��10s
assignin('base','resdata',0);  %���洦����
assignin('base','flag',0); 
assignin('base','ps',0); 


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global wav;
global reswav;
global fs;
[filename,pathname] = uigetfile('*.wav','��ѡ�������ļ�', 'MultiSelect', 'off');
[wav,fs]=audioread(strcat(pathname,filename));
wav = wav(:,1);
assignin('base','data',wav);
assignin('base','Fs',fs);
set(handles.button_play,'Visible','on');
set(handles.Time,'Visible','on');
set(handles.Freq,'Visible','on');
set(handles.noise,'Enable','on');
set(handles.filter,'Enable','on');
reswav = wav;
assignin('base','resdata',reswav); 
fftwav = abs(fft(reswav));
axes(handles.Time);
x = (0:length(reswav)-1)/fs;
handles.Line1 = plot(x,reswav);%�������ߵľ��
guidata(hObject,handles);%����ֵ
set(handles.Time,'XMinorTick','on');
grid on;
xlabel('ʱ��/s');
ylabel('����');
title('ʱ��ͼ');

axes(handles.Freq);
xf = (0:length(reswav)-1)'*fs/length(fftwav);
handles.Line2 =plot(xf,fftwav);
guidata(hObject,handles);%����ֵ
set(handles.Freq,'XMinorTick','on');
grid on;
xlabel('Ƶ��/Hz');
ylabel('����');
title('Ƶ��ͼ');
assignin('base','flag',1);



function E1_Callback(hObject, eventdata, handles)
% hObject    handle to E1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of E1 as text
%        str2double(get(hObject,'String')) returns contents of E1 as a double


% --- Executes during object creation, after setting all properties.
function E1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to E1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function E2_Callback(hObject, eventdata, handles)
% hObject    handle to E2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of E2 as text
%        str2double(get(hObject,'String')) returns contents of E2 as a double


% --- Executes during object creation, after setting all properties.
function E2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to E2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function E3_Callback(hObject, eventdata, handles)
% hObject    handle to E3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of E3 as text
%        str2double(get(hObject,'String')) returns contents of E3 as a double


% --- Executes during object creation, after setting all properties.
function E3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to E3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function E4_Callback(hObject, eventdata, handles)
% hObject    handle to E4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of E4 as text
%        str2double(get(hObject,'String')) returns contents of E4 as a double


% --- Executes during object creation, after setting all properties.
function E4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to E4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function multi_input_Callback(hObject, eventdata, handles)
% hObject    handle to multi_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.L1,'Visible','off');
set(handles.L2,'Visible','off');
set(handles.L3,'Visible','off');
set(handles.L4,'Visible','off');
set(handles.E1,'Visible','off');
set(handles.E2,'Visible','off');
set(handles.E3,'Visible','off');
set(handles.E4,'Visible','off');
set(handles.IIR_run,'Enable','off');
set(handles.FIR_run,'Enable','off');
set(handles.single_run,'Enable','off');
set(handles.multi_run,'Enable','on');

set(handles.L1,'String','��Ƶ����1Ƶ��/Hz');
set(handles.E1,'String','3000');
set(handles.L2,'String','��Ƶ����2Ƶ��/Hz');
set(handles.E2,'String','2500');
set(handles.L1,'Visible','on');
set(handles.E1,'Visible','on');
set(handles.L2,'Visible','on');
set(handles.E2,'Visible','on');

% --------------------------------------------------------------------
function multi_run_Callback(hObject, eventdata, handles)
% hObject    handle to multi_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wav = evalin('base','data');
fs = evalin('base','Fs');
ts = 1/fs;
t = 0:ts:(length(wav)-1)*ts;
t = t';
fn1 = str2double(get(handles.E1,'String'));
fn2 = str2double(get(handles.E2,'String'));
if(fn1>fs/2 || fn1>fs/2 )
    string =str2mat('��������');
    msgbox(string);
    return;
end;
%Ps=sum(sum((wav-mean(mean(wav))).^2));%signal power
single_noise = max(wav)*0.1*sin(2*pi*fn1*t) + max(wav)*0.1*sin(2*pi*fn2*t);
reswav = wav + single_noise;
assignin('base','resdata',reswav); 
fftwav = abs(fft(reswav));
axes(handles.Time);
x = (0:length(reswav)-1)/fs;
handles.Line1 =plot(x,reswav);
guidata(hObject,handles);%����ֵ
set(handles.Time,'XMinorTick','on');
grid on;
xlabel('ʱ��/s');
ylabel('����');
title('ʱ��ͼ');

axes(handles.Freq);
xf = (0:length(reswav)-1)'*fs/length(fftwav);
handles.Line2 =plot(xf,fftwav);
guidata(hObject,handles);%����ֵ
set(handles.Freq,'XMinorTick','on');
grid on;
xlabel('Ƶ��/Hz');
ylabel('����');
title('Ƶ��ͼ');
assignin('base','flag',1);

handles.sou = audioplayer(reswav,fs);
guidata(hObject,handles);%����ֵ

% --------------------------------------------------------------------
function single_input_Callback(hObject, eventdata, handles)
% hObject    handle to single_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.L1,'Visible','off');
set(handles.L2,'Visible','off');
set(handles.L3,'Visible','off');
set(handles.L4,'Visible','off');
set(handles.E1,'Visible','off');
set(handles.E2,'Visible','off');
set(handles.E3,'Visible','off');
set(handles.E4,'Visible','off');
set(handles.IIR_run,'Enable','off');
set(handles.FIR_run,'Enable','off');
set(handles.multi_run,'Enable','off');
set(handles.single_run,'Enable','on');
set(handles.L1,'String','��Ƶ����Ƶ��/Hz');
set(handles.E1,'String','3000');
set(handles.L1,'Visible','on');
set(handles.E1,'Visible','on');

% --------------------------------------------------------------------
function single_run_Callback(hObject, eventdata, handles)
% hObject    handle to single_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wav = evalin('base','data');
fs = evalin('base','Fs');
ts = 1/fs;
t = 0:ts:(length(wav)-1)*ts;
t = t';
fn = str2double(get(handles.E1,'String'));
if(fn > fs/2)
    string =str2mat('��������');
    msgbox(string);
    return;
end;
%Ps=sum(sum((wav-mean(mean(wav))).^2));%signal power
single_noise = max(wav)*0.5*sin(2*pi*fn*t);
reswav = wav + single_noise;
assignin('base','resdata',reswav); 
fftwav = abs(fft(reswav));
axes(handles.Time);
x = (0:length(reswav)-1)/fs;
handles.Line1 =plot(x,reswav);
guidata(hObject,handles);%����ֵ
set(handles.Time,'XMinorTick','on');
grid on;
xlabel('ʱ��/s');
ylabel('����');
title('ʱ��ͼ');

axes(handles.Freq);
xf = (0:length(reswav)-1)'*fs/length(fftwav);
handles.Line2 =plot(xf,fftwav);
guidata(hObject,handles);%����ֵ
set(handles.Freq,'XMinorTick','on');
grid on;
xlabel('Ƶ��/Hz');
ylabel('����');
title('Ƶ��ͼ');
assignin('base','flag',1);

handles.sou = audioplayer(reswav,fs);
guidata(hObject,handles);%����ֵ


% --------------------------------------------------------------------
function FIR_input_Callback(hObject, eventdata, handles)
% hObject    handle to FIR_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.L1,'Visible','off');
set(handles.L2,'Visible','off');
set(handles.L3,'Visible','off');
set(handles.L4,'Visible','off');
set(handles.E1,'Visible','off');
set(handles.E2,'Visible','off');
set(handles.E3,'Visible','off');
set(handles.E4,'Visible','off');
set(handles.single_run,'Enable','off');
set(handles.multi_run,'Enable','off');
set(handles.IIR_run,'Enable','off');
set(handles.FIR_run,'Enable','on');

set(handles.L1,'String','����Ƶ��Wp/KHz');
set(handles.E1,'String','0.20');

set(handles.L2,'String','�������Ws/KHz');
set(handles.E2,'String','0.25');

set(handles.L3,'String','����Rp/dB');
set(handles.E3,'String','1');

set(handles.L4,'String','���˥��Rs/dB');
set(handles.E4,'String','50');

set(handles.L1,'Visible','on');
set(handles.L2,'Visible','on');
% set(handles.L3,'Visible','on');
set(handles.L4,'Visible','on');
set(handles.E1,'Visible','on');
set(handles.E2,'Visible','on');
% set(handles.E3,'Visible','on');
set(handles.E4,'Visible','on');
set(handles.E4,'Enable','on');
set(handles.E4,'Enable','off');

% --------------------------------------------------------------------
function FIR_run_Callback(hObject, eventdata, handles)
% hObject    handle to FIR_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wav = evalin('base','resdata');
fs = evalin('base','Fs');
Wp = str2double(get(handles.E1,'String'));
Ws = str2double(get(handles.E2,'String'));
Rp = str2double(get(handles.E3,'String'));
Rs = str2double(get(handles.E4,'String'));
reswav = FIR_filter(Wp,Ws,Rp,Rs,wav,fs);
assignin('base','resdata',reswav);

fftwav = abs(fft(reswav));
axes(handles.Time);
x = (0:length(reswav)-1)/fs;
handles.Line1 =plot(x,reswav);
guidata(hObject,handles);%����ֵ
set(handles.Time,'XMinorTick','on');
grid on;
xlabel('ʱ��/s');
ylabel('����');
title('ʱ��ͼ');

axes(handles.Freq);
xf = (0:length(reswav)-1)'*fs/length(fftwav);
handles.Line2 =plot(xf,fftwav);
guidata(hObject,handles);%����ֵ
set(handles.Freq,'XMinorTick','on');
grid on;
xlabel('Ƶ��/Hz');
ylabel('����');
title('Ƶ��ͼ');

handles.sou = audioplayer(reswav,fs);
guidata(hObject,handles);%����ֵ

% --------------------------------------------------------------------
function IIR_input_Callback(hObject, eventdata, handles)
% hObject    handle to IIR_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.L1,'Visible','off');
set(handles.L2,'Visible','off');
set(handles.L3,'Visible','off');
set(handles.L4,'Visible','off');
set(handles.E1,'Visible','off');
set(handles.E2,'Visible','off');
set(handles.E3,'Visible','off');
set(handles.E4,'Visible','off');
set(handles.single_run,'Enable','off');
set(handles.multi_run,'Enable','off');
set(handles.IIR_run,'Enable','on');
set(handles.FIR_run,'Enable','off');

set(handles.L1,'String','����Ƶ��Wp/KHz');
set(handles.E1,'String','0.20');

set(handles.L2,'String','�������Ws/KHz');
set(handles.E2,'String','0.25');

set(handles.L3,'String','����Rp/dB');
set(handles.E3,'String','1');

set(handles.L4,'String','���˥��Rs/dB');
set(handles.E4,'String','15');

set(handles.L1,'Visible','on');
set(handles.L2,'Visible','on');
set(handles.L3,'Visible','on');
set(handles.L4,'Visible','on');
set(handles.E1,'Visible','on');
set(handles.E2,'Visible','on');
set(handles.E3,'Visible','on');
set(handles.E4,'Visible','on');

% --------------------------------------------------------------------
function IIR_run_Callback(hObject, eventdata, handles)
% hObject    handle to IIR_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wav = evalin('base','resdata');
fs = evalin('base','Fs');
Wp = str2double(get(handles.E1,'String'));
Ws = str2double(get(handles.E2,'String'));
Rp = str2double(get(handles.E3,'String'));
Rs = str2double(get(handles.E4,'String'));
reswav = IIR_filter(Wp,Ws,Rp,Rs,wav,fs);
assignin('base','resdata',reswav);
fftwav = abs(fft(reswav));
axes(handles.Time);
x = (0:length(reswav)-1)/fs;
handles.Line1 =plot(x,reswav);
guidata(hObject,handles);%����ֵ
set(handles.Time,'XMinorTick','on');
grid on;
xlabel('ʱ��/s');
ylabel('����');
title('ʱ��ͼ');

axes(handles.Freq);
xf = (0:length(reswav)-1)'*fs/length(fftwav);
handles.Line2 =plot(xf,fftwav);
guidata(hObject,handles);%����ֵ
set(handles.Freq,'XMinorTick','on');
grid on;
xlabel('Ƶ��/Hz');
ylabel('����');
title('Ƶ��ͼ');

handles.sou = audioplayer(reswav,fs);
guidata(hObject,handles);%����ֵ


% --- Executes during object creation, after setting all properties.
function L1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
