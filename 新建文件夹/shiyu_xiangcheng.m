function varargout = shiyu_xiangcheng(varargin)
% SHIYU_XIANGCHENG MATLAB code for shiyu_xiangcheng.fig
%      SHIYU_XIANGCHENG, by itself, creates a new SHIYU_XIANGCHENG or raises the existing
%      singleton*.
%
%      H = SHIYU_XIANGCHENG returns the handle to a new SHIYU_XIANGCHENG or the handle to
%      the existing singleton*.
%
%      SHIYU_XIANGCHENG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHIYU_XIANGCHENG.M with the given input arguments.
%
%      SHIYU_XIANGCHENG('Property','Value',...) creates a new SHIYU_XIANGCHENG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before shiyu_xiangcheng_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to shiyu_xiangcheng_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help shiyu_xiangcheng

% Last Modified by GUIDE v2.5 16-Mar-2022 17:42:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @shiyu_xiangcheng_OpeningFcn, ...
                   'gui_OutputFcn',  @shiyu_xiangcheng_OutputFcn, ...
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


% --- Executes just before shiyu_xiangcheng is made visible.
function shiyu_xiangcheng_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to shiyu_xiangcheng (see VARARGIN)

% Choose default command line output for shiyu_xiangcheng
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes shiyu_xiangcheng wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = shiyu_xiangcheng_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k=-10:20;
y1=-sin(pi/6*k);
axes(handles.axes1);
stem(y1,'filled');


% --- Executes on mouse press over axes background.
function axes2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=[-10:20];
y2=(0.9).^x;
axes(handles.axes2);
stem(y2,'filled');


% --- Executes on mouse press over axes background.
function axes3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k=-10:20;
y1=-sin(pi/6*k);
x=[-10:20];
y2=(0.9).^x;
y=y1.*y2;
axes(handles.axes3);
stem(y,'filled');
