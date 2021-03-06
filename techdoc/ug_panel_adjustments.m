%% The Adjust display window
% This window allows to adjust the contrast of the dataset individually for each color channel. The intensity values for the 
% currently shown slice can be checked in the histogram at the bottom of the window.
%
% <html>
% A brief demonstration is available in the following video:<br>
% <a href="https://youtu.be/WhpzGMyslZU"><img style="vertical-align:middle;" src="images\youtube2.png">  https://youtu.be/WhpzGMyslZU</a>
% </html>
%
% *Back to* <im_browser_product_page.html *Index*> |*-->*| <im_browser_user_guide.html *User Guide*> |*-->*| <ug_gui_panels.html *Panels*> |*-->*| <ug_panel_view_settings.html *View settings*>
%
%%
%
% <<images\PanelsViewSettingsDisplay.png>>
%
%% Parameters
% List of widgets:
%
%
% <html>
% <table>
% <table style="width: 800px; text-align: left; border: 0px" cellspacing=2px cellpadding=2px >
% <tr>
%   <td><b>Color channel combobox</b></td>
%   <td>choose color channel for adjustment
%   </td>
% </tr>
% <tr>
%   <td><b>Min slider and editbox</b><br>
%       <em>define the black point</em><br>
%       <img src="images\panelsDisplayAdj_min.png"></td>
%   <td>selection the black point; all intensities below this value will be rendered as black. 
%   The <code>right mouse</code> click above the slider sets its value to 1.<br>
%   *Note!* it is also possible to set this value using the <code>left
%   mouse click</code> on the histogram plot at the bottom of the
%   window<br><br>
%   Use the <b>min button</b> to find minimal intensity value for the selected color
%   channel and assign it to black. <br>
%   Additionally, right mouse click opens a menu allowing to define the
%   black point from the historam of intentities.
%   </td>
% </tr>
% <tr>
%   <td><b>Max slider and editbox</b>
%   <em>define the black point</em><br>
%       <img src="images\panelsDisplayAdj_max.png"></td>
%   <td>selection the white point; all intensities above this value will be rendered as pure color or white. 
%   The <code>right mouse</code> click above the slider sets its value to maximal posible for the current image class.<br>
%   *Note!* it is also possible to set this value using the <code>right
%   mouse click</code> on the histogram plot at the bottom of the
%   window<br><br>
%   Use the <b>max button</b> to find maximal intensity value for the selected color
%   channel and assign it to white. <br>
%   Additionally, right mouse click opens a menu allowing to define the
%   white point from the historam of intentities.
%   </td>
% </tr>
% <tr>
%   <td><b>Gamma</b></td>
%   <td>allows modification of gamma parameters. Gamma values below 1 enhance
%       high intensity values, and Gamma values above 1 enhance low intensity
%       values.<br>
%       The <code>right mouse</code> click above the slider sets this value to 1%   </td>
% </tr>
% <tr>
%   <td><bLink checkbox></b></td>
%   <td>links all color channel so that changing of the
%       <code>Min/Max/Gamma</code> sliders and editboxes affects all color channels at the same time
%   </td>
% </tr>
% <tr>
%   <td><b>Log checkbox</b></td>
%   <td>defines type of histogram representation in the histogram plot: linear or logarithmic scale
%   </td>
% </tr>
% <tr>
%   <td><b>Auto update</b></td>
%   <td>switches ON automatic update of the histogram.<br>When enabled the
%   histogram is updated after each slice change.<br>
%  <b>Warning!</b> Switching on the automatic update of the histogram may significantly decrease rendering of images
%   </td>
% </tr>
% <tr>
%   <td><b>Update button</b></td>
%   <td>update the histogram for the currently shown slice
%   </td>
% </tr>
% <tr>
%   <td><b>Current button</b></td>
%   <td><b><em>recalculate</b></em> intensities of the selected color channel (the <code>Channel</code> combobox) 
%   with parameters specified in the dialog for the currently shown slice. 
%   The intensities below the <code>Min</code> value become black and the intensities above the <code>Max</code> value
%   become white. <br>
%   The contrast adjustment of a single slice is not logged in the log list
%   <a href="ug_panel_path.html"> see the *Log button* description</a>.
%   </td>
% </tr>
% <tr>
%   <td><b>All slices button</b></td>
%   <td><b><em>recalculate</b></em> intensities of the selected color channel (the <code>Channel</code> combobox) with parameters
%   specified in this dialog for all slices. The intensities below the <code>Min<.code> value become black 
%   and the intensities above the <code>Max</code> value become white
%   </td>
% </tr>
% </table>
% </html>
%
%
%% Histogram at the bottom of the window
% The histogram shows the plot with intensity values in the X-axis and number of pixels for each intensity value in the
% Y-axis. *Note!* The histogram is calculated from the image shown in the <ug_panel_im_view.html Image View panel> - not from the full slice!
%
% The adjustments made with |Gamma| are not shown in the histogram plot.
%
% It is possible to change |Min| and |Max| values for the intensities by
% manual numerical input, using the slider or with the right and left mouse click within the histogram
% plot. 
%
% *Back to* <im_browser_product_page.html *Index*> |*-->*| <im_browser_user_guide.html *User Guide*> |*-->*| <ug_gui_panels.html *Panels*> |*-->*| <ug_panel_view_settings.html *View settings*>
