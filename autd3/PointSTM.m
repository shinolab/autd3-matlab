%{
%File: PointSTM.m
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

classdef PointSTM < STM

    methods

        function obj = PointSTM()
            obj = obj@STM();
            pp = libpointer('voidPtrPtr', obj.ptr);
            calllib('autd3capi', 'AUTDPointSTM', pp);
        end

        function add(varargin)
            f = varargin{1};

            if nargin < 2
                shift = 0
            else
                shift = varargin{2};
            end

            calllib('autd3capi', 'AUTDPointSTMAdd', obj.ptr, f(1), f(2), f(3), shift);
        end

    end

end
