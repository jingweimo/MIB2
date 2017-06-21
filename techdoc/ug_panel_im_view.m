%% Image View Panel
% This panel displays slices of the opened dataset. The shown slices may be in the XY, ZX, or ZY dimension, depending on selected mode in the <ug_gui_toolbar.html Toolbar>.
% The change of slices is done using the slider/edit box on the left-hand side of the panel. When the opened dataset has only a
% single slice, the slider and the edit box are not displayed.
%
% *Back to* <im_browser_product_page.html *Index*> |*-->*| <im_browser_user_guide.html *User Guide*> |*-->*| <ug_gui_panels.html *Panels*>
%
% 
%% List of possible image layers that may be simultaneously shown in |MIB|: 
% 
% <<images\PanelsImageView.jpg>>
%
% * *Single or multichannel image*
% * *Model layer* , that contain information about materials of the segmented model,
% or difference map for correlation analysis. <ug_gui_data_layers.html Click to see more about the image layers>
% * *Mask layer*, mask layer is a black and white (bitmap) mask that is
% generated by some of the filters. The mask is a service layer that may be used as a source of shapes for
% segmentation or as an area for local black-and-white thresholding with the <ug_panel_segm.html BW Thresholding tool>.
% * *Selection layer*, is a temporery layer used for segmentation. This layer may be easily modified and in the end should be sent to the |Mask| or |Model| layers.
% * *ROI layer*, if ROIs are enabled, they may be also seen in the |Image View
% panel|
%
% 
% <<images\mib_layers.jpg>>
% 
%
% Colors and transparencies of the |Model|, |Mask|, and |Selection| layers may be
% individually adjusted using the sliders in the <ug_panel_view_settings.html View Settings panel> and in the <ug_gui_menu_file_preferences.html Preference dialog>.
%
%% Mouse actions 
% 
% * *move mouse around the image* to see pixel information and coordinates
% in the <ug_panel_path.html |Path Panel|>
% * *Left mouse click*, selection of pixels in the image based on
% specified method in the <ug_panel_segm.html Segmentation Panel>
% * *Right mouse press + mouse move*, turns on the pan mode to move the image left/right and up/down
% * *Shift + Left mouse click*, adds selection to the existing selection
% * *Ctrl + Left mouse click*, removes selection to the existing selection
% * *Ctrl + mouse wheel (Ctrl + Shift + mouse wheel)* , changes size of the brush and other selection tools
% * *Mouse wheel*, changes slices or zooms in/zooms out, depending on the settings in the <ug_gui_menu_file_preferences.html Preferences dialog>
% * *Shift + Mouse wheel*, jumps to 10 slices, number of slices can be defined from a popup menu that appears during the right mouse click above the slices slider in the 
% <ug_panel_im_view.html Image View Panel>
%
%
%% Key actions
% * *left*, *down* arrow keys or *q* key, zooms out or changes to the previous slice
% * *Shift* + *left*, *down* arrow keys or *q* key, jumps by 10 slices towards the beginning of the dataset (_to change this step, see below_)
% * *right*, *up* arrow keys or *w* key, zooms in or changes to the next slice
% * *Shift* + *right*, *up* arrow keys or *w* key, jumps by 10 slices towards the end of the dataset (_to change this step, see below_)
%
%% Extra parameters for the change slices slider.
% This slider is only shown when 3D or 4D datasets are loaded. By default,
% each iteration of the mouse wheel changes the shown image by 1. It is
% possible to modify this. Press _the right mouse button_ on the slider to
% set the desired step.
%
% 
% <<images\PanelsImageViewContext.png>>
% 
%
%
%
% *Back to* <im_browser_product_page.html *Index*> |*-->*| <im_browser_user_guide.html *User Guide*> |*-->*| <ug_gui_panels.html *Panels*>

