%{
%File: SineLegacy.m
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

classdef SineLegacy < Modulation

    methods

        function obj = SineLegacy(varargin)
            obj = obj@Modulation();
            f = varargin{1};

            if nargin < 2
                amp = 1.0;
            else
                amp = varargin{2};
            end

            if nargin < 3
                offset = 0.5;
            else
                offset = varargin{3};
            end

            pp = libpointer('voidPtrPtr', obj.ptr);
            calllib('autd3capi', 'AUTDModulationSineLegacy', pp, f, amp, offset);
        end

    end

end
