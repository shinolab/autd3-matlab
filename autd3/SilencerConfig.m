%{
%File: SilencerConfig.m
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

classdef SilencerConfig < Header

    methods

        function obj = SilencerConfig(step, freq_div)
            obj = obj@Header();
            pp = libpointer('voidPtrPtr', obj.ptr);
            calllib('autd3capi', 'AUTDCreateSilencer', pp, step, freq_div);
        end

        function delete(obj)

            if obj.ptr.Value ~= 0
                calllib('autd3capi', 'AUTDDeleteSilencer', obj.ptr);
                obj.ptr = libpointer('voidPtr', 0);
            end

        end

    end

end
