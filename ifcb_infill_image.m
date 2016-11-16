function out_im = ifcb_infill_image(in_im)

    % create mask with ones where image data is
    mask = ones(size(in_im));
    mask(isnan(in_im)) = 0;
    
    % remove everything except pixels adjacent to gaps
    mask = bwmorph(mask,'remove');
    mask(1,:) = mask(2,:);
    mask(end,:) = mask(end-1,:);
    mask(:,1) = mask(:,2);
    mask(:,end) = mask(:,end-1);
    
    % compute mean intensity of pixels adjacent to gaps
    m = round(mean(in_im(mask)));
    
    out_im = in_im;
    
    % fill nans with computed infill
    out_im(isnan(in_im)) = m;
    
    out_im = uint8(out_im);
end