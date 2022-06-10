%{
%File: Holo.m
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

classdef Holo < Gain

    methods

        function obj = Holo(varargin)
            obj = obj@Gain();
        end

        function add(obj, f, amp)
            calllib('autd3capi_gain_holo', 'AUTDGainHoloAdd', obj.ptr, f(1), f(2), f(3), amp);
        end

        function set_constraint(obj, type, param)
            pparam = libpointer('voidPtr', param);
            calllib('autd3capi_gain_holo', 'AUTDSetConstraint', obj.ptr, int32(type), pparam);
        end

    end

end
