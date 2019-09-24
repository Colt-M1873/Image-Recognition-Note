%相较于M6该代码段中加入了开闭运算，效果依然不尽人意，大概宣告了纯靠连通区域法是行不通的，可以作为方向，但还要配合轮廓提取和其他形态学方法
%图像先用Ostu阈值处理，因默认阈值不合适故将其减小了0.1（在实验中这将是很棘手的问题，目前不知如何确定合适的阈值，也无法权衡阈值和接下来开闭运算内核大小之间的关系，因此还需进一步实验）
%然后求补，然后用直径为5的圆盘作为内核对图片进行了闭运算，减小了黑色部分的粘连
%计数运用的是连通区域方法，通过重要的regionprops函数来进行区域的标定和计数

%另注：regionprop中的area方法能用来计算面积

clear

origImg=imread('C:\Users\lenovo\Documents\MATLAB\imageProcessing\501.BMP');

figure('Position',[200,40,900,500],'name','连通区域法计数');
subplot(341)
grayImg=rgb2gray(origImg);
imshow(grayImg);
title("Gray Image");

%二值化处理
level=graythresh(grayImg)%利用最大类间方差法（Otsu）找到图片的一个合适阈值（0-1之间）
bwImg=imbinarize(grayImg,level-0.1);%此处可在level前后进行加减以达到类似膨胀或者腐蚀的效果
subplot(345);
imshow(bwImg);
title("Binarize with threshould "+num2str(level-0.1))

%开闭运算，减小粘连和黑白点
strEle=strel('disk',5);%构建圆形元素用于进行开闭运算
%bwImg = imopen(bwImg,strEle);
bwImg = imclose(bwImg,strEle);%闭运算


%计算二值图像中连通区域个数
subplot(349)
compImg=imcomplement(bwImg);
[Label,num]=bwlabel(compImg,8);%此处的Label矩阵是标签矩阵，第二个参数为4或8，表示判断方法为4连通还是8连通，将compImg中的所有连通区域分别以1，2，3，4依次标出来，num表示总的连通区域个数,
num %此处为方便在命令行中显示个数
imshow(compImg);
title(num2str(num)+" balls in total")

%标出连通区域以及其形心
subplot(3,4,[2 3 4 6 7 8 10 11 12])
status=regionprops(Label,'BoundingBox');%regionprops有大学问，详见官网文档，此处BoundingBox是画最小外接矩形，返回值status为结构体数组
centroid = regionprops(Label,'Centroid');%Centroid是形心
imshow(grayImg);hold on;
for i=1:num
    rectangle('position',status(i).BoundingBox,'edgecolor','r');
    text(centroid(i,1).Centroid(1,1)-10,centroid(i,1).Centroid(1,2)-10, num2str(i),'Color', 'r')
end
title("Mark all "+num2str(num)+" connected components")
