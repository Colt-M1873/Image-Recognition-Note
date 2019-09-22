%�ô�����д���ͼƬ�������У�Ostu��ֵ�� + ͼƬ��    �������͸�ʴ�򿪱յ���������
%�������õ�����ͨ���򷽷���ͨ����Ҫ��regionprops��������������ı궨�ͼ���
%��Ostu�����õ�������������������²���ȥ���߽�ճ��������Ӱ�죬��ʹʵ����ճ���������Ͻ�Ҳ�������У���˻����һ������

%��ע��regionprop�е�area�����������������

clear

origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\501.BMP');

figure('Position',[200,40,900,500],'name','��ͨ���򷨼���');
subplot(221)
grayImg=rgb2gray(origImg);
imshow(grayImg);
title("Gray Image");

%��ֵ������
level=graythresh(grayImg)%���������䷽���Otsu���ҵ�ͼƬ��һ��������ֵ��0-1֮�䣩
bwImg=imbinarize(grayImg,level);%�˴�����levelǰ����мӼ��Դﵽ�������ͻ��߸�ʴ��Ч��
subplot(222);
imshow(bwImg);
title("Ostu Binarize with threshould "+num2str(level))

%���´���Ϊ�������㣬�д�ѧϰ 
% se=strel('disk',5);
% bwImg = imclose(bwImg,se);
% bwImg = imopen(bwImg,se);


%�����ֵͼ������ͨ�������
subplot(223)
compImg=imcomplement(bwImg);
[Label,num]=bwlabel(compImg,8);%�˴���Label�����Ǳ�ǩ���󣬵ڶ�������Ϊ4��8����ʾ�жϷ���Ϊ4��ͨ����8��ͨ����compImg�е�������ͨ����ֱ���1��2��3��4���α������num��ʾ�ܵ���ͨ�������,
num %�˴�Ϊ����������������ʾ����
imshow(compImg);
title(num2str(num)+" balls in total")

%�����ͨ�����Լ�������
subplot(224)
status=regionprops(Label,'BoundingBox');%regionprops�д�ѧ�ʣ���������ĵ����˴�BoundingBox�ǻ���С��Ӿ��Σ�����ֵstatusΪ�ṹ������
centroid = regionprops(Label,'Centroid');%Centroid������
imshow(grayImg);hold on;
for i=1:num
    rectangle('position',status(i).BoundingBox,'edgecolor','r');
    text(centroid(i,1).Centroid(1,1)-10,centroid(i,1).Centroid(1,2)-10, num2str(i),'Color', 'r') 
end
title("Mark all "+num2str(num)+" connected components")
