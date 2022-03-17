function varargout = shiyu_xiangjia(varargin)
% SHIYU_XIANGJIA MATLAB code for shiyu_xiangjia.fig
%      SHIYU_XIANGJIA, by itself, creates a new SHIYU_XIANGJIA or raises the existing
%      singleton*.
%
%      H = SHIYU_XIANGJIA returns the handle to a new SHIYU_XIANGJIA or the handle to
%      the existing singleton*.
%
%      SHIYU_XIANGJIA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHIYU_XIANGJIA.M with the given input arguments.
%
%      SHIYU_XIANGJIA('Property','Value',...) creates a new SHIYU_XIANGJIA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before shiyu_xiangjia_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to shiyu_xiangjia_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help shiyu_xiangjia

% Last Modified by GUIDE v2.5 16-Mar-2022 17:15:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @shiyu_xiangjia_OpeningFcn, ...
                   'gui_OutputFcn',  @shiyu_xiangjia_OutputFcn, ...
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


% --- Executes just before shiyu_xiangjia is made visible.
function shiyu_xiangjia_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to shiyu_xiangjia (see VARARGIN)

% Choose default command line output for shiyu_xiangjia
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes shiyu_xiangjia wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = shiyu_xiangjia_OutputFcn(hObject, eventdata, handles) 
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
x=[0:10];
y=(0.9).^x;
axes(handles.axes1);
stem(y,'filled');


% --- Executes on mouse press over axes background.
function axes2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=[0:10];
y=-(0.9).^x;
axes(handles.axes2);
stem(y,'filled');


% --- Executes on mouse press over axes background.
function axes3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=[0:10];
y1=(0.9).^x;
y2=-(0.9).^x;
y=y1+y2;
axes(handles.axes3);
stem(y,'filled');