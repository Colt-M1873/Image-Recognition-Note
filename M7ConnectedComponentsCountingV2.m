%�����M6�ô�����м����˿������㣬Ч����Ȼ�������⣬��������˴�����ͨ�������в�ͨ�ģ�������Ϊ���򣬵���Ҫ���������ȡ��������̬ѧ����
%ͼ������Ostu��ֵ������Ĭ����ֵ�����ʹʽ����С��0.1����ʵ�����⽫�Ǻܼ��ֵ����⣬Ŀǰ��֪���ȷ�����ʵ���ֵ��Ҳ�޷�Ȩ����ֵ�ͽ��������������ں˴�С֮��Ĺ�ϵ����˻����һ��ʵ�飩
%Ȼ���󲹣�Ȼ����ֱ��Ϊ5��Բ����Ϊ�ں˶�ͼƬ�����˱����㣬��С�˺�ɫ���ֵ�ճ��
%�������õ�����ͨ���򷽷���ͨ����Ҫ��regionprops��������������ı궨�ͼ���

%��ע��regionprop�е�area�����������������

clear

origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\501.BMP');

figure('Position',[200,40,900,500],'name','��ͨ���򷨼���');
subplot(341)
grayImg=rgb2gray(origImg);
imshow(grayImg);
title("Gray Image");

%��ֵ������
level=graythresh(grayImg)%���������䷽���Otsu���ҵ�ͼƬ��һ��������ֵ��0-1֮�䣩
bwImg=imbinarize(grayImg,level-0.1);%�˴�����levelǰ����мӼ��Դﵽ�������ͻ��߸�ʴ��Ч��
subplot(345);
imshow(bwImg);
title("Binarize with threshould "+num2str(level-0.1))

%�������㣬��Сճ���ͺڰ׵�
strEle=strel('disk',5);%����Բ��Ԫ�����ڽ��п�������
%bwImg = imopen(bwImg,strEle);
bwImg = imclose(bwImg,strEle);%������


%�����ֵͼ������ͨ�������
subplot(349)
compImg=imcomplement(bwImg);
[Label,num]=bwlabel(compImg,8);%�˴���Label�����Ǳ�ǩ���󣬵ڶ�������Ϊ4��8����ʾ�жϷ���Ϊ4��ͨ����8��ͨ����compImg�е�������ͨ����ֱ���1��2��3��4���α������num��ʾ�ܵ���ͨ�������,
num %�˴�Ϊ����������������ʾ����
imshow(compImg);
title(num2str(num)+" balls in total")

%�����ͨ�����Լ�������
subplot(3,4,[2 3 4 6 7 8 10 11 12])
status=regionprops(Label,'BoundingBox');%regionprops�д�ѧ�ʣ���������ĵ����˴�BoundingBox�ǻ���С��Ӿ��Σ�����ֵstatusΪ�ṹ������
centroid = regionprops(Label,'Centroid');%Centroid������
imshow(grayImg);hold on;
for i=1:num
    rectangle('position',status(i).BoundingBox,'edgecolor','r');
    text(centroid(i,1).Centroid(1,1)-10,centroid(i,1).Centroid(1,2)-10, num2str(i),'Color', 'r')
end
title("Mark all "+num2str(num)+" connected components")
