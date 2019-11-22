clear
clc
%origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\501.BMP');
origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\D2HW_TIXgAAcJ8O.jpg');
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
%hsv调节
hsvImg=rgb2hsv(origImg);
figure(3)
imshow(origImg)

H=hsvImg(:,:,1);
S=hsvImg(:,:,2);
V=hsvImg(:,:,3);
hsvcImg=cat(3,H,S,V);
hsvcImg=hsv2rgb(hsvcImg);
figure(4)
imshow(hsvcImg)
title('HSV Modulated')

origImg2=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\Dxim5yNWwAcBcqt.jpg');
figure(5)
imshow(origImg2);
R2=origImg2(:,:,1);
G2=origImg2(:,:,2);
B2=origImg2(:,:,3);

c(:,:,1)=imadd(R,R2);%,'uint16');
c(:,:,2)=imadd(G,G2);%,'uint16');
c(:,:,3)=imadd(B,B2);%,'uint16');
imshow(c)
title('Modulated')





%%
% %平滑滤波  
% r=rgb(:,:,1);  
% g=rgb(:,:,2); 
%  b=rgb(:,:,3); 
% m=fspecial('average',[8,8]); 
%  r_filtered=imfilter(r,m);
%  g_filtered=imfilter(g,m); 
%  b_filtered=imfilter(b,m);  
%  rgb_filtered=cat(3,r_filtered,g_filtered,b_filtered); 
%  figure;  imshow(rgb_filtered);  title('模糊后');
% imwrite(rgb_filtered, 'RGB彩色空间模糊后.jpg');
% ————————————————
% 版权声明：本文为CSDN博主「-似曾相识燕归来」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
% 原文链接：https://blog.csdn.net/hzh_csdn/article/details/53269502
%拉普拉斯
% lapMatrix=[1 1 1;1 -8 1;1 1 1];    
%   i_tmp=imfilter(rgb,lapMatrix,'replicate'); 
%  i_sharped=imsubtract(rgb,i_tmp); 
%  figure;   imshow(i_sharped); title('锐化后');
% imwrite(i_sharped, 'RGB彩色空间锐化后.jpg');1




