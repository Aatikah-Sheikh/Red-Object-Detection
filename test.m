frame = s.RedImage;

imshow(uint8(frame));
title('Raw frame');


%Split Channels
R = frame(:,:,1);
G = frame(:,:,2);
B = frame(:,:,3);

figure;
subplot(1,3,1);
imshow(R); 
title ('Red Channel');
subplot(1,3,2);
imshow(G); 
title ('Green Channel');
subplot(1,3,3);
imshow(B); 
title ('Blue Channel');

% RedMin = 100;
% RedMax = 255;
 GrMax = 80;
% BlueMax = 80;

redMask = (R > 100) & (R > G + 40) & (G <= GrMax) & (R > B +40);

figure;
imshow(redMask);
title('Red Mask');

if any(redMask(:))
    disp('Red Detected');
else
    disp('No red detected');
end 