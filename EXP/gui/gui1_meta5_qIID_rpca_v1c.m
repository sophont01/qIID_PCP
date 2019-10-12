function varargout = gui1_meta5_qIID_rpca_v1c(varargin)
% GUI1_META5_QIID_RPCA_V1C MATLAB code for gui1_meta5_qIID_rpca_v1c.fig
%      GUI1_META5_QIID_RPCA_V1C, by itself, creates a new GUI1_META5_QIID_RPCA_V1C or raises the existing
%      singleton*.
%
%      H = GUI1_META5_QIID_RPCA_V1C returns the handle to a new GUI1_META5_QIID_RPCA_V1C or the handle to
%      the existing singleton*.
%
%      GUI1_META5_QIID_RPCA_V1C('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI1_META5_QIID_RPCA_V1C.M with the given input arguments.
%
%      GUI1_META5_QIID_RPCA_V1C('Property','Value',...) creates a new GUI1_META5_QIID_RPCA_V1C or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui1_meta5_qIID_rpca_v1c_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui1_meta5_qIID_rpca_v1c_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui1_meta5_qIID_rpca_v1c

% Last Modified by GUIDE v2.5 05-Oct-2019 01:22:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui1_meta5_qIID_rpca_v1c_OpeningFcn, ...
                   'gui_OutputFcn',  @gui1_meta5_qIID_rpca_v1c_OutputFcn, ...
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


% --- Executes just before gui1_meta5_qIID_rpca_v1c is made visible.
function gui1_meta5_qIID_rpca_v1c_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui1_meta5_qIID_rpca_v1c (see VARARGIN)

% Choose default command line output for gui1_meta5_qIID_rpca_v1c
handles.output = hObject;

% handles.Rpath = '/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/RESULTS/meta5_qIID_rpca_v1c/';
% handles.Ipath_main = '/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/Datasets/NARIHIRAtestsplit/';
% handles.Ipath_albedo = '/media/saurabh/String/WORK/RESULTS/EfrosIID/IIW/';
% handles.Ipath_shading = '/media/saurabh/String/WORK/RESULTS/EfrosIID/IIW/';

handles.Rpath = '/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/RESULTS/meta6_qIID_rpca_v1b/';
handles.Ipath_main = '/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/Datasets/NARIHIRAtestsplit/';
handles.Ipath_albedo = '/media/saurabh/String/WORK/RESULTS/RevistingIID/exp0_IIW/';
handles.Ipath_shading = '/media/saurabh/String/WORK/RESULTS/RevistingIID/exp0_IIW/';

handles.D = dir(fullfile(handles.Ipath_main,'*.png'));
handles.i=1;
set(handles.edit1,'String',handles.i);

handles.alpha = get(handles.slider4,'value');
handles.beta = get(handles.slider1,'value');
handles.gamma1 = get(handles.slider2,'value');
handles.gamma2 = get(handles.slider3,'value');
handles.gamma3 = get(handles.slider5,'value');
handles.gamma4 = get(handles.slider6,'value');
handles.gamma5 = get(handles.slider7,'value');
handles.gamma6 = get(handles.slider8,'value');
handles.gamma7 = get(handles.slider9,'value');

[~,handles.Iname,~] = fileparts(handles.D(handles.i).name);
handles.I_c = im2double(imread(fullfile(handles.Ipath_main,[handles.Iname '.png'])));
% handles.I_a = im2double(imread(fullfile(handles.Ipath_albedo,[handles.Iname '-r.png'])));
% handles.I_s = im2double(imread(fullfile(handles.Ipath_shading,[handles.Iname '-s.png'])));
handles.I_a = im2double(imread(fullfile(handles.Ipath_albedo,[handles.Iname '-R.png'])));
handles.I_s = repmat(im2double(imread(fullfile(handles.Ipath_shading,[handles.Iname '-S.png']))),[1 1 3]);

handles.A1 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA1.png'])));
handles.A2 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA2.png'])));
handles.A3 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA3.png'])));
handles.A4 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA4.png'])));
handles.A5 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA5.png'])));
handles.A6 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA6.png'])));
handles.A7 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA7.png'])));

handles.oE1 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE1.png'])));
handles.oE2 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE2.png'])));
handles.oE3 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE3.png'])));
handles.oE4 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE4.png'])));
handles.oE5 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE5.png'])));
handles.oE6 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE6.png'])));
handles.oE7 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE7.png'])));

handles.E1 = handles.oE1;
handles.E2 = handles.oE2;   %oE2 -oE1;
handles.E3 = handles.oE3 - handles.oE2;
handles.E4 = handles.oE4 - handles.oE3;
handles.E5 = handles.oE5 - handles.oE4;
handles.E6 = handles.oE6 - handles.oE5;
handles.E7 = handles.oE7 - handles.oE6;

handles.A1 = normalizeIm(handles.A1);
handles.A2 = normalizeIm(handles.A2);
handles.A3 = normalizeIm(handles.A3);
handles.A4 = normalizeIm(handles.A4);
handles.A5 = normalizeIm(handles.A5);
handles.A6 = normalizeIm(handles.A6);
handles.A7 = normalizeIm(handles.A7);
handles.E1 = normalizeIm(handles.E1);
handles.E2 = normalizeIm(handles.E2);
handles.E3 = normalizeIm(handles.E3);
handles.E4 = normalizeIm(handles.E4);
handles.E5 = normalizeIm(handles.E5);
handles.E6 = normalizeIm(handles.E6);
handles.E7 = normalizeIm(handles.E7);

handles.A1 = imgaussfilt(handles.A1);
handles.A2 = imgaussfilt(handles.A2);
handles.A3 = imgaussfilt(handles.A3);
handles.A4 = imgaussfilt(handles.A4);
handles.A5 = imgaussfilt(handles.A5);
handles.A6 = imgaussfilt(handles.A6);
handles.A7 = imgaussfilt(handles.A7);
handles.E1 = imgaussfilt(handles.E1);
handles.E2 = imgaussfilt(handles.E2);
handles.E3 = imgaussfilt(handles.E3);
handles.E4 = imgaussfilt(handles.E4);
handles.E5 = imgaussfilt(handles.E5);
handles.E6 = imgaussfilt(handles.E6);
handles.E7 = imgaussfilt(handles.E7);

handles.A{1} = handles.A1; handles.A{2} = handles.A2; handles.A{3} = handles.A3; handles.A{4} = handles.A4; handles.A{5} = handles.A5; handles.A{6} = handles.A6; handles.A{7} = handles.A7;
handles.E{1} = handles.E1; handles.E{2} = handles.E2; handles.E{3} = handles.E3; handles.E{4} = handles.E4; handles.E{5} = handles.E5; handles.E{6} = handles.E6; handles.E{7} = handles.E7; 

% [~,handles.pMaps] = getFocusPmaps(handles.E,5,0.5,1,0.01);
[~,handles.pMaps] = getFocusPmaps(handles.E,5,0.1,1,0.01);

handles.imRecon = reconImage(handles);
imshow(handles.imRecon,'Parent',handles.axes2)

imshow(handles.I_c,'Parent',handles.axes1)
imshow(handles.I_a,'Parent',handles.axes3)
imshow(handles.I_s,'Parent',handles.axes4)

imshow(handles.A1,'Parent',handles.axes5)
imshow(handles.A2,'Parent',handles.axes6)
imshow(handles.A3,'Parent',handles.axes7)
imshow(handles.A4,'Parent',handles.axes8)
imshow(handles.A5,'Parent',handles.axes9)
imshow(handles.A6,'Parent',handles.axes10)
imshow(handles.A7,'Parent',handles.axes11)
imshow(handles.E1,'Parent',handles.axes12)
imshow(handles.E2,'Parent',handles.axes13)
imshow(handles.E3,'Parent',handles.axes14)
imshow(handles.E4,'Parent',handles.axes15)
imshow(handles.E5,'Parent',handles.axes16)
imshow(handles.E6,'Parent',handles.axes17)
imshow(handles.E7,'Parent',handles.axes18)

paramString = updateParamString(handles);
set(handles.text6,'string',paramString);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui1_meta5_qIID_rpca_v1c wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui1_meta5_qIID_rpca_v1c_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.beta = get(hObject,'Value');
paramString = updateParamString(handles);
set(handles.text6,'string',paramString);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.gamma1 = get(hObject,'Value');
paramString = updateParamString(handles);
set(handles.text6,'string',paramString);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.gamma2 = get(hObject,'Value');
paramString = updateParamString(handles);
set(handles.text6,'string',paramString);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.alpha = get(hObject,'Value');
paramString = updateParamString(handles);
set(handles.text6,'string',paramString);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.i-1>0
    handles.i = handles.i-1;
    handles = readShowImages(handles);
end
set(handles.edit1,'String',handles.i);
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.i+1<numel(handles.D)
    handles.i = handles.i+1;
    handles = readShowImages(handles);
end
set(handles.edit1,'String',handles.i);
guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.imRecon = reconImage(handles);
imshow(handles.imRecon,'Parent',handles.axes2)
guidata(hObject, handles);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
handles.i = str2num(get(hObject,'String'));
handles = readShowImages(handles);
guidata(hObject, handles);


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


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.gamma3 = get(hObject,'Value');
paramString = updateParamString(handles);
set(handles.text6,'string',paramString);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.gamma4 = get(hObject,'Value');
paramString = updateParamString(handles);
set(handles.text6,'string',paramString);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.gamma5 = get(hObject,'Value');
paramString = updateParamString(handles);
set(handles.text6,'string',paramString);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.gamma6 = get(hObject,'Value');
paramString = updateParamString(handles);
set(handles.text6,'string',paramString);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.gamma7 = get(hObject,'Value');
paramString = updateParamString(handles);
set(handles.text6,'string',paramString);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%%
function[imN] = normalizeIm(im)
imN = rgb2hsv(im);
mx = double(max(max(im(:,:,3))));
mn = double(min(min(im(:,:,3))));
imN(:,:,3) = (imN(:,:,3) - mn)./(mx - mn);
imN = hsv2rgb(imN);

function[imRecon] = reconImage(handles)
allL_2 = zeros(size(handles.I_s));
allL_2 = allL_2 +  handles.gamma1*(handles.I_s  .* repmat([handles.pMaps(:,:,1)],[1 1 3]));
allL_2 = allL_2 +  handles.gamma2*(handles.A{1} .* repmat([handles.pMaps(:,:,2)],[1 1 3]));
allL_2 = allL_2 +  handles.gamma3*(handles.A{2} .* repmat([handles.pMaps(:,:,3)],[1 1 3]));
allL_2 = allL_2 +  handles.gamma4*(handles.A{3} .* repmat([handles.pMaps(:,:,4)],[1 1 3]));
allL_2 = allL_2 +  handles.gamma5*(handles.A{4} .* repmat([handles.pMaps(:,:,5)],[1 1 3]));
allL_2 = allL_2 +  handles.gamma6*(handles.A{5} .* repmat([handles.pMaps(:,:,6)],[1 1 3]));
allL_2 = allL_2 +  handles.gamma7*(handles.A{6} .* repmat([handles.pMaps(:,:,7)],[1 1 3]));
imRecon = (handles.alpha*handles.I_c + handles.beta*(allL_2.*handles.I_a))/(handles.beta + handles.alpha);

function[paramString] = updateParamString(handles)
paramString = sprintf('\nalpha=%1.2f \n beta=%1.2f \n gamma1=%1.2f \n gamma2=%1.2f \n gamma3=%1.2f \n gamma4=%1.2f \n gamma5=%1.2f \n gamma6=%1.2f \n gamma7=%1.2f \n',handles.alpha,handles.beta,handles.gamma1,handles.gamma2,handles.gamma3,handles.gamma4,handles.gamma5,handles.gamma6,handles.gamma7);

function[handles] = readShowImages(handles)
[~,handles.Iname,~] = fileparts(handles.D(handles.i).name);
handles.I_c = im2double(imread(fullfile(handles.Ipath_main,[handles.Iname '.png'])));
% handles.I_a = im2double(imread(fullfile(handles.Ipath_albedo,[handles.Iname '-r.png'])));
% handles.I_s = im2double(imread(fullfile(handles.Ipath_shading,[handles.Iname '-s.png'])));
handles.I_a = im2double(imread(fullfile(handles.Ipath_albedo,[handles.Iname '-R.png'])));
handles.I_s = repmat(im2double(imread(fullfile(handles.Ipath_shading,[handles.Iname '-S.png']))),[1 1 3]);

handles.A1 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA1.png'])));
handles.A2 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA2.png'])));
handles.A3 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA3.png'])));
handles.A4 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA4.png'])));
handles.A5 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA5.png'])));
handles.A6 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA6.png'])));
handles.A7 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iA7.png'])));

handles.oE1 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE1.png'])));
handles.oE2 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE2.png'])));
handles.oE3 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE3.png'])));
handles.oE4 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE4.png'])));
handles.oE5 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE5.png'])));
handles.oE6 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE6.png'])));
handles.oE7 = im2double(imread(fullfile(handles.Rpath,[handles.Iname '_iE7.png'])));

handles.E1 = handles.oE1;
handles.E2 = handles.oE2; %oE2 -oE1;
handles.E3 = handles.oE3 - handles.oE2;
handles.E4 = handles.oE4 - handles.oE3;
handles.E5 = handles.oE5 - handles.oE4;
handles.E6 = handles.oE6 - handles.oE5;
handles.E7 = handles.oE7 - handles.oE6;

handles.A1 = normalizeIm(handles.A1);
handles.A2 = normalizeIm(handles.A2);
handles.A3 = normalizeIm(handles.A3);
handles.A4 = normalizeIm(handles.A4);
handles.A5 = normalizeIm(handles.A5);
handles.A6 = normalizeIm(handles.A6);
handles.A7 = normalizeIm(handles.A7);
handles.E1 = normalizeIm(handles.E1);
handles.E2 = normalizeIm(handles.E2);
handles.E3 = normalizeIm(handles.E3);
handles.E4 = normalizeIm(handles.E4);
handles.E5 = normalizeIm(handles.E5);
handles.E6 = normalizeIm(handles.E6);
handles.E7 = normalizeIm(handles.E7);

handles.A1 = imgaussfilt(handles.A1);
handles.A2 = imgaussfilt(handles.A2);
handles.A3 = imgaussfilt(handles.A3);
handles.A4 = imgaussfilt(handles.A4);
handles.A5 = imgaussfilt(handles.A5);
handles.A6 = imgaussfilt(handles.A6);
handles.A7 = imgaussfilt(handles.A7);
handles.E1 = imgaussfilt(handles.E1);
handles.E2 = imgaussfilt(handles.E2);
handles.E3 = imgaussfilt(handles.E3);
handles.E4 = imgaussfilt(handles.E4);
handles.E5 = imgaussfilt(handles.E5);
handles.E6 = imgaussfilt(handles.E6);
handles.E7 = imgaussfilt(handles.E7);

handles.A{1} = handles.A1; handles.A{2} = handles.A2; handles.A{3} = handles.A3; handles.A{4} = handles.A4; handles.A{5} = handles.A5; handles.A{6} = handles.A6; handles.A{7} = handles.A7;
handles.E{1} = handles.E1; handles.E{2} = handles.E2; handles.E{3} = handles.E3; handles.E{4} = handles.E4; handles.E{5} = handles.E5; handles.E{6} = handles.E6; handles.E{7} = handles.E7; 

% [~,handles.pMaps] = getFocusPmaps(handles.E,5,0.5,1,0.01);
[~,handles.pMaps] = getFocusPmaps(handles.E,5,0.1,1,0.01);

handles.imRecon = reconImage(handles);

imshow(handles.imRecon,'Parent',handles.axes2)
imshow(handles.I_c,'Parent',handles.axes1)
imshow(handles.I_a,'Parent',handles.axes3)
imshow(handles.I_s,'Parent',handles.axes4)

imshow(handles.A1,'Parent',handles.axes5)
imshow(handles.A2,'Parent',handles.axes6)
imshow(handles.A3,'Parent',handles.axes7)
imshow(handles.A4,'Parent',handles.axes8)
imshow(handles.A5,'Parent',handles.axes9)
imshow(handles.A6,'Parent',handles.axes10)
imshow(handles.A7,'Parent',handles.axes11)
imshow(handles.E1,'Parent',handles.axes12)
imshow(handles.E2,'Parent',handles.axes13)
imshow(handles.E3,'Parent',handles.axes14)
imshow(handles.E4,'Parent',handles.axes15)
imshow(handles.E5,'Parent',handles.axes16)
imshow(handles.E6,'Parent',handles.axes17)
imshow(handles.E7,'Parent',handles.axes18)


