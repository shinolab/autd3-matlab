%{
%File: simple.m
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

addpath('autd3')

Error = [];

use_link_soem = true;
use_link_twincat = false;
use_backend_cuda = false;

try
    init_autd(use_link_soem, use_link_twincat, use_backend_cuda);

    adapters = SOEM.enumerate_adapters();

    for i = 1:length(adapters)
        s = sprintf('[%d]: %s, %s', i, adapters(i, 1), adapters(i, 2));
        disp(s);
    end

    prompt = 'Choose interface: ';
    i = input(prompt);

    if ~isnumeric(i) || i > length(adapters)
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

    cnt.clear();
    cnt.synchronize();

    firm_list = cnt.firmware_info_list();

    for i = 1:length(firm_list)
        disp(firm_list(i));
    end

    config = SilencerConfig(10, 4096);
    cnt.send(config);
    config.delete();

    TRANS_SPACING_MM = 10.16;
    NUM_TRANS_X = 18;
    NUM_TRANS_Y = 14;
    x = TRANS_SPACING_MM * ((NUM_TRANS_X - 1.0) / 2.0);
    y = TRANS_SPACING_MM * ((NUM_TRANS_Y - 1.0) / 2.0);
    z = 150.0;

    g = Focus([x y z]);
    m = Sine(150);

    cnt.send(m, g);

    g.delete();
    m.delete();

    prompt = 'press any key to finish...';
    input(prompt);

    cnt.clear();
    cnt.close();

    cnt.delete();
catch Error

    for e = Error
        disp(e);
    end

end

deinit_autd(use_link_soem, use_link_twincat, use_backend_cuda);
