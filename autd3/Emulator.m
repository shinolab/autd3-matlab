%{
%File: Emulator.m
%Project: autd3
%Created Date: 10/06/2022
%Author: Shun Suzuki
%-----
%Last Modified: 11/06/2022
%Modified By: Shun Suzuki (suzuki@hapis.k.u-tokyo.ac.jp)
%-----
%Copyright (c) 2022 Shun Suzuki. All rights reserved.
%
%}

classdef Emulator < handle

    properties
        ptr
    end

    methods

        function obj = Emulator(port, cnt)
            obj.ptr = libpointer('voidPtr', 0);
            pp = libpointer('voidPtrPtr', obj.ptr);
            calllib('autd3capi_link_emulator', 'AUTDLinkEmulator', pp, port, cnt.ptr);
        end

    end

end
