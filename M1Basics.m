clear

info=imfinfo('C:\Users\lenovo\Documents\MATLAB\imageProcessing\mensweardog.jpg')%��ȡͼƬ��Ϣ
origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\mensweardog.jpg');%��ͼƬ
figure(1)
subplot(221);
imshow(origImg);%��ʾԭͼ
title('Original')

grayImg=rgb2gray(origImg);%��Ҷ�ͼ
subplot(222);
imshow(grayImg);
title('GrayImage')

%��ֵ������
level=graythresh(grayImg)%���������䷽���Otsu���ҵ�ͼƬ��һ��������ֵ��0-1֮�䣩
bwImg=imbinarize(grayImg,level);%��levelΪ��ֵ��ͼ����ж�ֵ������
subplot(223);
imshow(bwImg);
title('Ostu Binarize')

bwImg2=imbinarize(grayImg,0.5);%��0.5Ϊ��ֵ��ͼ����ж�ֵ������
subplot(224);
imshow(bwImg2);
title('Threshold 0.5 Binarize')

%�ֶ�д������ֱ��ͼ
[R,C]=size(grayImg);%size��ͼƬ��С��Row��Column
number=zeros(1,256);%������������ڻ���һ������,����Ϊ�Ҷ�ֵ������numberΪ�ûҶ�ֵ�ĵ�ĸ���
for i=1:R
    for j=1:C
        for index=1:256
            if grayImg(i,j)==index-1%��ѯÿ�����صĻҶ�ֵ
                number(1,index)=number(1,index)+1;%�ڶ�Ӧ�Ҷ�ֵ�ĵ�ĸ�����һ
            end
        end
    end
end
figure(2)
%figure('name','ֱ��ͼ')
subplot(511);
plot(number),xlim([0,256]),title('��д������ֱ��ͼ')
subplot(512);
one_number=number/(R*C);
plot(one_number),xlim([0,256]),title('��һ��ֱ��ͼ')
%%

%matlab�Դ�ֱ��ͼ����
subplot(513);
imhist(grayImg)%��Ĭ�Ϸ�ʽֱ����ʾֱ��ͼ
%%
subplot(514);
imhist(grayImg,30)%��30���Ҷȼ���ʾֱ��ͼ
%%
grayHist=imhist(grayImg);%����ֵΪһ������Ϊ256�����У���������Ӧλ�õ���ֵΪ�ûҶ��µ�ĸ���
subplot(515);
plot(grayHist),xlim([0,256]),title('MATLAB�Դ�������ֱ��ͼ')
%%
%ֱ��ͼ���⻯
figure(3)
eqImg=histeq(grayImg);%����Ĭ�ϻҶȼ���grayImg����ֱ��ͼ����
subplot(211)
imshow(eqImg)
subplot(212)
imhist(eqImg)%��ʾ������ֱ��ͼ
%%
figure(4)
eqImg2=histeq(grayImg,10);%����10���Ҷȼ���grayImg����ֱ��ͼ����
subplot(211)
imshow(eqImg2)
subplot(212)
imhist(eqImg2)
%%

figure(5)
histFunc=10:50:255;%���⺯������50Ϊ����ֵ�����ֻҶȼ�
eqImg3=histeq(grayImg,histFunc);%
subplot(211)
imshow(eqImg3)
subplot(212)
imhist(eqImg3)

%%
%ֱ��ͼ�涨��
% figure(6)
% eqHist=imhist(eqImg3);
% eqImg2=histeq(grayImg);
% subplot(212)
% imshow(eqImg2)
% 
% subplot(212);
% plot(eqHist),xlim([0,256]),title('ֱ��ͼ')

%%
%���Դ���
figure(6)
subplot(221)
imshow(grayImg)
subplot(222)
plusgrayImg=grayImg+150;%������ǿ����
imshow(plusgrayImg)
subplot(223)
plusgrayImg=grayImg/30+150;%�����ԱȶȲ���ǿ����
imshow(plusgrayImg)
subplot(224)
plusgrayImg=(plusgrayImg-150)*30;%���������ܻ�ԭͼ�񣬵�������ȫ��ԭ����Ϊ�ڵ�һ�γ���ʱС����ȡ���������
imshow(plusgrayImg)






