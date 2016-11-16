function cols = ifcb_columns(path)
    s1 = struct();
    s1.TRIGGER = 1;
    s1.ROI_X = 10;
    s1.ROI_Y = 11;
    s1.ROI_WIDTH = 12;
    s1.ROI_HEIGHT = 13;
    s1.START_BYTE = 14;

    s2 = struct();
    s2.TRIGGER = 1;
    s2.ROI_X = 14;
    s2.ROI_Y = 15;
    s2.ROI_WIDTH = 16;
    s2.ROI_HEIGHT = 17;
    s2.START_BYTE = 18;

    [~, basepath, ~] = fileparts(path);

    if basepath(1) == 'I'
        cols = s1;
    else
        cols = s2;
    end
end