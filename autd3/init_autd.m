%{
%File: init_autd.m
%Project: autd3-matlab
%Created Date: 07/06/2022
%Author: Shun Suzuki
%-----
%Last Modified: 11/06/2022
%Modified By: Shun Suzuki (suzuki@hapis.k.u-tokyo.ac.jp)
%-----
%Copyright (c) 2022 Shun Suzuki. All rights reserved.
%
%}

function init_autd(use_link_soem, use_link_twincat, use_backend_cuda)

    arguments
        use_link_soem = true
        use_link_twincat = false
        use_backend_cuda = false
    end

    if ~isfolder('bin')
        mkdir('bin')
    end

    cd('bin');

    if ispc

        if ~isfile('bin/autd3capi.dll')
            url = 'https://github.com/shinolab/autd3/releases/download/v2.2.0/autd3-v2.2.0-win-x64.zip';
            websave('autd3-v2.2.0-win-x64.zip', url);
            unzip('autd3-v2.2.0-win-x64.zip');
            delete('autd3-v2.2.0-win-x64.zip');
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
        loadlibrary('bin/autd3capi_gain_holo.dll');

        if use_link_soem
            loadlibrary('bin/autd3capi_link_soem.dll');
        end

        loadlibrary('bin/autd3capi_link_emulator.dll');
        loadlibrary('bin/autd3capi_link_remote_twincat.dll');

        if use_link_twincat
            loadlibrary('bin/autd3capi_link_twincat.dll');
        end

        if use_backend_cuda
            loadlibrary('bin/autd3capi_backend_cuda.dll');
        end

        loadlibrary('bin/autd3capi_modulation_audio_file.dll');
    elseif ismac

        if ~isfile('bin/autd3capi.dylib')
            url = 'https://github.com/shinolab/autd3/releases/download/v2.2.0/autd3-v2.2.0-macos-universal.tar.gz';
            websave('autd3-v2.2.0-macos-universal.tar.gz', url);
            untar('autd3-v2.2.0-macos-universal.tar.gz');
            delete('autd3-v2.2.0-macos-universal.tar.gz');
            delete('LICENSE');
            delete('NOTICE');
            rmdir('lib', 's');
            rmdir('include', 's');
            rmdir('firmware', 's');
            cd('bin');
            files = dir('*.dylib');

            for id = 1:length(files)
                [~, f, ext] = fileparts(files(id).name);

                rename = strcat(strrep(strrep(f, 'lib', ''), '-', '_'), ext);
                disp(rename);
                movefile(files(id).name, rename);

            end

            cd('..');
        end

        loadlibrary('bin/autd3capi.dylib', 'autd3capi.h');
        loadlibrary('bin/autd3capi_gain_holo.dylib', 'autd3capi_gain_holo.h');

        if use_link_soem
            loadlibrary('bin/autd3capi_link_soem.dylib', 'autd3capi_link_soem.h');
        end

        if use_backend_cuda
            loadlibrary('bin/autd3capi_backend_cuda.dylib', 'autd3capi_backend_cuda.h');
        end

        loadlibrary('bin/autd3capi_link_emulator.dylib', 'autd3capi_link_emulator.h');
        loadlibrary('bin/autd3capi_link_remote_twincat.dylib', 'autd3capi_link_remote_twincat.h');

        loadlibrary('bin/autd3capi_modulation_audio_file.dylib', 'autd3capi_modulation_audio_file.h');

    elseif isunix

        if ~isfile('bin/autd3capi.so')
            url = 'https://github.com/shinolab/autd3/releases/download/v2.2.0/autd3-v2.2.0-linux-x64.tar.gz';
            websave('autd3-v2.2.0-linux-x64.tar.gz', url);
            untar('autd3-v2.2.0-linux-x64.tar.gz');
            delete('autd3-v2.2.0-linux-x64.tar.gz');
            delete('LICENSE');
            delete('NOTICE');
            rmdir('lib', 's');
            rmdir('include', 's');
            rmdir('firmware', 's');
            cd('bin');
            files = dir('*.so');

            for id = 1:length(files)
                [~, f, ext] = fileparts(files(id).name);

                rename = strcat(strrep(strrep(f, 'lib', ''), '-', '_'), ext);
                disp(rename);
                movefile(files(id).name, rename);

            end

            cd('..');
        end

        loadlibrary('bin/autd3capi.so', 'autd3capi.h');
        loadlibrary('bin/autd3capi_gain_holo.so', 'autd3capi_gain_holo.h');

        if use_link_soem
            loadlibrary('bin/autd3capi_link_soem.so', 'autd3capi_link_soem.h');
        end

        if use_backend_cuda
            loadlibrary('bin/autd3capi_backend_cuda.so', 'autd3capi_backend_cuda.h');
        end

        loadlibrary('bin/autd3capi_link_emulator.so', 'autd3capi_link_emulator.h');
        loadlibrary('bin/autd3capi_link_remote_twincat.so', 'autd3capi_link_remote_twincat.h');

        loadlibrary('bin/autd3capi_modulation_audio_file.so', 'autd3capi_modulation_audio_file.h');

    else
        disp('Platform not supported');
        return;
    end

    cd('..');

end
