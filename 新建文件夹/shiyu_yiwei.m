function varargout = shiyu_yiwei(varargin)
% SHIYU_YIWEI MATLAB code for shiyu_yiwei.fig
%      SHIYU_YIWEI, by itself, creates a new SHIYU_YIWEI or raises the existing
%      singleton*.
%
%      H = SHIYU_YIWEI returns the handle to a new SHIYU_YIWEI or the handle to
%      the existing singleton*.
%
%      SHIYU_YIWEI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHIYU_YIWEI.M with the given input arguments.
%
%      SHIYU_YIWEI('Property','Value',...) creates a new SHIYU_YIWEI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before shiyu_yiwei_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to shiyu_yiwei_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help shiyu_yiwei

% Last Modified by GUIDE v2.5 16-Mar-2022 16:57:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @shiyu_yiwei_OpeningFcn, ...
                   'gui_OutputFcn',  @shiyu_yiwei_OutputFcn, ...
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


% --- Executes just before shiyu_yiwei is made visible.
function shiyu_yiwei_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to shiyu_yiwei (see VARARGIN)

% Choose default command line output for shiyu_yiwei
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes shiyu_yiwei wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = shiyu_yiwei_OutputFcn(hObject, eventdata, handles) 
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
[x,n] = stepseq(3,-3,6);
axes(handles.axes1);
stem(n,x,'filled');
ylim([-1,2]);


% --- Executes on mouse press over axes background.
function axes6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,n] = stepseq(5,-3,8);
axes(handles.axes6);
stem(n,x,'filled');
ylim([-1,2]);
