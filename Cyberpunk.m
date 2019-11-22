clear
clc
%origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\501.BMP');
%origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\D2HW_TIXgAAcJ8O.jpg');
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
%hsv����
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
% 
% c(:,:,1)=imadd(R,R2);%,'uint16');
% c(:,:,2)=imadd(G,G2);%,'uint16');
% c(:,:,3)=imadd(B,B2);%,'uint16');
% imshow(c)
% title('Modulated')
%%
[m1,n1,l1] = size(origImg2)
[m2,n2,l2] = size(origImg)
t = zeros(m1,n1,l1); 
t = uint8(t);


t((m1/2-m2/2+1):(m1/2+m2/2),(n1/2-n2/2+1):(n1/2+n2/2),:) = origImg2 ;%�����д���
C = imadd(0.5*t,origImg2);%����0.5���м�С��Ƭ��͸������
C((m1/2-m2/2+1):(m1/2+m2/2),(n1/2-n2/2+1):(n1/2+n2/2),:) =C((m1/2-m2/2+1):(m1/2+m2/2),(n1/2-n2/2+1):(n1/2+n2/2),:)-origImg((m1/2-m2/2+1):(m1/2+m2/2),(n1/2-n2/2+1):(n1/2+n2/2),:).*0.5;  %��pic_1����0.5����������

figure(7)
imshow(C);

%%
% %ƽ���˲�  
% r=rgb(:,:,1);  
% g=rgb(:,:,2); 
%  b=rgb(:,:,3); 
% m=fspecial('average',[8,8]); 
%  r_filtered=imfilter(r,m);
%  g_filtered=imfilter(g,m); 
%  b_filtered=imfilter(b,m);  
%  rgb_filtered=cat(3,r_filtered,g_filtered,b_filtered); 
%  figure;  imshow(rgb_filtered);  title('ģ����');
% imwrite(rgb_filtered, 'RGB��ɫ�ռ�ģ����.jpg');
% ��������������������������������
% ��Ȩ����������ΪCSDN������-������ʶ���������ԭ�����£���ѭ CC 4.0 BY-SA ��ȨЭ�飬ת���븽��ԭ�ĳ������Ӽ���������
% ԭ�����ӣ�https://blog.csdn.net/hzh_csdn/article/details/53269502
%������˹
% lapMatrix=[1 1 1;1 -8 1;1 1 1];    
%   i_tmp=imfilter(rgb,lapMatrix,'replicate'); 
%  i_sharped=imsubtract(rgb,i_tmp); 
%  figure;   imshow(i_sharped); title('�񻯺�');
% imwrite(i_sharped, 'RGB��ɫ�ռ��񻯺�.jpg');1




