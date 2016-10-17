% �ʕ�ɂ��O�㔻��v���O����

clear; close all;

SEG = cell(1,3);
CONV = cell(1,3);
SEG{1} = rgb2gray(imread('segmented_images_01.jpg'));
SEG{2} = rgb2gray(imread('segmented_images_02.jpg'));
SEG{3} = rgb2gray(imread('segmented_images_03.jpg'));
BGFlag = [false,false,false];

for ii = 1:3
    countWhite = 0;
    countBlack = 0;
    img = SEG{ii};
    imshow(img); %pause;
    imhist(img); pause;
    [x,y] = size(img);
    for jj = 1:x
        for kk = 1:y
            if img(jj,kk) == 255
                countWhite = countWhite + 1;
            end
            if img(jj,kk) == 0
                countBlack = countBlack + 1;
            end
        end
    end
    if countWhite > countBlack
        BGFlag(ii) = true;
    end
end

for ii = 1:3
    if BGFlag(ii) == false
        SEG{ii} = SEG{ii}>Threshold(SEG{ii});
        %imshow(SEG{ii}); pause;
        CONV{ii} = toConvHull(SEG{ii});
        %imshow(conv); pause;
        
    end
end