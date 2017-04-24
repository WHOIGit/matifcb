function out_im = ifcb_blob(in_im, in_sim)

    target.config = configure();
    target.image = in_im;
    
    if nargin > 1
        mask = zeros(size(in_sim));
        mask(isnan(in_sim))=1;
        st = strel('disk',1);
        mask = imdilate(mask, st);
        target.chop = mask;
    end
    
    target = blob(target);
    
    out_im = target.blob_image;
end