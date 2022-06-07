%{
%File: Controller.m
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

classdef Controller < handle

    properties
        ptr
    end

    methods

        function obj = Controller()
            obj.ptr = libpointer('voidPtr', 0);
            pp = libpointer('voidPtrPtr', obj.ptr);
            calllib('autd3capi', 'AUTDCreateController', pp);
        end

        function idx = add_device(obj, pos, rot)
            idx = calllib('autd3capi', 'AUTDAddDevice', obj.ptr, pos(1), pos(2), pos(3), rot(1), rot(2), rot(3));
        end

        function idx = add_device_quaternion(obj, pos, rot)
            idx = calllib('autd3capi', 'AUTDAddDeviceQuaternion', obj.ptr, pos(1), pos(2), pos(3), rot(1), rot(2), rot(3), rot(4));
        end

        function res = open(obj, link)
            res = calllib('autd3capi', 'AUTDOpenController', obj.ptr, link.ptr);
        end

        function res = clear(obj)
            res = calllib('autd3capi', 'AUTDClear', obj.ptr);
        end

        function res = synchronize(obj)
            res = calllib('autd3capi', 'AUTDSynchronize', obj.ptr);
        end

        function res = close(obj)
            res = calllib('autd3capi', 'AUTDClose', obj.ptr);
        end

        function res = send(varargin)
            obj = varargin{1};

            if nargin >= 4
                res = false;
                return;
            end

            if nargin == 3

                if isa(varargin{2}, 'Header') && isa(varargin{3}, 'Body')
                    res = calllib('autd3capi', 'AUTDSendHeaderBody', obj.ptr, varargin{2}.ptr, varargin{3}.ptr);
                    return;
                end

                if isa(varargin{3}, 'Header') && isa(varargin{2}, 'Body')
                    res = calllib('autd3capi', 'AUTDSendHeaderBody', obj.ptr, varargin{3}.ptr, varargin{2}.ptr);
                    return;
                end

            end

            if nargin == 2

                if isa(varargin{2}, 'Header')
                    res = calllib('autd3capi', 'AUTDSendHeader', obj.ptr, varargin{2}.ptr);
                    return;
                end

                if isa(varargin{2}, 'Body')

                    res = calllib('autd3capi', 'AUTDSendBody', obj.ptr, varargin{2}.ptr);
                    return;
                end

            end

            res = false;
        end

        function list = firmware_info_list(obj)
            p = libpointer('voidPtr', 0);
            pp = libpointer('voidPtrPtr', p);
            n = calllib('autd3capi', 'AUTDGetFirmwareInfoListPointer', obj.ptr, pp);
            list = strings(n, 1);

            for i = 1:n
                info_p = libpointer('int8Ptr', zeros(128, 1, 'int8'));
                calllib('autd3capi', 'AUTDGetFirmwareInfo', p, i - 1, info_p);
                info = erase(convertCharsToStrings(char(info_p.value)), char(0));
                list(i) = info;
            end

            calllib('autd3capi', 'AUTDFreeFirmwareInfoListPointer', p);
        end

        function delete(obj)

            if obj.ptr.Value ~= 0
                calllib('autd3capi', 'AUTDFreeController', obj.ptr);
                obj.ptr = libpointer('voidPtr', 0);
            end

        end

    end

    methods (Static)

        function error = last_error()
            pn = libpointer('int8Ptr', 0);
            n = calllib('autd3capi', 'AUTDGetLastError', pn);
            p = libpointer('int8Ptr', zeros(n, 1, 'int8'));
            calllib('autd3capi', 'AUTDGetLastError', p);
            error = erase(convertCharsToStrings(char(p.value)), char(0));
        end

    end

end
