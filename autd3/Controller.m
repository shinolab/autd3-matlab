%{
%File: Controller.m
%Project: autd3-matlab
%Created Date: 07/06/2022
%Author: Shun Suzuki
%-----
%Last Modified: 10/06/2022
%Modified By: Shun Suzuki (suzuki@hapis.k.u-tokyo.ac.jp)
%-----
%Copyright (c) 2022 Shun Suzuki. All rights reserved.
%
%}

classdef Controller < handle

    properties
        ptr
        reads_fpga_info = false
        force_fan = false
        attenuation = 0.0
        check_ack = false
        sound_speed = 340
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

        function res = stop(obj)
            res = calllib('autd3capi', 'AUTDStop', obj.ptr);
        end

        function res = close(obj)
            res = calllib('autd3capi', 'AUTDClose', obj.ptr);
        end

        function res = is_open(obj)
            res = calllib('autd3capi', 'AUTDIsOpen', obj.ptr);
        end

        function set.force_fan(obj, value)
            obj.force_fan = value;
            calllib('autd3capi', 'AUTDSetForceFan', obj.ptr, value);
        end

        function value = get.force_fan(obj)
            value = calllib('autd3capi', 'AUTDGetForceFan', obj.ptr);
        end

        function set.reads_fpga_info(obj, value)
            obj.reads_fpga_info = value;
            calllib('autd3capi', 'AUTDSetReadsFPGAInfo', obj.ptr, value);
        end

        function value = get.reads_fpga_info(obj)
            value = calllib('autd3capi', 'AUTDGetReadsFPGAInfo', obj.ptr);
        end

        function set.check_ack(obj, value)
            obj.check_ack = value;
            calllib('autd3capi', 'AUTDeStCheckAck', obj.ptr, value);
        end

        function value = get.check_ack(obj)
            value = calllib('autd3capi', 'AUTDGetCheckAck', obj.ptr);
        end

        function set.sound_speed(obj, value)
            obj.sound_speed = value;
            calllib('autd3capi', 'AUTDSetSoundSpeed', obj.ptr, value);
        end

        function value = get.sound_speed(obj)
            value = calllib('autd3capi', 'AUTDGetSoundSpeed', obj.ptr);
        end

        function set.attenuation(obj, value)
            obj.attenuation = value;
            calllib('autd3capi', 'AUTDSetAttenuation', obj.ptr, value);
        end

        function value = get.attenuation(obj)
            value = calllib('autd3capi', 'AUTDGetAttenuation', obj.ptr);
        end

        function freq = get_trans_frequency(obj, dev_idx, trans_idx)
            freq = calllib('autd3capi', 'AUTDGetTransFrequency', obj.ptr, dev_idx, trans_idx);
        end

        function set_trans_frequency(obj, dev_idx, trans_idx, freq)
            calllib('autd3capi', 'AUTDSetTransFrequency', obj.ptr, dev_idx, trans_idx, freq);
        end

        function cycle = get_trans_cycle(obj, dev_idx, trans_idx)
            cycle = calllib('autd3capi', 'AUTDGetTransCycle', obj.ptr, dev_idx, trans_idx);
        end

        function set_trans_cycle(obj, dev_idx, trans_idx, cycle)
            calllib('autd3capi', 'AUTDSetTransCycle', obj.ptr, dev_idx, trans_idx, cycle);
        end

        function wavelength = wavelength(obj, dev_idx, trans_idx)
            wavelength = calllib('autd3capi', 'AUTDGetWavelength', obj.ptr, dev_idx, trans_idx, obj.sound_speed);
        end

        function set_mod_delay(obj, dev_idx, trans_idx, delay)
            calllib('autd3capi', 'AUTDSetModDelay', obj.ptr, dev_idx, trans_idx, delay);
        end

        function pos = trans_position(obj, dev_idx, trans_idx)
            px = libpointer('doublePtr', 0);
            py = libpointer('doublePtr', 0);
            pz = libpointer('doublePtr', 0);
            calllib('autd3capi', 'AUTDTransPosition', obj.ptr, dev_idx, trans_idx, px, py, pz);
            pos = [px.Value; py.Value; pz.Value];
        end

        function dir = trans_x_direction(obj, dev_idx, trans_idx)
            px = libpointer('doublePtr', 0);
            py = libpointer('doublePtr', 0);
            pz = libpointer('doublePtr', 0);
            calllib('autd3capi', 'AUTDTransXDirection', obj.ptr, dev_idx, trans_idx, px, py, pz);
            dir = [px.Value; py.Value; pz.Value];
        end

        function dir = trans_y_direction(obj, dev_idx, trans_idx)
            px = libpointer('doublePtr', 0);
            py = libpointer('doublePtr', 0);
            pz = libpointer('doublePtr', 0);
            calllib('autd3capi', 'AUTDTransYDirection', obj.ptr, dev_idx, trans_idx, px, py, pz);
            dir = [px.Value; py.Value; pz.Value];
        end

        function dir = trans_z_direction(obj, dev_idx, trans_idx)
            px = libpointer('doublePtr', 0);
            py = libpointer('doublePtr', 0);
            pz = libpointer('doublePtr', 0);
            calllib('autd3capi', 'AUTDTransZDirection', obj.ptr, dev_idx, trans_idx, px, py, pz);
            dir = [px.Value; py.Value; pz.Value];
        end

        function res = num_devices(obj)
            res = calllib('autd3capi', 'AUTDNumDevices', obj.ptr);
        end

        function res = update_flags(obj)
            res = calllib('autd3capi', 'AUTDUpdateFlags', obj.ptr);
        end

        function res = send(varargin)
            obj = varargin{1};

            if nargin >= 4
                res = false;
                return;
            end

            if nargin == 3

                if isa(varargin{2}, 'Header') && isa(varargin{3}, 'Body')
                    res = calllib('autd3capi', 'AUTDSend', obj.ptr, varargin{2}.ptr, varargin{3}.ptr);
                    return;
                end

                if isa(varargin{3}, 'Header') && isa(varargin{2}, 'Body')
                    res = calllib('autd3capi', 'AUTDSend', obj.ptr, varargin{3}.ptr, varargin{2}.ptr);
                    return;
                end

            end

            if nargin == 2

                if isa(varargin{2}, 'Header')
                    np = libpointer('voidPtr', 0);
                    res = calllib('autd3capi', 'AUTDSend', obj.ptr, varargin{2}.ptr, np);
                    return;
                end

                if isa(varargin{2}, 'Body')
                    np = libpointer('voidPtr', 0);
                    res = calllib('autd3capi', 'AUTDSend', obj.ptr, np, varargin{2}.ptr);
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

        function list = fpga_info(obj)
            n = obj.num_devices();
            info_p = libpointer('uint8Ptr', zeros(n, 1, 'uint8'));
            calllib('autd3capi', 'AUTDGetFPGAInfo', obj.ptr, info_p);
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
