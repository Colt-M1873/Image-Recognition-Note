function [D,num]=linktocsharpV3(path)
origImg=imread(path);
%origImg=imread('D:\MVS_Data(��Ƭ)\ɳ��ͼ��\С����\1.bmp');
grayImg=rgb2gray(origImg);
%��ֵ������
level=graythresh(grayImg)%���������䷽���Otsu���ҵ�ͼƬ��һ��������ֵ��0-1֮�䣩
%level=195/255;%�˴���ֵ�ɲ��������䷽�������ֱ��ѡ��ֱ��ͼ���������б����󲿷ֵ����ȣ�б�����Ĳ��ֱ�ʾɳ���뱳���ķֽ�
bwImg=imbinarize(grayImg,level);%�˴�����levelǰ����мӼ��Դﵽ�������ͻ��߸�ʴ��Ч��
%�����ֵͼ������ͨ�������
compImg=imcomplement(bwImg);
[Label,num]=bwlabel(compImg,8);%�˴���Label�����Ǳ�ǩ���󣬵ڶ�������Ϊ4��8����ʾ�жϷ���Ϊ4��ͨ����8��ͨ����compImg�е�������ͨ����ֱ���1��2��3��4���α������num��ʾ�ܵ���ͨ�������,
area=regionprops(Label,'Area');%����regionprops��Areaȡ��Label��Area���Է���ṹ������area
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
maxDiameter=ceil(D(num));
diameternumber=zeros(maxDiameter,1);
for diameter=1:maxDiameter
    for q=1:num
        if D(q)>diameter&&D(q)<=(diameter+1)
            diameternumber(diameter)=diameternumber(diameter)+1;
        end
    end
end
% figure('Visible','off');%����ʾͼ����ֱ�ӱ���
% stem(diameternumber,'filled','LineWidth',3,'Marker','none','markerfacecolor','w')
% title("Particle size distribution")
% xlabel("Diameter(*50um)")
% ylabel("Number")
% f=getframe(gcf);
% imwrite(f.cdata, 'D:\op\tempresult.png');
end

