function varargout = mibGraphcutGUI(varargin)
% function varargout = mibGraphcutGUI(varargin)
% mibGraphcutGUI function is responsible for watershed operations.
%
% mibGraphcutGUI contains MATLAB code for mibGraphcutGUI.fig

% Copyright (C) 13.02.2017 Ilya Belevich, University of Helsinki (ilya.belevich @ helsinki.fi)
% part of Microscopy Image Browser, http:\\mib.helsinki.fi 
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or (at your option) any later version.
%
% Updates
% 


% Edit the above text to modify the response to help mibGraphcutGUI

% Last Modified by GUIDE v2.5 02-Nov-2017 20:04:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @mibGraphcutGUI_OpeningFcn, ...
    'gui_OutputFcn',  @mibGraphcutGUI_OutputFcn, ...
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
end

% --- Executes just before mibGraphcutGUI is made visible.
function mibGraphcutGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mibGraphcutGUI (see VARARGIN)

% obtain controller
handles.winController = varargin{1};
%handles.mibGraphcutGUI.Position = [389.25 594.0 256 471.75];

% define the current mode
handles.mode2dCurrentRadio.Value = 1;

% Choose default command line output for mibChildGUI
handles.output = hObject;

% add text
handles.realtimeText.String = sprintf('Please note that the Auto update mode works only when modifying with the currenly shown slice');

% Determine the position of the dialog - on a side of the main figure
% if available, else, centered on the main figure
FigPos=get(0,'DefaultFigurePosition');
OldUnits = get(hObject, 'Units');
set(hObject, 'Units', 'pixels');
OldPos = get(hObject,'Position');
FigWidth = OldPos(3);
FigHeight = OldPos(4);
if isempty(gcbf)
    ScreenUnits=get(0,'Units');
    set(0,'Units','pixels');
    ScreenSize=get(0,'ScreenSize');
    set(0,'Units',ScreenUnits);
    
    FigPos(1)=1/2*(ScreenSize(3)-FigWidth);
    FigPos(2)=2/3*(ScreenSize(4)-FigHeight);
else
    GCBFOldUnits = get(gcbf,'Units');
    set(gcbf,'Units','pixels');
    GCBFPos = get(gcbf,'Position');
    set(gcbf,'Units',GCBFOldUnits);
    screenSize = get(0,'ScreenSize');
    if GCBFPos(1)-FigWidth > 0 % put figure on the left side of the main figure
        FigPos(1:2) = [GCBFPos(1)-FigWidth-10 GCBFPos(2)+GCBFPos(4)-FigHeight];
    elseif GCBFPos(1) + GCBFPos(3) + FigWidth < screenSize(3) % put figure on the right side of the main figure
        FigPos(1:2) = [GCBFPos(1)+GCBFPos(3)+10 GCBFPos(2)+GCBFPos(4)-FigHeight];
    else
        FigPos(1:2) = [(GCBFPos(1) + GCBFPos(3) / 2) - FigWidth / 2, ...
            (GCBFPos(2) + GCBFPos(4) / 2) - FigHeight / 2];
    end
end
FigPos(3:4)=[FigWidth FigHeight];
set(hObject, 'Position', FigPos);
set(hObject, 'Units', OldUnits);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mibGraphcutGUI wait for user response (see UIRESUME)
% uiwait(handles.mibGraphcutGUI);
end

% --- Outputs from this function are returned to the command line.
function varargout = mibGraphcutGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in closeBtn.
function closeBtn_Callback(hObject, eventdata, handles)
handles.winController.closeWindow();
end

% --- Executes when user attempts to close mibGraphcutGUI.
function mibGraphcutGUI_CloseRequestFcn(hObject, eventdata, handles)
handles.winController.closeWindow();
end

% --- Executes on button press in updateMaterialsBtn.
function updateMaterialsBtn_Callback(hObject, eventdata, handles)
handles.winController.updateMaterialsBtn_Callback();
end

% --- Executes on button press in helpBtn.
function helpBtn_Callback(hObject, eventdata, handles)
global mibPath;
web(fullfile(mibPath, 'techdoc/html/ug_gui_menu_tools_graphcut.html'), '-helpbrowser');
end

% --- Executes on button press in clearPreprocessBtn.
function clearPreprocessBtn_Callback(hObject, eventdata, handles)
handles.winController.clearPreprocessBtn_Callback();
end

% --- Executes on button press in mode2dRadio.
function mode2dRadio_Callback(hObject, eventdata, handles)
handles.winController.mode2dRadio_Callback(hObject);
end

function xSubareaEdit_Callback(hObject, eventdata, handles)
handles.winController.checkDimensions(hObject);
end

function ySubareaEdit_Callback(hObject, eventdata, handles)
handles.winController.checkDimensions(hObject);
end

function zSubareaEdit_Callback(hObject, eventdata, handles)
handles.winController.checkDimensions(hObject);
end

% --- Executes on button press in resetDimsBtn.
function resetDimsBtn_Callback(hObject, eventdata, handles)
handles.winController.resetDimsBtn_Callback();
end

% --- Executes on button press in currentViewBtn.
function currentViewBtn_Callback(hObject, eventdata, handles)
handles.winController.currentViewBtn_Callback();
end

% --- Executes on button press in subAreaFromSelectionBtn.
function subAreaFromSelectionBtn_Callback(hObject, eventdata, handles)
handles.winController.subAreaFromSelectionBtn_Callback();
end


function binSubareaEdit_Callback(hObject, eventdata, handles)
handles.winController.binSubareaEdit_Callback(hObject);
end

% --- Executes on button press in segmentBtn.
function segmentBtn_Callback(hObject, eventdata, handles)
handles.winController.segmentBtn_Callback();
end

% --- Executes on button press in superpixelsBtn.
function superpixelsBtn_Callback(hObject, eventdata, handles)
handles.winController.superpixelsBtn_Callback();
end

% --- Executes on button press in exportSuperpixelsBtn.
function exportSuperpixelsBtn_Callback(hObject, eventdata, handles)
handles.winController.exportSuperpixelsBtn_Callback();
end

% --- Executes on button press in importSuperpixelsBtn.
function importSuperpixelsBtn_Callback(hObject, eventdata, handles)
handles.winController.importSuperpixelsBtn_Callback();
end

% --- Executes on button press in superpixelsPreviewBtn.
function superpixelsPreviewBtn_Callback(hObject, eventdata, handles)
handles.winController.superpixelsPreviewBtn_Callback();
end

function superpixelEdit_Callback(hObject, eventdata, handles)
handles.winController.clearPreprocessBtn_Callback();    % clear preprocessed data
end

% --- Executes on selection change in superpixTypePopup.
function superpixTypePopup_Callback(hObject, eventdata, handles, parameter)
if nargin < 4;    parameter = 'keep'; end
handles.winController.superpixTypePopup_Callback(parameter);
end

% --- Executes on button press in recalcGraph.
function recalcGraph_Callback(hObject, eventdata, handles, showWaitbar)
if nargin < 4;    showWaitbar = 0; end
handles.winController.recalcGraph_Callback(showWaitbar);
end

% --- Executes on button press in realtimeCheck.
function realtimeCheck_Callback(hObject, eventdata, handles)
handles.winController.realtimeSwitch = handles.realtimeCheck.Value;
end

% --- Executes on button press in pixelIdxListCheck.
function pixelIdxListCheck_Callback(hObject, eventdata, handles)
handles.winController.pixelIdxListCheck_Callback();
end

% --- Executes on button press in parforCheck.
function parforCheck_Callback(hObject, eventdata, handles)
% start pool for parallel processing
poolobj = gcp('nocreate'); % If no pool, do not create new one.
if isempty(poolobj)
    parpool(feature('numCores'));
end
end
