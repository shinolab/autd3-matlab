%{
%File: soem.m
%Project: autd3-matlab
%Created Date: 11/06/2022
%Author: Shun Suzuki
%-----
%Last Modified: 11/06/2022
%Modified By: Shun Suzuki (suzuki@hapis.k.u-tokyo.ac.jp)
%-----
%Copyright (c) 2022 Shun Suzuki. All rights reserved.
%
%}

addpath('autd3')

Error = [];

use_link_soem = true;
use_backend_cuda = false;

try
    init_autd(use_link_soem, use_backend_cuda);

    adapters = SOEM.enumerate_adapters();

    adapters_list = strings(length(adapters));

    for i = 1:length(adapters)
        s = sprintf('[%d]: %s, %s', i, adapters(i, 1), adapters(i, 2));
        adapters_list(i) = s;
    end

    [i, ok] = listdlg('ListString', adapters_list, 'PromptString', 'Select one interface', 'SelectionMode', 'single', 'ListSize', [600, 600]);

    if ~ok || ~isnumeric(i) || i > length(adapters)
        throw(MException('MATLAB:BadIndex', 'Index out of range'));
    end

    ifname = adapters(i, 2);
    link = SOEM(ifname, 1, 2, true);

    cnt = Controller();
    cnt.add_device([0 0 0], [0 0 0]);

    if ~cnt.open(link)
        disp(Controller.last_error());
        throw(MException('MATLAB:RuntimeError', 'Cannot open link'));
    end

    runner(cnt);
catch Error

    for e = Error
        disp(e);
    end

end

deinit_autd(use_link_soem, use_backend_cuda);
