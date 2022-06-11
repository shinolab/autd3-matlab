%{
%File: GaussNewton.m
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

classdef GaussNewton < Holo

    methods

        function obj = GaussNewton(varargin)
            obj = obj@Holo();
            backend = varargin{1};

            if nargin < 2
                eps_1 = 1e-6;
            else
                eps_1 = varargin{2};
            end

            if nargin < 3
                eps_2 = 1e-6;
            else
                eps_2 = varargin{3};
            end

            if nargin < 4
                k_max = 500;
            else
                k_max = varargin{4};
            end

            if nargin < 5
                initial = libpointer('voidPtr', []);
                initial_size = 0;
            else
                initial = libpointer('voidPtr', varargin{5});
                initial_size = length(varargin{5});
            end

            pp = libpointer('voidPtrPtr', obj.ptr);
            calllib('autd3capi_gain_holo', 'AUTDGainHoloGaussNewton', pp, backend.ptr, eps_1, eps_2, k_max, initial, initial_size);
        end

    end

end
