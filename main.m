%ΚοΙζινΚΜΜOγΦWθ MainvO

clear; close all;

ORG = imread('img.jpg');
SEG = segImg(ORG,3);
% tmp = SEG{1};
% imshow(tmp);
flag = isBG(SEG);