%{
%File: deinit_autd.m
%Project: autd3-matlab
%Created Date: 07/06/2022
%Author: Shun Suzuki
%-----
%Last Modified: 07/06/2022
%Modified By: Shun Suzuki (suzuki@hapis.k.u-tokyo.ac.jp)
%-----
%Copyright (c) 2022 Shun Suzuki. All rights reserved.
%
%}

function deinit_autd()
    unloadlibrary('autd3capi');
    unloadlibrary('autd3capi_link_soem');
end
