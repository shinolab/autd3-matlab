%{
%File: init_autd.m
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

function init_autd()

    if ~isfolder('bin')
        mkdir('bin')
    end

    cd('bin');

    if ispc

        if ~isfile('bin/autd3capi.dll')
            url = 'https://github.com/shinolab/autd3/releases/download/v2.1.0/autd3-v2.1.0-win-x64.zip';
            websave('autd3-v2.1.0-win-x64.zip', url);
            unzip('autd3-v2.1.0-win-x64.zip');
            delete('autd3-v2.1.0-win-x64.zip');
            delete('LICENSE');
            delete('NOTICE');
            rmdir('lib', 's');
            rmdir('include', 's');
            rmdir('AUTDServer', 's');
            rmdir('firmware', 's');
            cd('bin');
            files = dir('*.dll');

            for id = 1:length(files)
                [~, f, ext] = fileparts(files(id).name);

                if contains(f, '-')
                    rename = strcat(strrep(f, '-', '_'), ext);
                    movefile(files(id).name, rename);
                end

            end

            cd('..');
        end

        loadlibrary('bin/autd3capi.dll');
        loadlibrary('bin/autd3capi_link_soem.dll');
    else
        disp('Platform not supported');
        return;
    end

    cd('..');

end
