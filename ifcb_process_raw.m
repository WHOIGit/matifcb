function ifcb_process_raw(root_dir, callback)

    dirwalk(root_dir);
    
    function dirwalk(name) 
        directory = dir(name); 
        for i = 1:length(directory)
            basepath = directory(i).name;
            abspath = [name filesep basepath];
            if(~strcmp(basepath,'.') && ~strcmp(basepath,'..')) 
                if(directory(i).isdir)
                    dirwalk(abspath);
                else
                    [~, ~, ext] = fileparts(basepath);
                    if strcmp(ext,'.adc')
                        callback(abspath);
                    end
                end 
            end
        end
    end
end