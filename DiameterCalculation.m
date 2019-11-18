%相较于M6该代码段中加入了开闭运算和面积计算，效果依然不尽人意，大概宣告了纯靠连通区域法是行不通的，可以作为方向，但还要配合轮廓提取和其他形态学方法
%然后求补，然后用直径为5的圆盘作为内核对图片进行了闭运算，减小了黑色部分的粘连
%计数运用的是连通区域方法，通过重要的regionprops函数来进行区域的标定和计数
%用regionprop中的Area方法来计算面积
%实际上Ostu并不适合这种情况，如果能使用固定的光源保证光照条件恒定不变，得到图像的背景颜色应该是大致固定的，因此只需按照背景颜色当作阈值即可
%确定背景色可用直方图结合斜率来判断，背景色一般是面积最大的颜色，因此在直方图中最高，因此只需找直方图斜率最大的部分即可作为阈值。

clear

origImg=imread('C:\Users\lenovo\MVS\Data\沙尘图像\小颗粒\1.bmp');
%origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\501.BMP');
figure('Position',[200,40,900,500],'name','连通区域法计数');
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
%二值化处理
%level=graythresh(grayImg)%利用最大类间方差法（Otsu）找到图片的一个合适阈值（0-1之间）
level=195/255%此处阈值可不用最大类间方差法，而是直接选择直方图中增长最快斜率最大部分的亮度，斜率最大的部分表示沙尘与背景的分界
bwImg=imbinarize(grayImg,level);%此处可在level前后进行加减以达到类似膨胀或者腐蚀的效果
subplot(345);
imshow(bwImg);
title("Binarize with threshould "+num2str(level))
% 
%  %开闭运算，减小粘连和黑白点
% strEle=strel('disk',3);%构建圆形元素用于进行开闭运算
%  %bwImg = imopen(bwImg,strEle);
%  bwImg = imclose(bwImg,strEle);%闭运算

%计算二值图像中连通区域个数
subplot(349)
compImg=imcomplement(bwImg);
[Label,num]=bwlabel(compImg,8);%此处的Label矩阵是标签矩阵，第二个参数为4或8，表示判断方法为4连通还是8连通，将compImg中的所有连通区域分别以1，2，3，4依次标出来，num表示总的连通区域个数,
num %此处为方便在命令行中显示个数
imshow(compImg);
title(num2str(num)+" particles in total")

%标出连通区域及其面积
subplot(3,4,[2 3 4 6 7 8 10 11 12])
status=regionprops(Label,'BoundingBox');%regionprops有大学问，详见官网文档，此处BoundingBox是画最小外接矩形，返回值status为结构体数组
area=regionprops(Label,'Area');%调用regionprops中Area取得Label的Area属性放入结构体数组area
centroid = regionprops(Label,'Centroid');%Centroid是形心
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
    D(q)=sqrt(area(q).Area/3.1415926)*2;%该直径的单位为50um
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




