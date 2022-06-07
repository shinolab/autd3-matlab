%{
%File: SOEM.m
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

classdef SOEM < handle

    properties
        ptr
    end

    methods

        function obj = SOEM(ifname, device_num, cycle_ticks, high_precision)
            obj.ptr = libpointer('voidPtr', 0);
            pp = libpointer('voidPtrPtr', obj.ptr);
            ifname_ = libpointer('cstring', ifname);
            on_lost = libpointer('voidPtr', 0);
            calllib('autd3capi_link_soem', 'AUTDLinkSOEM', pp, ifname_, device_num, cycle_ticks, on_lost, high_precision);
        end

    end

    methods (Static)

        function adapters = enumerate_adapters()
            p = libpointer('voidPtr', 0);
            pp = libpointer('voidPtrPtr', p);
            n = calllib('autd3capi_link_soem', 'AUTDGetAdapterPointer', pp);
            adapters = strings(n, 2);

            for i = 1:n
                desc_p = libpointer('int8Ptr', zeros(128, 1, 'int8'));
                name_p = libpointer('int8Ptr', zeros(128, 1, 'int8'));
                calllib('autd3capi_link_soem', 'AUTDGetAdapter', p, i - 1, desc_p, name_p);
                desc = erase(convertCharsToStrings(char(desc_p.value)), char(0));
                name = erase(convertCharsToStrings(char(name_p.value)), char(0));
                adapters(i, :) = [desc, name];
            end

            calllib('autd3capi_link_soem', 'AUTDFreeAdapterPointer', p);
        end

    end

end
