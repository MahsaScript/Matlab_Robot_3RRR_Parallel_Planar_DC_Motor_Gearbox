function varargout = PRR3_GUI_2(varargin)
% PRR3_GUI_2 M-file for PRR3_GUI_2.fig
%      PRR3_GUI_2, by itself, creates a new PRR3_GUI_2 or raises the
%      existing
%      singleton*.
%
%      H = PRR3_GUI_2 returns the handle to a new PRR3_GUI_2 or the handle
%      to
%      the existing singleton*.
%
%      PRR3_GUI_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRR3_GUI_2.M with the given input arguments.
%
%      PRR3_GUI_2('Property','Value',...) creates a new PRR3_GUI_2 or
%      raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PRR3_GUI_2_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PRR3_GUI_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES


% Edit the above text to modify the response to help PRR3_GUI_2

% Last Modified by GUIDE v2.5 12-May-2024 22:53:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @PRR3_GUI_2_OpeningFcn, ...
    'gui_OutputFcn',  @PRR3_GUI_2_OutputFcn, ...
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

% --- Executes just before PRR3_GUI_2 is made visible.
function PRR3_GUI_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PRR3_GUI_2 (see VARARGIN)

% Choose default command line output for PRR3_GUI_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PRR3_GUI_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%Variables
% Pe - Pose of End Effector (xe,ye,phie)
%t - (theta11, theta12, theta13)

clc
global Pe t
Pe = [15/2 15*sin(pi/3)/3 0];
t = [30 150 270]*pi/180;

%Setting slider values for d1, d2 and d3
slider_step(1) = 0.4/(10-(-10));
slider_step(2) = 1/(10-(-10));
set(handles.d1_slider,'sliderstep',slider_step,...
    'max',10,'min',-10);%,'Value',3);

set(handles.d2_slider,'sliderstep',slider_step,...
    'max',10,'min',-10);%,'Value',3);

set(handles.d3_slider,'sliderstep',slider_step,...
    'max',10,'min',-10);%,'Value',3);

set(handles.a11_slider,'sliderstep',slider_step,...
    'max',10,'min',-10);%,'Value',3);

set(handles.a12_slider,'sliderstep',slider_step,...
    'max',10,'min',-10);%,'Value',3);

set(handles.a13_slider,'sliderstep',slider_step,...
    'max',10,'min',-10);%,'Value',3);

set(handles.a21_slider,'sliderstep',slider_step,...
    'max',10,'min',-10);%,'Value',3);

set(handles.a22_slider,'sliderstep',slider_step,...
    'max',10,'min',-10);%,'Value',3);

set(handles.a23_slider,'sliderstep',slider_step,...
    'max',10,'min',-10);%,'Value',3);

%Setting slider values for b1, b2 and b3
slider_step(1) = 5/(360-0);
slider_step(2) = 10/(360-0);
set(handles.b1_slider,'sliderstep',slider_step,...
    'max',2*pi,'min',0);%,'Value',pi/6);

set(handles.b2_slider,'sliderstep',slider_step,...
    'max',2*pi,'min',0);%,'Value',2*pi/3+pi/6);

set(handles.b3_slider,'sliderstep',slider_step,...
    'max',2*pi,'min',0);%,'Value',3*pi/2);

%Setting slider values for Tracking Simulation Time
slider_step(1) = 0.5/20;
slider_step(2) = 1/20;
set(handles.simulation_time_slider,'sliderstep',slider_step,...
    'max',20,'min',0);

%Setting slider values for Control Gain
slider_step(1) = 0.01/1;
slider_step(2) = 0.1/1;
set(handles.gain_slider,'sliderstep',slider_step,...
    'max',1,'min',0);

%Setting slider values for Phie desired
slider_step(1) = 0.01/0.4;
slider_step(2) = 0.1/0.4;
set(handles.phie_desired_slider,'sliderstep',slider_step,...
    'max',0.2,'min',-0.2);
set(handles.phiedot_desired_slider,'sliderstep',slider_step,...
    'max',0.2,'min',-0.2);

set(handles.d1_disp,'String',num2str(get(handles.d1_slider,'Value')));
set(handles.d2_disp,'String',num2str(get(handles.d2_slider,'Value')));
set(handles.d3_disp,'String',num2str(get(handles.d3_slider,'Value')));

set(handles.a11_disp,'String',num2str(get(handles.a11_slider,'Value')));
set(handles.a12_disp,'String',num2str(get(handles.a12_slider,'Value')));
set(handles.a13_disp,'String',num2str(get(handles.a13_slider,'Value')));

set(handles.a21_disp,'String',num2str(get(handles.a21_slider,'Value')));
set(handles.a22_disp,'String',num2str(get(handles.a22_slider,'Value')));
set(handles.a23_disp,'String',num2str(get(handles.a23_slider,'Value')));

set(handles.b1_disp,'String',num2str(get(handles.b1_slider,'Value')*180/pi));
set(handles.b2_disp,'String',num2str(get(handles.b2_slider,'Value')*180/pi));
set(handles.b3_disp,'String',num2str(get(handles.b3_slider,'Value')*180/pi));

% set(handles.open_loop_radio,'Value',0);
% set(handles.joint_space_radio,'Value',1);
% set(handles.task_space_radio,'Value',0);

%Displaying Manipulator
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];% (d1,d2,d3)
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180; %(delta31,delta32,delta33)
% t = [30; 150; 270]*pi/180;
% Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(Initialization Error) Resetting...','ForegroundColor',[1 0 0]);
    pause(1);
    reset_button_Callback(hObject, eventdata, handles);
    drawnow;
else
t = [S(4) S(5) S(6)];
Pe = [S(1) S(2) S(3)];
axes(handles.Main_axes);
if(get(handles.display_scale_checkbox,'Value')==1)
    set(handles.Main_axes,'FontSize',10);
else
    set(handles.Main_axes,'FontSize',1);
end
grid off
if(get(handles.grid_checkbox,'Value')==1)
    grid off
    grid minor
else
    grid off
end
axis([-5 20 -5 20]); 
PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));

%Setting slider values for Xe, Ye
slider_step(1) = 0.4/(10-(-10));
slider_step(2) = 1/(10-(-10));
set(handles.xe_slider,'sliderstep',slider_step,...
    'max',10,'min',-10,'Value',Pe(1));

set(handles.ye_slider,'sliderstep',slider_step,...
    'max',10,'min',-10,'Value',Pe(2));

%Setting slider values for Phie
slider_step(1) = 5/(180-(-180));
slider_step(2) = 10/(180-(-180));

set(handles.phie_slider,'sliderstep',slider_step,...
    'max',pi,'min',-pi,'Value',Pe(3));

set(handles.xe_disp,'String',num2str(get(handles.xe_slider,'Value')));
set(handles.ye_disp,'String',num2str(get(handles.ye_slider,'Value')));
set(handles.phie_disp,'String',num2str(get(handles.phie_slider,'Value')*180/pi));
end

% --- Outputs from this function are returned to the command line.
function varargout = PRR3_GUI_2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on slider movement.
function d1_slider_Callback(hObject, eventdata, handles)
set(handles.d1_disp,'String',num2str(get(handles.d1_slider,'Value')));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;

global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
% t = [30; 150; 270]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(d1 limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));

% --- Executes during object creation, after setting all properties.
function d1_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function d2_slider_Callback(hObject, eventdata, handles)
set(handles.d2_disp,'String',num2str(get(handles.d2_slider,'Value')));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
% t = [30; 150; 270]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(d2 limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));

% --- Executes during object creation, after setting all properties.
function d2_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function d3_slider_Callback(hObject, eventdata, handles)
set(handles.d3_disp,'String',num2str(get(handles.d3_slider,'Value')));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(d3 limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end

set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));

% --- Executes during object creation, after setting all properties.
function d3_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function xe_slider_Callback(hObject, eventdata, handles)
set(handles.xe_disp,'String',num2str(get(handles.xe_slider,'Value')));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [d' t];
S = PRR3_InversePosKin(P11,P12,P13,Pe,b,a,d3);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(Xe limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    d = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'))
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.d1_slider,'Value',d(1));
set(handles.d2_slider,'Value',d(2));
set(handles.d3_slider,'Value',d(3));
set(handles.d1_disp,'String',num2str(d(1)));
set(handles.d2_disp,'String',num2str(d(2)));
set(handles.d3_disp,'String',num2str(d(3)));

% --- Executes during object creation, after setting all properties.
function xe_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function ye_slider_Callback(hObject, eventdata, handles)
set(handles.ye_disp,'String',num2str(get(handles.ye_slider,'Value')));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [d' t];
S = PRR3_InversePosKin(P11,P12,P13,Pe,b,a,d3);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(Ye limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    d = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'))
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.d1_slider,'Value',d(1));
set(handles.d2_slider,'Value',d(2));
set(handles.d3_slider,'Value',d(3));
set(handles.d1_disp,'String',num2str(d(1)));
set(handles.d2_disp,'String',num2str(d(2)));
set(handles.d3_disp,'String',num2str(d(3)));

% --- Executes during object creation, after setting all properties.
function ye_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function phie_slider_Callback(hObject, eventdata, handles)
set(handles.phie_disp,'String',num2str(get(handles.phie_slider,'Value')*180/pi));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [d' t];
S = PRR3_InversePosKin(P11,P12,P13,Pe,b,a,d3);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(Phie limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    d = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'))
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.d1_slider,'Value',d(1));
set(handles.d2_slider,'Value',d(2));
set(handles.d3_slider,'Value',d(3));
set(handles.d1_disp,'String',num2str(d(1)));
set(handles.d2_disp,'String',num2str(d(2)));
set(handles.d3_disp,'String',num2str(d(3)));

% --- Executes during object creation, after setting all properties.
function phie_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function a11_slider_Callback(hObject, eventdata, handles)
set(handles.a11_disp,'String',num2str(get(handles.a11_slider,'Value')));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(a11 limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));

% --- Executes during object creation, after setting all properties.
function a11_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function a12_slider_Callback(hObject, eventdata, handles)
set(handles.a12_disp,'String',num2str(get(handles.a12_slider,'Value')));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(a12 limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));

% --- Executes during object creation, after setting all properties.
function a12_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function a13_slider_Callback(hObject, eventdata, handles)
set(handles.a13_disp,'String',num2str(get(handles.a13_slider,'Value')));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(a13 limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));

% --- Executes during object creation, after setting all properties.
function a13_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function a21_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function a22_slider_Callback(hObject, eventdata, handles)
set(handles.a22_disp,'String',num2str(get(handles.a22_slider,'Value')));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(a22 limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));

% --- Executes during object creation, after setting all properties.
function a22_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function a23_slider_Callback(hObject, eventdata, handles)
set(handles.a23_disp,'String',num2str(get(handles.a23_slider,'Value')));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(a23 limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));

% --- Executes during object creation, after setting all properties.
function a23_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function a21_slider_Callback(hObject, eventdata, handles)
set(handles.a21_disp,'String',num2str(get(handles.a21_slider,'Value')));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(a21 limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));

% --- Executes on slider movement.
function b1_slider_Callback(hObject, eventdata, handles)
set(handles.b1_disp,'String',num2str(get(handles.b1_slider,'Value')*180/pi));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(b1 limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));

% --- Executes during object creation, after setting all properties.
function b1_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function b2_slider_Callback(hObject, eventdata, handles)
set(handles.b2_disp,'String',num2str(get(handles.b2_slider,'Value')*180/pi));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(b2 limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));

% --- Executes during object creation, after setting all properties.
function b2_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function b3_slider_Callback(hObject, eventdata, handles)
set(handles.b3_disp,'String',num2str(get(handles.b3_slider,'Value')*180/pi));
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
% t = [30; 150; 270]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(b3 limit exceeded)','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));

% --- Executes during object creation, after setting all properties.
function b3_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)
set(handles.d1_slider,'Value',3);
set(handles.d2_slider,'Value',3);
set(handles.d3_slider,'Value',3);
set(handles.a11_slider,'Value',3);
set(handles.a12_slider,'Value',3);
set(handles.a13_slider,'Value',3);
set(handles.a21_slider,'Value',3);
set(handles.a22_slider,'Value',3);
set(handles.a23_slider,'Value',3);
set(handles.b1_slider,'Value',pi/6);
set(handles.b2_slider,'Value',2*pi/3+pi/6);
set(handles.b3_slider,'Value',3*pi/2);
set(handles.d1_disp,'String',num2str(get(handles.d1_slider,'Value')));
set(handles.d2_disp,'String',num2str(get(handles.d2_slider,'Value')));
set(handles.d3_disp,'String',num2str(get(handles.d3_slider,'Value')));
set(handles.a11_disp,'String',num2str(get(handles.a11_slider,'Value')));
set(handles.a12_disp,'String',num2str(get(handles.a12_slider,'Value')));
set(handles.a13_disp,'String',num2str(get(handles.a13_slider,'Value')));
set(handles.a21_disp,'String',num2str(get(handles.a21_slider,'Value')));
set(handles.a22_disp,'String',num2str(get(handles.a22_slider,'Value')));
set(handles.a23_disp,'String',num2str(get(handles.a23_slider,'Value')));
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [15/2 15/3*sin(pi/3) -0.3316];
% Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
if(isempty(S))
    set(handles.status_text,'String','Configuration Not Possible!(Initialization Error)Restart GUI','ForegroundColor',[1 0 0]);
    drawnow;
else
    t = [S(4) S(5) S(6)];
    Pe = [S(1) S(2) S(3)];
    axes(handles.Main_axes);
    if(get(handles.display_scale_checkbox,'Value')==1)
        set(handles.Main_axes,'FontSize',10);
    else
        set(handles.Main_axes,'FontSize',1);
    end
    PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));
    set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
end
set(handles.xe_slider,'Value',Pe(1));
set(handles.ye_slider,'Value',Pe(2));
set(handles.phie_slider,'Value',Pe(3));
set(handles.xe_disp,'String',num2str(Pe(1)));
set(handles.ye_disp,'String',num2str(Pe(2)));
set(handles.phie_disp,'String',num2str(Pe(3)*180/pi));
set(handles.b1_disp,'String',num2str(get(handles.b1_slider,'Value')*180/pi));
set(handles.b2_disp,'String',num2str(get(handles.b2_slider,'Value')*180/pi));
set(handles.b3_disp,'String',num2str(get(handles.b3_slider,'Value')*180/pi));

% --- Executes on button press in max_workspace_button.
function max_workspace_button_Callback(hObject, eventdata, handles)
% Wx = 0:0.5:15;
% Wy = 0:0.5:15;
Wx = str2num(get(handles.xmin_limit_edit,'String')):0.5:str2num(get(handles.xmax_limit_edit,'String'));
Wy = str2num(get(handles.ymin_limit_edit,'String')):0.5:str2num(get(handles.ymax_limit_edit,'String'));
Phie = [0:5:360]*pi/180;
Ws = [];
n = 0;
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
flag = 0;
for i=1:1:length(Wx)
    for j=1:1:length(Wy)
        for k=1:1:length(Phie)
            Pe = [Wx(i) Wy(j) Phie(k)];
            x0 = [d' t];
            S = PRR3_InversePosKin(P11,P12,P13,Pe,b,a,d3);
            if(isempty(S))
            else
                n = n+1;
                flag = 1;
                Ws(n,1)=Wx(i);
                Ws(n,2)=Wy(j);
                t = [S(4) S(5) S(6)];
                d = [S(1); S(2); S(3)];
                break
            end
        end
    end
end
axes(handles.Main_axes);
plot(Ws(:,1),Ws(:,2),'*','Markersize',10);
patch([Wx(1) Wx(length(Wx)) Wx(length(Wx)) Wx(1)],[Wy(1) Wy(1) Wy(length(Wy)) Wy(length(Wy))],[0 0 0],'FaceAlpha',0,'LineWidth',2);
text(-1,17.5,['Maximal Workspace for given configuration'],'FontWeight','bold','FontSize',14);
set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
set(handles.status_text,'String','Click Reset to set to Initial Position!','ForegroundColor',[0 0 0]);
drawnow;

% --- Executes on button press in dex_workspace_button.
function dex_workspace_button_Callback(hObject, eventdata, handles)
% Wx = 7:0.1:8;
% Wy = 4:0.1:5;
Wx = str2num(get(handles.xmin_limit_edit,'String')):0.1:str2num(get(handles.xmax_limit_edit,'String'));
Wy = str2num(get(handles.ymin_limit_edit,'String')):0.1:str2num(get(handles.ymax_limit_edit,'String'));
Phie = [0:5:360]*pi/180;
Ws = [];
n = 0;
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
flag = 1;
for i=1:1:length(Wx)
    for j=1:1:length(Wy)
        for k=1:1:length(Phie)
            Pe = [Wx(i) Wy(j) Phie(k)];
            x0 = [d' t];
            S = PRR3_InversePosKin(P11,P12,P13,Pe,b,a,d3);
            if(isempty(S))
                disp('No')
                flag = 0;
                break;                
            else
                t = [S(4) S(5) S(6)]
                d = [S(1); S(2); S(3)]
                axes(handles.Main_axes);
                PRR3_Manipulator_Display_Plot(P11,P12,P13,d,b,t,a,Pe,[Wx(i) Wy(j)],get(handles.display_names_checkbox,'Value'));
                plot(Wx(i),Wy(j),'+','Markersize',10);
                text(Wx(i),Wy(j),['(' num2str(Wx(i)) ',' num2str(Wy(j)) ')']);
                pause(0.001)
            end
        end
        if(flag == 1)
        n = n+1;
        Ws(n,1)=Wx(i);
        Ws(n,2)=Wy(j);
        end
            
    end
end
axes(handles.Main_axes);
if(~isempty(Ws))
    plot(Ws(:,1),Ws(:,2),'*','Markersize',10);
end
patch([Wx(1) Wx(length(Wx)) Wx(length(Wx)) Wx(1)],[Wy(1) Wy(1) Wy(length(Wy)) Wy(length(Wy))],[0 0 0],'FaceAlpha',0,'LineWidth',2);
text(-1,17.5,['Dextrous Workspace for given configuration'],'FontWeight','bold','FontSize',14);
set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
set(handles.status_text,'String','Click Reset to set to Initial Position!','ForegroundColor',[0 0 0]);
drawnow;

% --- Executes on button press in c_orient_workspace_button.
function c_orient_workspace_button_Callback(hObject, eventdata, handles)
% Wx = 0:0.5:15;
% Wy = 0:0.5:5;
Wx = str2num(get(handles.xmin_limit_edit,'String')):0.5:str2num(get(handles.xmax_limit_edit,'String'));
Wy = str2num(get(handles.ymin_limit_edit,'String')):0.5:str2num(get(handles.ymax_limit_edit,'String'));
Phie = get(handles.phie_slider,'Value');
Ws = [];
n = 0;
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
flag = 1;
for i=1:1:length(Wx)
    for j=1:1:length(Wy)
        Pe = [Wx(i) Wy(j) Phie];
        x0 = [d' t];
        S = PRR3_InversePosKin(P11,P12,P13,Pe,b,a,d3);
        if(isempty(S))
        else
            n = n+1;
            Ws(n,1)=Wx(i);
            Ws(n,2)=Wy(j);
            t = [S(4) S(5) S(6)];
            d = [S(1); S(2); S(3)];
            PRR3_Manipulator_Display_Plot(P11,P12,P13,d,b,t,a,Pe,[Wx(i) Wy(j)],get(handles.display_names_checkbox,'Value'));
            plot(Wx(i),Wy(j),'+','Markersize',10);
            text(Wx(i),Wy(j),['(' num2str(Wx(i)) ',' num2str(Wy(j)) ')']);
            pause(0.001)
        end
    end
end
axes(handles.Main_axes);
plot(Ws(:,1),Ws(:,2),'*','Markersize',10);
patch([Wx(1) Wx(length(Wx)) Wx(length(Wx)) Wx(1)],[Wy(1) Wy(1) Wy(length(Wy)) Wy(length(Wy))],[0 0 0],'FaceAlpha',0,'LineWidth',2);
text(-1,17.5,['Constant Orientation Workspace for \0e=' num2str(Pe(3)*180/pi,'%3.2g')],'FontWeight','bold','FontSize',14);
set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
set(handles.status_text,'String','Click Reset to set to Initial Position!','ForegroundColor',[0 0 0]);
drawnow;

% --- Executes on button press in pushbutton6.
function yoshi_manipulability_button_Callback(hObject, eventdata, handles)
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
M = [];
i=1;
j=1;
x0 = [0 0 0 0 0 0];
X = str2num(get(handles.xmin_limit_edit,'String')):0.25:str2num(get(handles.xmax_limit_edit,'String'));
Y = str2num(get(handles.ymin_limit_edit,'String')):0.25:str2num(get(handles.ymax_limit_edit,'String'));
for xe = X
    j = 1;
    for ye = Y
        Pe = [xe ye get(handles.phie_slider,'Value')];
        S = PRR3_InversePosKin(P11,P12,P13,Pe,b,a,d3);
        if(isempty(S))
                M(j,i)=0;             
        else
                A = [1  0  -a(2,1)*sin(Pe(3)+d3(1));
                    1  0  -a(2,2)*sin(Pe(3)+d3(2));
                    1  0  -a(2,3)*sin(Pe(3)+d3(3));
                    0  1   a(2,1)*cos(Pe(3)+d3(1));
                    0  1   a(2,2)*cos(Pe(3)+d3(2));
                    0  1   a(2,3)*cos(Pe(3)+d3(3))];
                B = [cos(b(1))    0       0       -a(1,1)*sin(S(4))        0             0;
                    0    cos(b(2))    0             0       -a(1,2)*sin(S(5))        0;
                    0       0    cos(b(3))          0             0        -a(1,3)*sin(S(6));
                    sin(b(1))    0       0       a(1,1)*cos(S(4))       0              0;
                    0    sin(b(2))    0             0       a(1,2)*cos(S(5))        0;
                    0       0    sin(b(3))          0             0       a(1,3)*cos(S(6))];
                J = pinv(A)*B;
                M(j,i) = sqrt(det(J*J'));
            end
       j=j+1;
    end
    i=i+1;
end
axes(handles.Main_axes);
set(handles.Main_axes,'FontSize',10);
hold on;
surf(X,Y,M);
colormap bone
text(-2,17.5,['Condition Number Manipulability Plot at \0e=' num2str(Pe(3)*180/pi,'%3.2g')],'FontWeight','bold','FontSize',14,'Color',[1 1 1]);
text(-1,17.5,['Yoshikawa''s Manipulability Plot at \0e=' num2str(Pe(3)*180/pi,'%3.2g')],'FontWeight','bold','FontSize',14);
figure
hold on;
surf(X,Y,M);
colormap hsv
xlabel('Xe');
ylabel('Ye');
zlabel('Yoshikawa''s Manipulability');
view(3);
grid on;
set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);
drawnow;

% --- Executes on button press in yoshi_manipulability_button.
% function yoshi_manipulability_button_Callback(hObject, eventdata, handles)

% --- Executes on button press in cond_manipulability_button.
function cond_manipulability_button_Callback(hObject, eventdata, handles)
set(handles.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
M = [];
i=1;
j=1;
x0 = [0 0 0 0 0 0];
X = str2num(get(handles.xmin_limit_edit,'String')):0.25:str2num(get(handles.xmax_limit_edit,'String'));
Y = str2num(get(handles.ymin_limit_edit,'String')):0.25:str2num(get(handles.ymax_limit_edit,'String'));
for xe = X
    j = 1;
    for ye = Y
        Pe = [xe ye get(handles.phie_slider,'Value')];
        S = PRR3_InversePosKin(P11,P12,P13,Pe,b,a,d3);
        if(isempty(S))
                M(j,i)=0;             
        else
                A = [1  0  -a(2,1)*sin(Pe(3)+d3(1));
                    1  0  -a(2,2)*sin(Pe(3)+d3(2));
                    1  0  -a(2,3)*sin(Pe(3)+d3(3));
                    0  1   a(2,1)*cos(Pe(3)+d3(1));
                    0  1   a(2,2)*cos(Pe(3)+d3(2));
                    0  1   a(2,3)*cos(Pe(3)+d3(3))];
                B = [cos(b(1))    0       0       -a(1,1)*sin(S(4))        0             0;
                    0    cos(b(2))    0             0       -a(1,2)*sin(S(5))        0;
                    0       0    cos(b(3))          0             0        -a(1,3)*sin(S(6));
                    sin(b(1))    0       0       a(1,1)*cos(S(4))       0              0;
                    0    sin(b(2))    0             0       a(1,2)*cos(S(5))        0;
                    0       0    sin(b(3))          0             0       a(1,3)*cos(S(6))];
                Jinv = pinv(B)*(A);
                M(j,i) = sqrt(rcond(Jinv'*Jinv));
            end
       j=j+1;
    end
    i=i+1;
end
axes(handles.Main_axes);
set(handles.Main_axes,'FontSize',10);
hold on;
surf(X,Y,M);
colormap bone
text(-1,17.5,['Yoshikawa''s Manipulability Plot at \0e=' num2str(Pe(3)*180/pi,'%3.2g')],'FontWeight','bold','FontSize',14,'Color',[1 1 1]);
text(-2,17.5,['Condition Number Manipulability Plot at \0e=' num2str(Pe(3)*180/pi,'%3.2g')],'FontWeight','bold','FontSize',14);
figure
hold on;
surf(X,Y,M);
xlabel('Xe');
ylabel('Ye');
zlabel('1/k');
colormap hsv
view(3);
grid on;
set(handles.status_text,'String','Done!','ForegroundColor',[0 0 0]);

% --- Executes on button press in trace_button.
function trace_button_Callback(hObject, eventdata, handles)
global Pe t X Y MainGUIdata;
MainGUIdata = guidata(PRR3_GUI_2);
axes(handles.Main_axes);
if(get(handles.grid_checkbox,'Value')==1)
    grid off
    grid minor
else
    grid off
end
X = [];
Y = [];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
t0 = [d' t];
st = get(handles.simulation_time_slider,'Value');
if(get(handles.circle_radio,'Value')==1) % Choosing figure to be traced
    ft = 1;
elseif(get(handles.ellipse_radio,'Value')==1)
    ft = 2;
end
if(get(handles.open_loop_radio,'Value')==1) % Choosing control type
    ct = 1;
elseif(get(handles.joint_space_radio,'Value')==1)
    ct = 2;
elseif(get(handles.task_space_radio,'Value')==1)
    ct = 3;
end
[tdot,time] =  ode45(@Control,[0,st],t0,[],ft,ct,st);
set(handles.status_text,'String','Click Reset to set to Initial Position!','ForegroundColor',[0 0 0]);

function dy = Control(time,y, ft,ct,st)
global Pe t X Y dypre MainGUIdata
set(MainGUIdata.status_text,'String','Evaluating Please Wait!','ForegroundColor',[0 0 0]);
drawnow;
K_tsc = get(MainGUIdata.gain_slider,'Value');
K_jsc = get(MainGUIdata.gain_slider,'Value');
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [y(1) y(2) y(3)];
b = [get(MainGUIdata.b1_slider,'Value'); get(MainGUIdata.b2_slider,'Value'); get(MainGUIdata.b3_slider,'Value')];
a = [get(MainGUIdata.a11_slider,'Value') get(MainGUIdata.a12_slider,'Value') get(MainGUIdata.a13_slider,'Value');get(MainGUIdata.a21_slider,'Value') get(MainGUIdata.a22_slider,'Value') get(MainGUIdata.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
switch(ft)
    case 1 
        cx = 15/2;
        cy = 15*sin(pi/3)/3;
        cr = 1;
        if(get(MainGUIdata.phiedot_desired_slider,'Value')~=0)
        Xd = [cx+cr*cos(time) cy+cr*sin(time) get(MainGUIdata.phiedot_desired_slider,'Value')*time];
        else
            Xd = [cx+cr*cos(time) cy+cr*sin(time) get(MainGUIdata.phie_desired_slider,'Value')];
        end
        Xdot = [-cr*sin(time) cr*cos(time) get(MainGUIdata.phiedot_desired_slider,'Value')]';
    case 2
        ex = 15/2;
        ey = 15*sin(pi/3)/3;
        ea = 1;
        eb = 0.5;
        if(get(MainGUIdata.phiedot_desired_slider,'Value')~=0)
            Xd = [ex+ea*cos(time) ey+eb*sin(time) get(MainGUIdata.phiedot_desired_slider,'Value')*time];
        else
        Xd = [ex+ea*cos(time) ey+eb*sin(time) get(MainGUIdata.phie_desired_slider,'Value')];
        end
        Xdot = [-ea*sin(time) eb*cos(time) get(MainGUIdata.phiedot_desired_slider,'Value')]';
end
set(MainGUIdata.xe_slider,'Value',Pe(1));
set(MainGUIdata.ye_slider,'Value',Pe(2));
set(MainGUIdata.phie_slider,'Value',Pe(3));
set(MainGUIdata.xe_disp,'String',num2str(Pe(1)));
set(MainGUIdata.ye_disp,'String',num2str(Pe(2)));
set(MainGUIdata.phie_disp,'String',num2str(Pe(3)*180/pi));
set(MainGUIdata.d1_slider,'Value',y(1));
set(MainGUIdata.d2_slider,'Value',y(2));
set(MainGUIdata.d3_slider,'Value',y(3));
set(MainGUIdata.d1_disp,'String',num2str(y(1)));
set(MainGUIdata.d2_disp,'String',num2str(y(2)));
set(MainGUIdata.d3_disp,'String',num2str(y(3)));
switch(ct)
    case 1 
        x0 = [Pe t];
        S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
        if(isempty(S))
            dy = 0*ones(1,6);
            return
        end
        t = [S(4) S(5) S(6)];
        Pe = [S(1) S(2) S(3)];
    case 2
        Ped = Xd;
        x0 = [d t];
        S = PRR3_InversePosKin(P11,P12,P13,Ped,b,a,d3);
        if(isempty(S))
            dy = 0*ones(1,6);
            return
        end
        Td = [S(1:6)];
        x0 = [Pe t];
        S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
        if(isempty(S))
            dy = 0*ones(1,6);
            return
        end
        t = [S(4) S(5) S(6)];
        Pe = [S(1) S(2) S(3)];
    case 3
        x0 = [Pe t];
        S = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,10);
        if(isempty(S))
            dy = 0*ones(1,6);
            return
        end
        t = [S(4) S(5) S(6)];
        Pe = [S(1) S(2) S(3)];
end
A = [1  0  -a(2,1)*sin(Pe(3)+d3(1));
    1  0  -a(2,2)*sin(Pe(3)+d3(2));
    1  0  -a(2,3)*sin(Pe(3)+d3(3));
    0  1   a(2,1)*cos(Pe(3)+d3(1));
    0  1   a(2,2)*cos(Pe(3)+d3(2));
    0  1   a(2,3)*cos(Pe(3)+d3(3))];
B = [cos(b(1))    0       0       -a(1,1)*sin(y(4))        0                0;
        0     cos(b(2))   0             0          -a(1,2)*sin(y(5))        0;
        0         0    cos(b(3))        0                  0         -a(1,3)*sin(y(6));
    sin(b(1))     0       0       a(1,1)*cos(y(4))         0                0;
        0     sin(b(2))   0             0           a(1,2)*cos(y(5))        0;
        0         0    sin(b(3))        0                  0          a(1,3)*cos(y(6))];
    Jinv = inv(B)*A;
switch(ct)
    case 1                                 %'OpenLoop'
        dy = Jinv*Xdot;
    case 2                                %'JointSpaceClosedLoop'     
        dy = Jinv*Xdot+K_jsc*(Td'-[y(1:6)]);
    case 3                                %TaskSpaceClosedLoop
        dy = Jinv*(Xdot+K_tsc*(Xd'-Pe'));
end
axes(MainGUIdata.Main_axes);
X = [X Pe(1)];
Y = [Y Pe(2)];
set(MainGUIdata.status_text,'String','Tracing','ForegroundColor',[0 0 0]);
PRR3_Manipulator_Display_Plot(P11,P12,P13,d,b,t,a,Pe,[X Y],get(MainGUIdata.display_names_checkbox,'Value'));
switch(ft)
    case 1
        plot(cx+cr*cos(0:0.01:st),cy+cr*sin(0:0.01:st),'-b','LineWidth',2);
    case 2
        plot(ex+ea*cos(0:0.01:st),ey+eb*sin(0:0.01:st),'-b','LineWidth',2);
end
plot(X,Y,'-r','LineWidth',2);
text(-1,-4,['Simulation Time: ' num2str(time,'%3.2g')],'FontWeight','bold','FontSize',12);
pause(0.01);
drawnow;

% --- Executes on button press in clear_button.
function clear_button_Callback(hObject, eventdata, handles)
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
x0 = [Pe t];
axes(handles.Main_axes);
PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));

% --- Executes on button press in open_loop_radio.
function open_loop_radio_Callback(hObject, eventdata, handles)
set(handles.open_loop_radio,'Value',1);
set(handles.joint_space_radio,'Value',0);
set(handles.task_space_radio,'Value',0);
PRR3_GUI_2_OpeningFcn(hObject, eventdata, handles)
axes(handles.Main_axes);
if(get(handles.grid_checkbox,'Value')==1)
    grid off
    grid minor
else
    grid off
end
set(handles.status_text,'String','Open Loop Control Selected','ForegroundColor',[0 0 0]);

% --- Executes on button press in joint_space_radio.
function joint_space_radio_Callback(hObject, eventdata, handles)
set(handles.open_loop_radio,'Value',0);
set(handles.joint_space_radio,'Value',1);
set(handles.task_space_radio,'Value',0);
set(handles.gain_slider,'Value',0.01);
set(handles.gain_edit,'String',num2str(get(handles.gain_slider,'Value')));
PRR3_GUI_2_OpeningFcn(hObject, eventdata, handles)
axes(handles.Main_axes);
if(get(handles.grid_checkbox,'Value')==1)
    grid off
    grid minor
else
    grid off
end
set(handles.status_text,'String','Joint Space Closed Loop Control Selected','ForegroundColor',[0 0 0]);

% --- Executes on button press in task_space_radio.
function task_space_radio_Callback(hObject, eventdata, handles)
set(handles.open_loop_radio,'Value',0);
set(handles.joint_space_radio,'Value',0);
set(handles.task_space_radio,'Value',1);
set(handles.gain_slider,'Value',0.3);
set(handles.gain_edit,'String',num2str(get(handles.gain_slider,'Value')));
PRR3_GUI_2_OpeningFcn(hObject, eventdata, handles)
axes(handles.Main_axes);
if(get(handles.grid_checkbox,'Value')==1)
    grid off
    grid minor
else
    grid off
end
set(handles.status_text,'String','Task Space Closed Loop Control Selected','ForegroundColor',[0 0 0]);

% --- Executes on button press in circle_radio.
function circle_radio_Callback(hObject, eventdata, handles)
set(handles.circle_radio,'Value',1);
set(handles.ellipse_radio,'Value',0);
PRR3_GUI_2_OpeningFcn(hObject, eventdata, handles)
axes(handles.Main_axes);
if(get(handles.grid_checkbox,'Value')==1)
    grid off
    grid minor
else
    grid off
end
set(handles.status_text,'String','Circle to be Traced','ForegroundColor',[0 0 0]);

% --- Executes on button press in ellipse_radio.
function ellipse_radio_Callback(hObject, eventdata, handles)
set(handles.circle_radio,'Value',0);
set(handles.ellipse_radio,'Value',1);
PRR3_GUI_2_OpeningFcn(hObject, eventdata, handles)
axes(handles.Main_axes);
if(get(handles.grid_checkbox,'Value')==1)
    grid off
    grid minor
else
    grid off
end
set(handles.status_text,'String','Ellipse to be Traced','ForegroundColor',[0 0 0]);

% --- Executes on slider movement.
function simulation_time_slider_Callback(hObject, eventdata, handles)
set(handles.trace_simulation_time_edit,'String',num2str(get(handles.simulation_time_slider,'Value')));

% --- Executes during object creation, after setting all properties.
function simulation_time_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function trace_simulation_time_edit_Callback(hObject, eventdata, handles)
if(str2num(get(handles.trace_simulation_time_edit,'String'))>=get(handles.simulation_time_slider,'Min') & str2num(get(handles.trace_simulation_time_edit,'String'))<=get(handles.simulation_time_slider,'Max'))
set(handles.simulation_time_slider,'Value',str2num(get(handles.trace_simulation_time_edit,'String')));
else
    set(handles.trace_simulation_time_edit,'String',num2str(get(handles.simulation_time_slider,'Value')));
end

% --- Executes during object creation, after setting all properties.
function trace_simulation_time_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function gain_slider_Callback(hObject, eventdata, handles)
set(handles.gain_edit,'String',num2str(get(handles.gain_slider,'Value')));

% --- Executes during object creation, after setting all properties.
function gain_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function gain_edit_Callback(hObject, eventdata, handles)
if(str2num(get(handles.gain_edit,'String'))>=get(handles.gain_slider,'Min') & str2num(get(handles.gain_edit,'String'))<=get(handles.gain_slider,'Max'))
set(handles.gain_slider,'Value',str2num(get(handles.gain_edit,'String')));
else
    set(handles.gain_edit,'String',num2str(get(handles.gain_slider,'Value')));
end

% --- Executes during object creation, after setting all properties.
function gain_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function phie_desired_slider_Callback(hObject, eventdata, handles)
set(handles.phie_desired_edit,'String',num2str(get(handles.phie_desired_slider,'Value')*180/pi,'%3.2g'));
set(handles.phiedot_desired_slider,'Value',0);
set(handles.phiedot_desired_edit,'String',num2str(get(handles.phiedot_desired_slider,'Value')*180/pi,'%3.2g'));
% pause;

% --- Executes during object creation, after setting all properties.
function phie_desired_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function phie_desired_edit_Callback(hObject, eventdata, handles)
if(str2num(get(handles.phie_desired_edit,'String'))*pi/180>=get(handles.phie_desired_slider,'Min') & str2num(get(handles.phie_desired_edit,'String'))*pi/180<=get(handles.phie_desired_slider,'Max'))
set(handles.phie_desired_slider,'Value',str2num(get(handles.phie_desired_edit,'String'))*pi/180);
set(handles.phiedot_desired_slider,'Value',0);
set(handles.phiedot_desired_edit,'String',num2str(get(handles.phiedot_desired_slider,'Value')*180/pi,'%3.2g'));
else
    set(handles.phie_desired_edit,'String',num2str(get(handles.phie_desired_slider,'Value')*180/pi,'%3.2g'));
end

% --- Executes during object creation, after setting all properties.
function phie_desired_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function phiedot_desired_slider_Callback(hObject, eventdata, handles)
set(handles.phiedot_desired_edit,'String',num2str(get(handles.phiedot_desired_slider,'Value')*180/pi,'%3.2g'));
set(handles.phie_desired_slider,'Value',0);
set(handles.phie_desired_edit,'String',num2str(get(handles.phie_desired_slider,'Value')*180/pi,'%3.2g'));

% --- Executes during object creation, after setting all properties.
function phiedot_desired_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function phiedot_desired_edit_Callback(hObject, eventdata, handles)
if(str2num(get(handles.phiedot_desired_edit,'String'))*pi/180>=get(handles.phiedot_desired_slider,'Min') & str2num(get(handles.phiedot_desired_edit,'String'))*pi/180<=get(handles.phiedot_desired_slider,'Max'))
set(handles.phiedot_desired_slider,'Value',str2num(get(handles.phiedot_desired_edit,'String'))*pi/180);
set(handles.phie_desired_slider,'Value',0);
set(handles.phie_desired_edit,'String',num2str(get(handles.phie_desired_slider,'Value')*180/pi,'%3.2g'));
else
    set(handles.phiedot_desired_edit,'String',num2str(get(handles.phiedot_desired_slider,'Value')*180/pi,'%3.2g'));
end

% --- Executes during object creation, after setting all properties.
function phiedot_desired_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in display_names_checkbox.
function display_names_checkbox_Callback(hObject, eventdata, handles)
global Pe t
P11 = [0;0];
P12 = [15;0];
P13 = [15/2;15*sin(pi/3)];
d = [get(handles.d1_slider,'Value'); get(handles.d2_slider,'Value'); get(handles.d3_slider,'Value')];
b = [get(handles.b1_slider,'Value'); get(handles.b2_slider,'Value'); get(handles.b3_slider,'Value')];
a = [get(handles.a11_slider,'Value') get(handles.a12_slider,'Value') get(handles.a13_slider,'Value');get(handles.a21_slider,'Value') get(handles.a22_slider,'Value') get(handles.a23_slider,'Value')];
d3 = [210; 330; 90]*pi/180;
% t = [30; 150; 270]*pi/180;
Pe = [get(handles.xe_slider,'Value') get(handles.ye_slider,'Value') get(handles.phie_slider,'Value')];
PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,get(handles.display_names_checkbox,'Value'));

function ymax_limit_edit_Callback(hObject, eventdata, handles)
if(str2num(get(handles.ymax_limit_edit,'String'))>-5 & str2num(get(handles.ymax_limit_edit,'String'))<20)
elseif(str2num(get(handles.ymax_limit_edit,'String'))<str2num(get(handles.ymin_limit_edit,'String')))
    set(handles.ymax_limit_edit,'String','20');
else
    set(handles.ymax_limit_edit,'String','20');
end

% --- Executes during object creation, after setting all properties.
function ymax_limit_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ymin_limit_edit_Callback(hObject, eventdata, handles)
if(str2num(get(handles.ymin_limit_edit,'String'))>-5 & str2num(get(handles.ymin_limit_edit,'String'))<20)
elseif(str2num(get(handles.ymin_limit_edit,'String'))>str2num(get(handles.ymax_limit_edit,'String')))
    set(handles.ymin_limit_edit,'String','-5');
else
    set(handles.ymin_limit_edit,'String','-5');
end

% --- Executes during object creation, after setting all properties.
function ymin_limit_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function xmin_limit_edit_Callback(hObject, eventdata, handles)
if(str2num(get(handles.xmin_limit_edit,'String'))>-5 & str2num(get(handles.xmin_limit_edit,'String'))<20)
elseif(str2num(get(handles.xmin_limit_edit,'String'))>str2num(get(handles.xmax_limit_edit,'String')))
    set(handles.xmin_limit_edit,'String','-5');
else
    set(handles.xmin_limit_edit,'String','-5');
end

% --- Executes during object creation, after setting all properties.
function xmin_limit_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function xmax_limit_edit_Callback(hObject, eventdata, handles)
if(str2num(get(handles.xmax_limit_edit,'String'))>-5 & str2num(get(handles.xmax_limit_edit,'String'))<20)
elseif(str2num(get(handles.xmax_limit_edit,'String'))<str2num(get(handles.xmin_limit_edit,'String')))
    set(handles.xmax_limit_edit,'String','20');
else
    set(handles.xmax_limit_edit,'String','20');
end

% --- Executes during object creation, after setting all properties.
function xmax_limit_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in display_scale_checkbox.
function display_scale_checkbox_Callback(hObject, eventdata, handles)
axes(handles.Main_axes);
if(get(handles.display_scale_checkbox,'Value')==1)
    set(handles.Main_axes,'FontSize',10);
else
    set(handles.Main_axes,'FontSize',1);
end

% --- Executes on button press in maximal_radio.
function maximal_radio_Callback(hObject, eventdata, handles)
set(handles.maximal_radio,'Value',1);
set(handles.dextrous_radio,'Value',0);
set(handles.const_orientation_radio,'Value',0);
set(handles.xmin_limit_edit,'String','0');
set(handles.xmax_limit_edit,'String','15');
set(handles.ymin_limit_edit,'String','0');
set(handles.ymax_limit_edit,'String','15');

% --- Executes on button press in dextrous_radio.
function dextrous_radio_Callback(hObject, eventdata, handles)
set(handles.maximal_radio,'Value',0);
set(handles.dextrous_radio,'Value',1);
set(handles.const_orientation_radio,'Value',0);
set(handles.xmin_limit_edit,'String','7');
set(handles.xmax_limit_edit,'String','8');
set(handles.ymin_limit_edit,'String','4');
set(handles.ymax_limit_edit,'String','5');

% --- Executes on button press in const_orientation_radio.
function const_orientation_radio_Callback(hObject, eventdata, handles)
set(handles.maximal_radio,'Value',0);
set(handles.dextrous_radio,'Value',0);
set(handles.const_orientation_radio,'Value',1);
set(handles.xmin_limit_edit,'String','0');
set(handles.xmax_limit_edit,'String','15');
set(handles.ymin_limit_edit,'String','0');
set(handles.ymax_limit_edit,'String','5');

% --- Executes on button press in grid_checkbox.
function grid_checkbox_Callback(hObject, eventdata, handles)
if(get(handles.grid_checkbox,'Value')==1)
    grid off
    grid minor
else
    grid off
end
