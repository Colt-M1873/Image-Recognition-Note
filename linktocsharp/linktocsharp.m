function num=linktocsharp(path)
origImg=imread(path);
%origImg=imread('C:\Users\lenovo\MVS\Data\沙尘图像\小颗粒\1.bmp');
grayImg=rgb2gray(origImg);
%二值化处理
level=graythresh(grayImg)%利用最大类间方差法（Otsu）找到图片的一个合适阈值（0-1之间）
%level=195/255;%此处阈值可不用最大类间方差法，而是直接选择直方图中增长最快斜率最大部分的亮度，斜率最大的部分表示沙尘与背景的分界
bwImg=imbinarize(grayImg,level);%此处可在level前后进行加减以达到类似膨胀或者腐蚀的效果
%计算二值图像中连通区域个数
compImg=imcomplement(bwImg);
[Label,num]=bwlabel(compImg,8);%此处的Label矩阵是标签矩阵，第二个参数为4或8，表示判断方法为4连通还是8连通，将compImg中的所有连通区域分别以1，2，3，4依次标出来，num表示总的连通区域个数,
num %此处为方便在命令行中显示个数
%标出连通区域及其面积
% figure(1)
% subplot(3,4,[2 3 4 6 7 8 10 11 12])
% status=regionprops(Label,'BoundingBox');%regionprops有大学问，详见官网文档，此处BoundingBox是画最小外接矩形，返回值status为结构体数组
area=regionprops(Label,'Area');%调用regionprops中Area取得Label的Area属性放入结构体数组area
% centroid = regionprops(Label,'Centroid');%Centroid是形心
% imshow(grayImg);hold on;
% for i=1:num
%     rectangle('position',status(i).BoundingBox,'edgecolor','r');
%     text(centroid(i,1).Centroid(1,1)-10,centroid(i,1).Centroid(1,2)-10, num2str(i),'Color', 'r')
%     text(centroid(i,1).Centroid(1,1)-10,centroid(i,1).Centroid(1,2)+15, num2str(area(i).Area),'Color', 'bl')
% end
% title("Mark all "+num2str(num)+" connected components")
% figure(3)
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
    D(q)=sqrt(area(q).Area/3.1415926)*2;%该直径的单位为50um
end
% stem(D)
% title("Diameter range")
% xlabel("Particles")
% ylabel("Diameter(*50um)")
maxDiameter=ceil(D(num));
diameternumber=zeros(maxDiameter,1);
for diameter=1:maxDiameter
    for q=1:num
        if D(q)>diameter&&D(q)<=(diameter+1)
            diameternumber(diameter)=diameternumber(diameter)+1;
        end
    end
end
figure('Visible','off');%不显示图窗，直接保存
stem(diameternumber,'filled','LineWidth',3,'Marker','none','markerfacecolor','w')
title("Particle size distribution")
xlabel("Diameter(*50um)")
ylabel("Number")
f=getframe(gcf);
imwrite(f.cdata, 'D:\op\tempresult.png');
end

