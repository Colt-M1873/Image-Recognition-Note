clear

info1=imfinfo('C:\Users\lenovo\Documents\MATLAB\imageProcessing\D2HW_TIXgAAcJ8O.jpg')%��ȡͼƬ��Ϣ
origImg1=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\D2HW_TIXgAAcJ8O.jpg');%��ͼƬ
info2=imfinfo('C:\Users\lenovo\Documents\MATLAB\imageProcessing\Dxim5yNWwAcBcqt.jpg')%��ȡͼƬ��Ϣ
origImg2=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\Dxim5yNWwAcBcqt.jpg');%��ͼƬ
figure(1)
subplot(221);
imshow(origImg1);%��ʾԭͼ
title('Original 1')
subplot(222);
imshow(origImg2);%��ʾԭͼ
title('Original 2')

sumImg=imadd(origImg1,origImg2);
subplot(223);
imshow(sumImg);
title('OrigImg 1+ OrigImg 2')

subImg=imsubtract(origImg1,origImg2);
subplot(224);
imshow(subImg);
title('OrigImg 1- OrigImg 2')


compImg=imcomplement(origImg1);%����ͼ��
figure(2)
subplot(221);
imshow(origImg1);
title('Original 1')
subplot(222);
imshow(compImg);
title('Complement Img of OrigImg 1')


grayImg1=rgb2gray(origImg1);%��Ҷ�ͼ
subplot(223);
imshow(grayImg1);
title('GrayImg 1')

compgrayImg=imcomplement(grayImg1);%����ͼ��
subplot(224);
imshow(compgrayImg);
title('Complement Img of GrayImg 1')

[R,C]=size(grayImg1);%size��ͼƬ��С��Row��Column
number=zeros(1,256);%������������ڻ���һ������,����Ϊ�Ҷ�ֵ������numberΪ�ûҶ�ֵ�ĵ�ĸ���
for i=1:R
    for j=1:C
        if grayImg1(i,j)<=30%��ѯÿ�����صĻҶ�ֵ
            grayImg1(i,j)=0;
        end
    end
end
figure(3)
subplot(221);
imshow(grayImg1);
title('grayImg1')












