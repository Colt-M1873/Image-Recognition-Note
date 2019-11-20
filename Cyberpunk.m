clear
clc
%origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\501.BMP');
origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\mensweardog.jpg');
figure(1)
imshow(origImg);
R=origImg(:,:,1);
G=origImg(:,:,2);
B=origImg(:,:,3);

R=R*0.6-30;
%imshow(secImg)
rgbcImg=cat(3,R,G*1.5+30,B*1.7+50);
figure(2)
imshow(rgbcImg)
title('RGB Modulated')

%%
%hsvµ÷½Ú
hsvImg=rgb2hsv(origImg);
figure(3)
imshow(origImg)

H=hsvImg(:,:,1);
S=hsvImg(:,:,2);
V=hsvImg(:,:,3);
hsvcImg=cat(3,H*0.000000000,S,V);
hsvcImg=hsv2rgb(hsvcImg);
figure(4)
imshow(hsvcImg)
title('HSV Modulated')










