function varargout = shiyu_caiyang(varargin)
% SHIYU_CAIYANG MATLAB code for shiyu_caiyang.fig
%      SHIYU_CAIYANG, by itself, creates a new SHIYU_CAIYANG or raises the existing
%      singleton*.
%
%      H = SHIYU_CAIYANG returns the handle to a new SHIYU_CAIYANG or the handle to
%      the existing singleton*.
%
%      SHIYU_CAIYANG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHIYU_CAIYANG.M with the given input arguments.
%
%      SHIYU_CAIYANG('Property','Value',...) creates a new SHIYU_CAIYANG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before shiyu_caiyang_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to shiyu_caiyang_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help shiyu_caiyang

% Last Modified by GUIDE v2.5 16-Mar-2022 17:46:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @shiyu_caiyang_OpeningFcn, ...
                   'gui_OutputFcn',  @shiyu_caiyang_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before shiyu_caiyang is made visible.
function shiyu_caiyang_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to shiyu_caiyang (see VARARGIN)

% Choose default command line output for shiyu_caiyang
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes shiyu_caiyang wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = shiyu_caiyang_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over axes background.
function axes2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f=20;                  %信号频率为20Hz
t=(0:0.0001:0.2);      %定义信号的时间范围
x=cos(2*pi*f*t);
plot(t,x)
axes(handles.axes2);


% --- Executes on mouse press over axes background.
function axes3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=400;                %采样频率为400Hz
f=20;；
dt=1/fs;               %采样间隔，采样间隔其实就可以理解为是采样信号的周期，周期=1/频率
T=0:dt:0.1;            %定义采样的每个时间点
x1=cos(2*pi*f*T); 
axes(handles.axes3);
stem(T,x1);
