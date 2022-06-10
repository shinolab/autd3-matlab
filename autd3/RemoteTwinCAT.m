%{
%File: RemoteTwinCAT.m
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

classdef RemoteTwinCAT < handle

    properties
        ptr
    end

    methods

        function obj = RemoteTwinCAT(remote_ip_addr, remote_ams_net_id, local_ams_net_id)
            obj.ptr = libpointer('voidPtr', 0);
            pp = libpointer('voidPtrPtr', obj.ptr);
            remote_ip_addr_ = libpointer('cstring', remote_ip_addr);
            remote_ams_net_id_ = libpointer('cstring', remote_ams_net_id);
            local_ams_net_id_ = libpointer('cstring', local_ams_net_id);
            calllib('autd3capi_link_remote_twincat', 'AUTDLinkRemoteTwinCAT', pp, remote_ip_addr_, remote_ams_net_id_, local_ams_net_id_);
        end

    end

end
