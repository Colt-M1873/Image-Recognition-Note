clear

info=imfinfo('C:\Users\lenovo\Documents\MATLAB\imageProcessing\D2HW_TIXgAAcJ8O.jpg')%��ȡͼƬ��Ϣ
origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\D2HW_TIXgAAcJ8O.jpg');%��ͼƬ
figure(1)
subplot(221);
imshow(origImg);%��ʾԭͼ
title('Original')

grayImg=rgb2gray(origImg);%��Ҷ�ͼ
grayImg1=grayImg;
subplot(222);
imshow(grayImg);
title('GrayImage')

%ͼ������㣬����ĳ������
[R,C]=size(grayImg);%size��ͼƬ��С��Row��Column
for i=1:R
    for j=1:C
        if grayImg(i,j)<=50||(grayImg(i,j)>=70&&grayImg(i,j)<=90)||(grayImg(i,j)>=110&&grayImg(i,j)<=130)%�����ڽ�ͼ�����һ����������
            grayImg(i,j)=255;
        end
    end
end
subplot(223);
imshow(grayImg);
title('Squarewave filter')

b=double(grayImg1).*double(grayImg1)*0.0001;%grayImg��ƽ���ٳ���0.0001
subplot(224);
imshow(b);
title('(x^2)/10000')

