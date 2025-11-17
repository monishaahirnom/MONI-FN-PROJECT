function varargout = Solar_TS(varargin)
% Solar_TS MATLAB code for Solar_TS.fig
%      Solar_TS, by itself, creates a new Solar_TS or raises the existing
%      singleton*.
%
%      H = Solar_TS returns the handle to a new Solar_TS or the handle to
%      the existing singleton*.
%
%      Solar_TS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Solar_TS.M with the given input arguments.
%
%      Solar_TS('Property','Value',...) creates a new Solar_TS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Solar_TS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Solar_TS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Solar_TS

% Last Modified by GUIDE v2.5 25-Jan-2023 19:11:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Solar_TS_OpeningFcn, ...
                   'gui_OutputFcn',  @Solar_TS_OutputFcn, ...
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


% --- Executes just before Solar_TS is made visible.
function Solar_TS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Solar_TS (see VARARGIN)

% Choose default command line output for Solar_TS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Solar_TS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Solar_TS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_Clear.
function pushbutton_Clear_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.Input1 = 0;
set(handles.edit1,'String',handles.Input1);

handles.Input2 = 0;
set(handles.edit2,'String',handles.Input2);

handles.Input3 = 0;
set(handles.edit3,'String',handles.Input3);

handles.Input4 = 0;
set(handles.edit4,'String',handles.Input4);

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pushbutton_Test.
function pushbutton_Test_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Variable Initialization
Input1 = get(handles.edit1,'String');
Input1 = str2double(Input1);

if isnan(Input1)
    Input1 = 0;
    warndlg('NaN Entered. Initializing as ZERO.');
end


% Variable Initialization
Input2 = get(handles.edit2,'String');
Input2 = str2double(Input2);

if isnan(Input2)
    Input2 = 0;
    warndlg('NaN Entered. Initializing as ZERO.');
end


% Variable Initialization
Input3 = get(handles.edit3,'String');
Input3 = str2double(Input3);

if isnan(Input3)
    Input3 = 0;
    warndlg('NaN Entered. Initializing as ZERO.');
end


% Variable Initialization
Input4 = get(handles.edit4,'String');
Input4 = str2double(Input4);

if isnan(Input4)
    Input4 = 0;
    warndlg('NaN Entered. Initializing as ZERO.');
end


if (exist('Covid19NN.mat', 'file'))
    load Covid19NN.mat;
else
    warndlg('No Neural Network Found. Please Train NN First.');
    WeatherData;
    close TestANN;
end

Predictedlevel = sim(Covid19NN, [Input1; Input2; Input3; Input4])


% --- Executes on button press in pushbutton_Train.
function pushbutton_Train_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Covid19NN;
close TestANN;

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
