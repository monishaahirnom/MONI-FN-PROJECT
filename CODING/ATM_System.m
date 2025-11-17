function varargout = ATM_System(varargin)
% ATM_SYSTEM MATLAB code for ATM_System.fig
%      ATM_SYSTEM, by itself, creates a new ATM_SYSTEM or raises the existing
%      singleton*.
%
%      H = ATM_SYSTEM returns the handle to a new ATM_SYSTEM or the handle to
%      the existing singleton*.
%
%      ATM_SYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ATM_SYSTEM.M with the given input arguments.
%
%      ATM_SYSTEM('Property','Value',...) creates a new ATM_SYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ATM_System_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ATM_System_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ATM_System



% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ATM_System_OpeningFcn, ...
                   'gui_OutputFcn',  @ATM_System_OutputFcn, ...
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


% --- Executes just before ATM_System is made visible.
function ATM_System_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ATM_System (see VARARGIN)

% Choose default command line output for ATM_System
handles.output = hObject;
% axes(handles.axes1); axis off
axes(handles.axes2); axis off
axes(handles.axes3); axis off
set(handles.edit1,'String','---')
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ATM_System wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ATM_System_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
%   tts('Show your face infront of Camera');
[fname path]=uigetfile({'*.*'},'Browse Face');
if fname~=0
    img=imread([path,fname]);
    axes(handles.axes1); imshow(img);
    a=img;
%       tts('your face captured');
else
    warndlg('Please Select the necessary Image File');
    tts('Please fix your face at correct angle');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global b;
% tts('Show your iris infront of Camera');
[fname1 path1]=uigetfile({'*.*'},'Browse Iris');
if fname1~=0
    img1=imread([path1,fname1]);
    axes(handles.axes2); imshow(img1);
%      tts('your Iris captured');
    b=img1;
else
    warndlg('Please Select the necessary Image File');
     tts('Please fix your Iris at correct angle');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c;
% tts('Show your plam infront of Camera');
[fname2 path2]=uigetfile({'*.*'},'Browse Plam');
if fname2~=0
    img2=imread([path2,fname2]);
    axes(handles.axes3); imshow(img2);
%      tts('your plam captured');
    c=img2;
else
    warndlg('Please Select the necessary Image File');
     tts('Please fix your plam at correct angle');
end



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tx;
tx = str2double(tx);
if(tx==0)
 
end
if(tx==1)

end



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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close ATM_System

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% axes(handles.axes1); cla(handles.axes1); title(''); axis off
axes(handles.axes2); cla(handles.axes2); title(''); axis off
axes(handles.axes3); cla(handles.axes3); title(''); axis off
set(handles.edit1,'String','---')


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c;global a;global b;global tx;

% a1 = rgb2gray(a);
% axes(handles.axes1); imshow(a1);
b1 = rgb2gray(b);
axes(handles.axes2); imshow(b1);
c1 = rgb2gray(c);
axes(handles.axes3); imshow(c1);
pause(1);
%  a2=im2bw(a1,0.5);
 b2=im2bw(b1,0.5);
 c2=im2bw(c1,0.5);
%  axes(handles.axes1); imshow(a2);
 axes(handles.axes2); imshow(b2);axes(handles.axes3); imshow(c2);
 pause(1);
% a3 = edge(a1,'Canny');
 b3= edge(b1,'Canny');
 c3= edge(c1,'Canny');
%  Call RNN, CNN

% % setup toolbox
L=5;M=5;N=5;LX=1;LY=1;LZ=1;DX=LX/L;DY=LY/M;DZ=LZ/N;dt=0.001;
 for time=1:10;
for i=1:L;
    for j=1:M;
        for k=1:N;
            x(i)=i*DX;
            y(j)=j*DY;
            Z(k)=k*DZ;
            u(i,j,k,time)=sin(x(i))*cos(y(i));
            v(i,j,k,time)=sin(x(i))+cos(y(i));
            w(i,j,k,time)=x(i)*exp(-x(i).^2-y(j).^2);
        end
    end
end
 end
 time=1;
for i=1:L;
    for j=1:M;
        for k=1:N;
            x(i)=i*DX;
            y(j)=j*DY;
            Z(k)=k*DZ;
            roh(i,j,k,time)=x(i)*exp(-x(i).^2-y(j).^2);
        end
    end
end


% gend


  axes(handles.axes2); imshow(b3);axes(handles.axes3); imshow(c3);
%  face mean

  Iris_meann = mean2(b);Iris_meann= Iris_meann*1000;Iris_y = round(Iris_meann);
  PLam_meann = mean2(c);PLam_meann= PLam_meann*1000;Plam_y = round(PLam_meann);
    Iris_meannq = std2(b);Iris_meannq= Iris_meannq*1000;Iris_yq = round(Iris_meannq);
  PLam_meannq = std2(c);PLam_meannq= PLam_meannq*1000;Plam_yq = round(PLam_meannq);

  
original=  Iris_y + Plam_y + Iris_yq + Plam_yq;
%   display(original)
if (original==330594  || original==361834)
%     // 

 set(handles.edit1,'String','AuthoriZed'); 
         s = serial('com4');
        fopen(s);
fwrite(s,'A');        pause(2);fwrite(s,'A');        pause(2);
        fclose(s);
    url='https://monishaahirnom.github.io/intro/reshmamoni.html'
    web(url)
        clear s

else
     set(handles.edit1,'String','Unauthorized person Detect');
      tts('Alert');tts('Unauthorized person Detect');
     run('Deep_Audio.m');
      
      tx=1;
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
