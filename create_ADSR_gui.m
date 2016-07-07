function varargout = create_ADSR_gui(varargin)
% CREATE_ADSR_GUI MATLAB code for create_ADSR_gui.fig
%      CREATE_ADSR_GUI, by itself, creates a new CREATE_ADSR_GUI or raises the existing
%      singleton*.
%
%      H = CREATE_ADSR_GUI returns the handle to a new CREATE_ADSR_GUI or the handle to
%      the existing singleton*.
%
%      CREATE_ADSR_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CREATE_ADSR_GUI.M with the given input arguments.
%
%      CREATE_ADSR_GUI('Property','Value',...) creates a new CREATE_ADSR_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before create_ADSR_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to create_ADSR_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help create_ADSR_gui

% Last Modified by GUIDE v2.5 09-Jun-2016 12:58:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @create_ADSR_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @create_ADSR_gui_OutputFcn, ...
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


% --- Executes just before create_ADSR_gui is made visible.
function create_ADSR_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to create_ADSR_gui (see VARARGIN)

% Choose default command line output for create_ADSR_gui
handles.output = hObject;

% ADSR data
handles.ADSR_param.note_length   = 1;
handles.ADSR_param.attack        = 0.0125; % min = 0, ma = 0.07
handles.ADSR_param.decay         = 5;
handles.ADSR_param.sustain_level = 0.5;
handles.ADSR_param.release       = 5;
plot_ADSR (hObject, eventdata, handles)

% Update handles structure
guidata(hObject, handles);

% Create sliders
attack_slider_CreateFcn (hObject, eventdata, handles);

% UIWAIT makes create_ADSR_gui wait for user response (see UIRESUME)
uiwait(handles.ADSR);


% --- Outputs from this function are returned to the command line.
function varargout = create_ADSR_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.ADSR_param;
  
% Close
delete (hObject);


% --- Executes on button press in return_envelope.
function return_envelope_Callback(hObject, eventdata, handles)
% hObject    handle to return_envelope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume ();


% --- Executes on selection change in list_presets.
function list_presets_Callback(hObject, eventdata, handles)
% hObject    handle to list_presets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_presets contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_presets


% --- Executes during object creation, after setting all properties.
function list_presets_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_presets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function time_slider_Callback(hObject, eventdata, handles)
% hObject    handle to time_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.ADSR_param.attack_time  = get (hObject, 'LowValue') / 100;
handles.ADSR_param.release_time = 1 - get (hObject, 'HighValue')/ 100;

plot_ADSR (hObject, eventdata, handles)

guidata (hObject, handles);



% --- Executes during object creation, after setting all properties.
function attack_slider_CreateFcn (hObject, eventdata, handles)
% hObject    handle to time_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
% if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor',[.9 .9 .9]);
% end

jSlider = javax.swing.JSlider;
[~, container] = javacomponent (jSlider, [10,10,100,40]);
set (jSlider, 'MajorTickSpacing', 100/7, 'MinorTickSpacing', 100/14, ...
              'Minimum', 0, 'Maximum', 100, ...
              'PaintLabels', true, 'PaintTicks', 0, ...
              'Orientation', jSlider.VERTICAL)
set (container, 'Position', [550,150,50,300]);
jSlider.setSnapToTicks(true);
labels = {'0', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7'};
lt = get (jSlider, 'LabelTable');
for ii = 1:8
  key = java.lang.Integer (14*(ii-1));
  val = lt.get (key);
  val.setText (labels{ii});
  lt.put (key, val);
end
set (jSlider, 'LabelTable', lt);
jSlider.javacomponent.updateUI;
% set (options, 'LabelTable', 0, 'Maximum', 200, 'Value', 20);


% hObject = com.jidesoft.swing.RangeSlider (0, 100, 12.5, 75);  % min,max,low,high
% hObject = javacomponent (hObject, [28 100 500 45], gcf);
% set (hObject, 'MajorTickSpacing', 25, 'MinorTickSpacing', 5, 'PaintTicks', true, 'PaintLabels', true, ...
%   'StateChangedCallback', @(hObject, event) time_slider_Callback (hObject, event, handles));
% % addlistener (hObject, 'ContinuousValueChange', @(hObject, event) test_cb (hObject, event));


function plot_ADSR (hObject, eventdata, handles)
attack        = handles.ADSR_param.attack;
decay         = handles.ADSR_param.decay;
sustain_level = handles.ADSR_param.sustain_level;
release       = handles.ADSR_param.release;
note_length   = handles.ADSR_param.note_length;

axes (handles.ADSR_axes);
cla
tplot = linspace (0, 1.5*note_length, 200);
ADSR_envelope = @(x) ADSR_handle (note_length, attack, decay, sustain_level, release, x);
plot (tplot, ADSR_envelope (tplot), 'LineWidth', 3);
ylim ([0, 1]);


function ADSR = ADSR_handle (note_length, attack, decay, sustain_level, release, x)
% Attack
ADSR_1 = 1.1 * exp (- attack ./ x);
idx1 = numel (find (ADSR_1 < 1));
% Decay
ADSR_2 = (1 - sustain_level) * exp (decay * x(idx1+1)) * exp (-decay * x) + sustain_level;
% Release
ADSR_3 = sustain_level * exp (release * (note_length-x));
idx2 = numel (find (x < note_length));
% Complete Envelope
ADSR = [ADSR_1(1:idx1+1), ADSR_2(idx1+2:idx2), ADSR_3(idx2+1:end)];

% 
% function ADSR = ADSR_envelope (tplot, param)
% ta = param.attack_time;
% tr = param.release_time;
% attack = param.attack;
% decay = param.decay;
% sustain_level = param.sustain_level;
% release = param.release;
% % Initialize ADSR envelope
% ADSR = zeros (size (tplot)); 
% % Decay-Sustain time
% tds  = 1 - ta - tr;
% % Repartition of time
% tvec = [ta, tds, tr];
% nvec = ceil (numel(ADSR) .* tvec);
% % Attack phase
% for n = 2:nvec(1)
%   ADSR(n) = attack + (1-attack)*ADSR(n-1);
% end
% % Decay-Sustain phase
% for n = nvec(1)+1:nvec(1)+nvec(2)
%   ADSR(n) = sustain_level*decay + (1-decay)*ADSR(n-1);
% end
% % Release phase
% for n = nvec(1)+nvec(2)+1:numel(ADSR)
%   ADSR(n) = (1-release)*ADSR(n-1);
% end 
