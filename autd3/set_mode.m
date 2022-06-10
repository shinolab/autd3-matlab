%{
%File: set_mode.m
%Project: autd3
%Created Date: 10/06/2022
%Author: Shun Suzuki
%-----
%Last Modified: 10/06/2022
%Modified By: Shun Suzuki (suzuki@hapis.k.u-tokyo.ac.jp)
%-----
%Copyright (c) 2022 Shun Suzuki. All rights reserved.
%
%}

function set_mode(mode)
    calllib('autd3capi', 'AUTDSetMode', mode);
    calllib('autd3capi_gain_holo', 'AUTDSetModeHolo', mode);
end
