clear

origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\501.BMP');
grayImg=rgb2gray(origImg);
edgeImg=edge(grayImg,'Sobel',0.02);

figure('Position',[200,40,900,500],'name','Canny����');

edgeImg4=edge(grayImg,'Canny',0.28);%�ձ���ΪCanny����Ч�����
imshow(edgeImg4);
title("Canny")









