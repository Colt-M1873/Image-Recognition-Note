%�����M6�ô�����м����˿��������������㣬Ч����Ȼ�������⣬��������˴�����ͨ�������в�ͨ�ģ�������Ϊ���򣬵���Ҫ���������ȡ��������̬ѧ����
%Ȼ���󲹣�Ȼ����ֱ��Ϊ5��Բ����Ϊ�ں˶�ͼƬ�����˱����㣬��С�˺�ɫ���ֵ�ճ��
%�������õ�����ͨ���򷽷���ͨ����Ҫ��regionprops��������������ı궨�ͼ���
%��regionprop�е�Area�������������
%ʵ����Ostu�����ʺ���������������ʹ�ù̶��Ĺ�Դ��֤���������㶨���䣬�õ�ͼ��ı�����ɫӦ���Ǵ��¹̶��ģ����ֻ�谴�ձ�����ɫ������ֵ����
%ȷ������ɫ����ֱ��ͼ���б�����жϣ�����ɫһ�������������ɫ�������ֱ��ͼ����ߣ����ֻ����ֱ��ͼб�����Ĳ��ּ�����Ϊ��ֵ��

clear
origImg=imread('C:\Users\lenovo\MVS\Data\PRO2.bmp');
%origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\501.BMP');
figure('Position',[200,40,900,500],'name','��ͨ���򷨼���');
subplot(341)
grayImg=rgb2gray(origImg);
%grayImg=((255-grayImg)-32)*2;
%grayImg=255-grayImg;
imshow(grayImg);
[number,brightness]=imhist(grayImg);
kmax=0;
imax=0;
k=zeros(256,1)
for i=1:255
    k(i)=number(i+1)-number(i);
    if k(i)>12
        ithreshould=i;
        break;
    end
end
ithreshould
stem(brightness,k)
%figure(3)
% k2max=0
 % k2=zeros(256,1);
% for i=1:255
%     k2(i)=k(i+1)-k(i);
%     if k2(i) > k2max
%         k2max=k;
%         imax=i; 
%     end
% end
stem(brightness,number)
title("Gray Image");
%%
%��ֵ������
level=graythresh(grayImg)%���������䷽���Otsu���ҵ�ͼƬ��һ��������ֵ��0-1֮�䣩
%level=175/255%�˴���ֵ�ɲ��������䷽�������ֱ��ѡ��ֱ��ͼ���������б����󲿷ֵ����ȣ�б�����Ĳ��ֱ�ʾɳ���뱳���ķֽ�
bwImg=imbinarize(grayImg,level);%�˴�����levelǰ����мӼ��Դﵽ�������ͻ��߸�ʴ��Ч��
subplot(345);
imshow(bwImg);
title("Binarize with threshould "+num2str(level))

%�������㣬��Сճ���ͺڰ׵�
%strEle=strel('disk',5);%����Բ��Ԫ�����ڽ��п�������
%bwImg = imopen(bwImg,strEle);
%bwImg = imclose(bwImg,strEle);%������
%�����ֵͼ������ͨ�������
subplot(349)
compImg=imcomplement(bwImg);
[Label,num]=bwlabel(compImg,8);%�˴���Label�����Ǳ�ǩ���󣬵ڶ�������Ϊ4��8����ʾ�жϷ���Ϊ4��ͨ����8��ͨ����compImg�е�������ͨ����ֱ���1��2��3��4���α������num��ʾ�ܵ���ͨ�������,
num %�˴�Ϊ����������������ʾ����
imshow(compImg);
title(num2str(num)+" balls in total")

%�����ͨ���������
subplot(3,4,[2 3 4 6 7 8 10 11 12])
status=regionprops(Label,'BoundingBox');%regionprops�д�ѧ�ʣ���������ĵ����˴�BoundingBox�ǻ���С��Ӿ��Σ�����ֵstatusΪ�ṹ������
area=regionprops(Label,'Area');%����regionprops��Areaȡ��Label��Area���Է���ṹ������area
centroid = regionprops(Label,'Centroid');%Centroid������
imshow(grayImg);hold on;
for i=1:num
    rectangle('position',status(i).BoundingBox,'edgecolor','r');
    text(centroid(i,1).Centroid(1,1)-10,centroid(i,1).Centroid(1,2)-10, num2str(i),'Color', 'r')
    text(centroid(i,1).Centroid(1,1)-10,centroid(i,1).Centroid(1,2)+15, num2str(area(i).Area),'Color', 'w')
end
title("Mark all "+num2str(num)+" connected components")
