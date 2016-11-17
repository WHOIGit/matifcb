function bin = ifcb_open_url(url)
    [namespace, lid, ~] = fileparts(url);
    
    adc_url = [namespace '/' lid '.adc'];
    roi_url = [namespace '/' lid '.roi'];
    hdr_url = [namespace '/' lid '.hdr'];
    
    adc_path = [tempdir filesep lid '.adc'];
    roi_path = [tempdir filesep lid '.roi'];
    hdr_path = [tempdir filesep lid '.hdr'];
    
    function delfiles()
        if exist(hdr_path,'file')
            delete(hdr_path);
        end
        if exist(adc_path,'file')
            delete(adc_path);
        end
        if exist(roi_path,'file')
            delete(roi_path);
        end
    end

    try
        websave(hdr_path, hdr_url);
        websave(adc_path, adc_url);
        websave(roi_path, roi_url);

        bin = ifcb_open_raw(adc_path);
        
        delfiles();
    catch ME
        delfiles();
        rethrow(ME);
    end

end