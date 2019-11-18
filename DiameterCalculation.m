%�����M6�ô�����м����˿��������������㣬Ч����Ȼ�������⣬��������˴�����ͨ�������в�ͨ�ģ�������Ϊ���򣬵���Ҫ���������ȡ��������̬ѧ����
%Ȼ���󲹣�Ȼ����ֱ��Ϊ5��Բ����Ϊ�ں˶�ͼƬ�����˱����㣬��С�˺�ɫ���ֵ�ճ��
%�������õ�����ͨ���򷽷���ͨ����Ҫ��regionprops��������������ı궨�ͼ���
%��regionprop�е�Area�������������
%ʵ����Ostu�����ʺ���������������ʹ�ù̶��Ĺ�Դ��֤���������㶨���䣬�õ�ͼ��ı�����ɫӦ���Ǵ��¹̶��ģ����ֻ�谴�ձ�����ɫ������ֵ����
%ȷ������ɫ����ֱ��ͼ���б�����жϣ�����ɫһ�������������ɫ�������ֱ��ͼ����ߣ����ֻ����ֱ��ͼб�����Ĳ��ּ�����Ϊ��ֵ��

clear

origImg=imread('C:\Users\lenovo\MVS\Data\ɳ��ͼ��\С����\1.bmp');
%origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\501.BMP');
figure('Position',[200,40,900,500],'name','��ͨ���򷨼���');
subplot(341)
grayImg=rgb2gray(origImg);
imshow(grayImg);
[number,brightness]=imhist(grayImg);
kmax=0;
imax=0;
k=zeros(256,1);
for i=1:255
    k(i)=number(i+1)-number(i);
    if k(i)>12
        ithreshould=i;
        break;
    end
end
ithreshould
stem(brightness,k)
imshow(grayImg);
title("Gray Image");
%%
%��ֵ������
%level=graythresh(grayImg)%���������䷽���Otsu���ҵ�ͼƬ��һ��������ֵ��0-1֮�䣩
level=195/255%�˴���ֵ�ɲ��������䷽�������ֱ��ѡ��ֱ��ͼ���������б����󲿷ֵ����ȣ�б�����Ĳ��ֱ�ʾɳ���뱳���ķֽ�
bwImg=imbinarize(grayImg,level);%�˴�����levelǰ����мӼ��Դﵽ�������ͻ��߸�ʴ��Ч��
subplot(345);
imshow(bwImg);
title("Binarize with threshould "+num2str(level))
% 
%  %�������㣬��Сճ���ͺڰ׵�
% strEle=strel('disk',3);%����Բ��Ԫ�����ڽ��п�������
%  %bwImg = imopen(bwImg,strEle);
%  bwImg = imclose(bwImg,strEle);%������

%�����ֵͼ������ͨ�������
subplot(349)
compImg=imcomplement(bwImg);
[Label,num]=bwlabel(compImg,8);%�˴���Label�����Ǳ�ǩ���󣬵ڶ�������Ϊ4��8����ʾ�жϷ���Ϊ4��ͨ����8��ͨ����compImg�е�������ͨ����ֱ���1��2��3��4���α������num��ʾ�ܵ���ͨ�������,
num %�˴�Ϊ����������������ʾ����
imshow(compImg);
title(num2str(num)+" particles in total")

%�����ͨ���������
subplot(3,4,[2 3 4 6 7 8 10 11 12])
status=regionprops(Label,'BoundingBox');%regionprops�д�ѧ�ʣ���������ĵ����˴�BoundingBox�ǻ���С��Ӿ��Σ�����ֵstatusΪ�ṹ������
area=regionprops(Label,'Area');%����regionprops��Areaȡ��Label��Area���Է���ṹ������area
centroid = regionprops(Label,'Centroid');%Centroid������
imshow(grayImg);hold on;
for i=1:num
    rectangle('position',status(i).BoundingBox,'edgecolor','r');
    text(centroid(i,1).Centroid(1,1)-10,centroid(i,1).Centroid(1,2)-10, num2str(i),'Color', 'r')
    text(centroid(i,1).Centroid(1,1)-10,centroid(i,1).Centroid(1,2)+15, num2str(area(i).Area),'Color', 'bl')
end
title("Mark all "+num2str(num)+" connected components")

%%
figure(3)
for i=1:num-1
    for j=i+1:num
        if  area(i).Area> area(j).Area
            mediate=area(i).Area;
            area(i).Area=area(j).Area;
            area(j).Area=mediate;
        end
    end
end
D=zeros(num,1);
for q=1:num
    D(q)=sqrt(area(q).Area/3.1415926)*2;%��ֱ���ĵ�λΪ50um
end
%plot(D)
stem(D)
title("Diameter range")
xlabel("Particles")
ylabel("Diameter(*50um)")



% diameternumber=zeros(14,1);
% for diameter=1:14
%    for q=1:num
%         if D(q)>diameter*10&&D(q)<=(diameter+1)*10
%             diameternumber(diameter)=diameternumber(diameter)+1;
%         end
%    end
% end
diameternumber=zeros(35,1);
for diameter=1:35
   for q=1:num
        if D(q)>diameter&&D(q)<=(diameter+1)
            diameternumber(diameter)=diameternumber(diameter)+1;
        end
   end
end

%%
figure(4)
stem(diameternumber,'filled','LineWidth',3,'Marker','none','markerfacecolor','w')
%plot(diameternumber)
%hist(diameternumber)

title("Particle size distribution")
xlabel("Diameter(*50um)")
ylabel("Number")




