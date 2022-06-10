%{
%File: EVD.m
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

classdef EVD < Holo

    methods

        function obj = EVD(varargin)
            obj = obj@Holo();
            backend = varargin{1};

            if nargin < 2
                gamma = 1.0;
            else
                gamma = varargin{2};
            end

            pp = libpointer('voidPtrPtr', obj.ptr);
            calllib('autd3capi_gain_holo', 'AUTDGainHoloEVD', pp, backend, gamma);
        end

    end

end
