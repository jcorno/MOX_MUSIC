function varargout = mox_music (varargin)
% MOX_MUSIC M-file for mox_music.fig
%      MOX_MUSIC, by itself, creates a new MOX_MUSIC or raises the existing
%      singleton*.
%
%      H = MOX_MUSIC returns the handle to a new MOX_MUSIC or the handle to
%      the existing singleton*.
%
%      MOX_MUSIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in mox_music.M with the given input arguments.
%
%      MOX_MUSIC('Property','Value',...) creates a new mox_music or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mox_music_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mox_music_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mox_music_OpeningFcn, ...
                   'gui_OutputFcn',  @mox_music_OutputFcn, ...
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


% --- Executes just before mox_music is made visible.
function mox_music_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mox_music (see VARARGIN)

% Choose default command line output for mox_music
handles.output       = hObject;
handles.Fs           = 16000;
handles.sample_rate  = 1/handles.Fs;
handles.sound_vector = 0;
handles.note_length  = 60 / 120; % Default time 120 bpm and 1/4 note
handles.novertones   = 5; % Default number of overtones
handles.ADSR         = @(t, Fs) ones (1, floor(t*Fs+1));

% Update handles structure
guidata (hObject, handles);

% UIWAIT makes mox_music wait for user response (see UIRESUME)
% uiwait(handles.mox_music_gui);


% --- Outputs from this function are returned to the command line.
function varargout = mox_music_OutputFcn (hObject, eventdata, handles) 
varargout{1} = handles.output;

% ------------------------------------------------------------------------------
% LOWER OCTAVE
% ------------------------------------------------------------------------------
function C3_Callback (hObject, eventdata, handles)
freq = 130.81;
PlayNote (handles, freq);

function CSharp3_Callback (hObject, eventdata, handles)
freq = 138.59;
PlayNote (handles, freq);

function D3_Callback (hObject, eventdata, handles)
freq = 146.83;
PlayNote (handles, freq);

function DSharp3_Callback (hObject, eventdata, handles)
freq = 155.56;
PlayNote (handles, freq);

function E3_Callback (hObject, eventdata, handles)
freq = 164.81;
PlayNote (handles, freq);

function F3_Callback (hObject, eventdata, handles)
freq = 174.61;
PlayNote (handles, freq);

function FSharp3_Callback (hObject, eventdata, handles)
freq = 185.00;
PlayNote (handles, freq);

function G3_Callback (hObject, eventdata, handles)
freq = 196;
PlayNote (handles, freq);

function GShparp3_Callback (hObject, eventdata, handles)
freq = 207.65;
PlayNote (handles, freq);

function A3_Callback (hObject, eventdata, handles)
freq = 220;
PlayNote (handles, freq);

function ASharp3_Callback (hObject, eventdata, handles)
freq = 233.08;
PlayNote (handles, freq);

function B3_Callback (hObject, eventdata, handles)
freq = 246.94;
PlayNote (handles, freq);

% ------------------------------------------------------------------------------
% CENTRAL OCTAVE
% ------------------------------------------------------------------------------
function C4_Callback (hObject, eventdata, handles)
freq = 261.625;
PlayNote (handles, freq);

function CSharp4_Callback (hObject, eventdata, handles)
freq = 277.18;
PlayNote (handles, freq);

function D4_Callback (hObject, eventdata, handles)
freq = 293.66;
PlayNote (handles, freq);

function DSharp4_Callback (hObject, eventdata, handles)
freq = 311.13;
PlayNote (handles, freq);

function E4_Callback (hObject, eventdata, handles)
freq = 329.63;
PlayNote (handles, freq);

function F4_Callback (hObject, eventdata, handles)
freq = 349.23;
PlayNote (handles, freq);

function FSharp4_Callback (hObject, eventdata, handles)
freq = 369.99;
PlayNote (handles, freq);

function G4_Callback (hObject, eventdata, handles)
freq = 392;
PlayNote (handles, freq);

function GSharp4_Callback (hObject, eventdata, handles)
freq = 415.3;
PlayNote (handles, freq);

function A4_Callback (hObject, eventdata, handles)
freq = 440;
PlayNote (handles, freq);

function ASharp4_Callback (hObject, eventdata, handles)
freq = 466.16;
PlayNote (handles, freq);

function B4_Callback (hObject, eventdata, handles)
freq = 493.88;
PlayNote (handles, freq);

% ------------------------------------------------------------------------------
% HIGHER OCTAVE
% ------------------------------------------------------------------------------
function C5_Callback (hObject, eventdata, handles)
freq = 523.25;
PlayNote (handles, freq);

function CSharp5_Callback (hObject, eventdata, handles)
freq = 554.37;
PlayNote (handles, freq);

function D5_Callback (hObject, eventdata, handles)
freq = 587.33;
PlayNote (handles, freq);

function DSharp5_Callback (hObject, eventdata, handles)
freq = 622.25;
PlayNote (handles, freq);

function E5_Callback (hObject, eventdata, handles)
freq = 659.26;
PlayNote (handles, freq);

function F5_Callback (hObject, eventdata, handles)
freq = 698.46;
PlayNote (handles, freq);

function FSharp5_Callback (hObject, eventdata, handles)
freq = 739.99;
PlayNote (handles, freq);

function G5_Callback (hObject, eventdata, handles)
freq = 783.99;
PlayNote (handles, freq);

function A5_Callback (hObject, eventdata, handles)
freq = 880;
PlayNote (handles, freq);

function ASharp5_Callback (hObject, eventdata, handles)
freq = 932.33;
PlayNote (handles, freq);

function B5_Callback (hObject, eventdata, handles)
freq = 987.77;
PlayNote (handles, freq);

function GSharp5_Callback (hObject, eventdata, handles)
freq = 830.61;
PlayNote (handles, freq);

% ------------------------------------------------------------------------------
% INSERT PAUSE
% ------------------------------------------------------------------------------
function insert_pause_Callback (hObject, eventdata, handles)


% ------------------------------------------------------------------------------
% SET NOTE LENGTH
% ------------------------------------------------------------------------------
function whole_note_CreateFcn(hObject, eventdata, handles)
set (hObject, 'Value', 0);
set (handles.half_note,    'Value', 0);
set (handles.quarter_note, 'Value', 1);
set (handles.eighth_note,  'Value', 0);

function whole_note_Callback (hObject, eventdata, handles)
set (handles.whole_note,   'Value', 1);
set (handles.half_note,    'Value', 0);
set (handles.quarter_note, 'Value', 0);
set (handles.eighth_note,  'Value', 0);

bpm = str2double (get (handles.time_value, 'String'));
note_length = 60 / bpm * 4;

handles.note_length = note_length;
guidata (handles.mox_music_gui, handles);

function half_note_Callback (hObject, eventdata, handles)
set (handles.whole_note,   'Value', 0);
set (handles.half_note,    'Value', 1);
set (handles.quarter_note, 'Value', 0);
set (handles.eighth_note,  'Value', 0);

bpm = str2double (get (handles.time_value, 'String'));
note_length = 60 / bpm * 2;

handles.note_length = note_length;
guidata (handles.mox_music_gui, handles);

function quarter_note_Callback (hObject, eventdata, handles)
set (handles.whole_note,   'Value', 0);
set (handles.half_note,    'Value', 0);
set (handles.quarter_note, 'Value', 1);
set (handles.eighth_note,  'Value', 0);

bpm = str2double (get (handles.time_value, 'String'));
note_length = 60 / bpm;

handles.note_length = note_length;
guidata (handles.mox_music_gui, handles);

function eighth_note_Callback (hObject, eventdata, handles)
set (handles.whole_note,   'Value', 0);
set (handles.half_note,    'Value', 0);
set (handles.quarter_note, 'Value', 0);
set (handles.eighth_note,  'Value', 1);

bpm = str2double (get (handles.time_value, 'String'));
note_length = 60 / bpm / 2;

handles.note_length = note_length;
guidata (handles.mox_music_gui, handles);

% ------------------------------------------------------------------------------
% WAVE SHAPE
% ------------------------------------------------------------------------------
function use_pure_sin_CreateFcn(hObject, eventdata, handles)
set (hObject, 'Value', 1);

function use_pure_sin_Callback (hObject, eventdata, handles)
set (handles.use_pure_sin,  'Value', 1);
set (handles.use_overtones, 'Value', 0);
guidata (handles.mox_music_gui, handles);

function use_overtones_Callback (hObject, eventdata, handles)
set (handles.use_pure_sin,  'Value', 0);
set (handles.use_overtones, 'Value', 1);
guidata (handles.mox_music_gui, handles);

function novertones_Callback(hObject, eventdata, handles)
novertones = str2double (get (hObject, 'String'));
handles.novertones = novertones;
guidata (handles.mox_music_gui, handles);


% ------------------------------------------------------------------------------
% ADSR
% ------------------------------------------------------------------------------
function use_piano_adsr_Callback (hObject, eventdata, handles)
curr_value = get (hObject, 'Value');
if curr_value % I'm turning piano ADSR off
  set (handles.use_custom_adsr, 'Value', 0);
  attack        = 0.005;
  attack_time   = 0.125;
  decay         = 0.0004;
  sustain_level = 0.5;
  release       = 0.00075;
  release_time  = 0.25;
  handles.ADSR = @(t, Fs) ADSR_envelope (t, Fs, attack, attack_time, decay, sustain_level, release, release_time);
else
  handles.ADSR = @(t, Fs) ones (1, floor(t*Fs+1));
end
guidata (handles.mox_music_gui, handles);


function use_custom_adsr_Callback (hObject, eventdata, handles)
curr_value = get (hObject, 'Value');
if curr_value % I'm turning piano ADSR off
  set (handles.use_custom_adsr, 'Value', 0);
  ADSR_param = create_ADSR_gui ();
  attack        = ADSR_param.attack;
  attack_time   = ADSR_param.attack_time;
  decay         = ADSR_param.decay;
  sustain_level = ADSR_param.sustain_level;
  release       = ADSR_param.release;
  release_time  = ADSR_param.release_time;
  handles.ADSR = @(t, Fs) ADSR_envelope (t, Fs, attack, attack_time, decay, sustain_level, release, release_time);
else
  handles.ADSR = @(t, Fs) ones (1, floor(t*Fs+1));
end
guidata (handles.mox_music_gui, handles);

function ADSR = ADSR_envelope (t, Fs, attack, ta, decay, sustain_level, release, tr)
% Initialize ADSR envelope
ADSR = zeros (1, floor(t*Fs+1));
% Decay-Sustain time
tds   = t - ta - tr;
% Repartition of time
tvec = [ta, tds, tr];
nvec = ceil (floor(t*Fs+1) ./ t .* tvec); 
% Attack phase
for n = 2:nvec(1)
  ADSR(n) = attack + (1-attack)*ADSR(n-1);
end
% Decay-Sustain phase
for n = nvec(1)+1:nvec(1)+nvec(2)
  ADSR(n) = sustain_level*decay + (1-decay)*ADSR(n-1);
end
% Release phase
for n = nvec(1)+nvec(2)+1:numel(ADSR)
  ADSR(n) = (1-release)*ADSR(n-1);
end 


% ------------------------------------------------------------------------------
% COMPOSITION PANEL
% ------------------------------------------------------------------------------
function Play_Callback (hObject, eventdata, handles)
sound_vector   = handles.sound_vector;
sample_rate    = handles.sample_rate;

sound (sound_vector, 1/sample_rate)
 
% --- Executes on button press in Stop.
function Stop_Callback (hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.SoundVector = 0;
guidata (handles.mox_music_gui, handles);

function time_value_Callback (hObject, eventdata, handles)

bpm = str2double (get (hObject, 'String'));
note_length  = 60 / bpm;

whole   = get (handles.whole_note,  'Value');
half    = get (handles.half_note,   'Value');
quarter = get (handles.half_note,   'Value');
eighth  = get (handles.eighth_note, 'Value');

if whole == 1
  note_length = 60 / bpm * 4;
elseif half == 1
  note_length = 60 / bpm * 2;
elseif quarter == 1
  note_length = 60 / bpm;
elseif eighth == 1
  note_length = 60 / bpm / 2;
end

handles.note_length = note_length;
guidata (handles.mox_music_gui, handles);


function OutToWav_Callback (hObject, eventdata, handles)

sound_vector = handles.sound_vector;
sample_rate  = handles.sample_rate;

if sound_vector == 0
    return;
else
  filename = get (handles.Filename, 'String');
  audiowrite (sound_vector, 1/sample_rate, 32, filename);
end



% ------------------------------------------------------------------------------
% ADDITIONAL FUNCTIONS
% ------------------------------------------------------------------------------
function PlayNote (handles, freq)
% plays the note that was pressed for 1 second
% also sets the frequency value on GUI for last played note.

strFreq = num2str (freq);
set (handles.current_frequency, 'String', strFreq);

sample_rate = handles.sample_rate;
note_length = handles.note_length;
t           = 0:sample_rate:note_length;
use_pure_sin  = get (handles.use_pure_sin, 'Value');
use_harmonics = get (handles.use_overtones, 'Value');
use_adsr      = get (handles.use_piano_adsr, 'Value');

if use_pure_sin == 1
  sound_vector = sin (2*pi*freq*t);
elseif use_harmonics == 1
  sound_vector = sin (2*pi*freq*t);
  persistent piano_ampl
  piano_ampl = [1.000000000, 0.399064778, 0.229404484, 0.151836061, ...
                0.196754229, 0.093742264, 0.060871957, 0.138605419, ...
                0.010535002, 0.071021868, 0.029954614, 0.051299684, ...
                0.055948288, 0.066208224, 0.010067391, 0.007536790, ...
                0.008196947, 0.012955577, 0.007316738, 0.006216476, ...
                0.005116215, 0.006243983, 0.002860679, 0.002558108, ...
                0.000000000, 0.001650392];
    for ii = 2:handles.novertones
    sound_vector = sound_vector + piano_ampl(ii) * sin (2*pi*ii*freq*t);
  end
  % Normalize to 1 to avoid clipping
  sound_vector = sound_vector ./ max (sound_vector(1:60));
elseif use_adsr == 1
  sound_vector = sin(2*pi*freq*t);
end

% Plot wave shape
axes (handles.wave_shape_axes);
cla
tplot = t (find (t < 0.0077)); % 0.077 in correspondance of minimum frequency C3
plot (tplot, sound_vector (1:numel(tplot)), 'LineWidth', 3);
axis ([0, 0.0077, -1, 1]);

% ADSR envelope
ADSR = handles.ADSR (handles.note_length, handles.Fs);

sound_vector = sound_vector .* ADSR;

% Plot note shape
axes (handles.ADSR_shape_axes);
cla
plot (t, sound_vector, 'LineWidth', 1);
ylim ([-1, 1]);

% Play note
sound (sound_vector, 1/sample_rate)

% Record song
record_on = get (handles.record, 'Value');
if record_on == 1
  song = handles.sound_vector;
  if song == 0
    song = sound_vector;
  else
    song = cat (2, song, sound_vector);
  end
  handles.sound_vector = song;
  guidata (handles.mox_music_gui, handles);  
end
