function path = ifcb_find_raw(root_dir, lid)

    dirwalk(root_dir);
    
    function dirwalk(name) 
        directory = dir(name); 
        for i = 1:length(directory)
            basepath = directory(i).name;
            abspath = [name filesep basepath];
            if(~strcmp(basepath,'.') && ~strcmp(basepath,'..')) 
                if(directory(i).isdir)
                    if strfind(lid, basepath)
                        dirwalk(abspath); 
                    end
                else
                    [~, base, ~] = fileparts(basepath);
                    if strcmp(base,lid)
                        path = abspath;
                        return;
                    end
                end 
            end
        end
    end 

end