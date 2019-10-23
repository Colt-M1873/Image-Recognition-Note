%此段代码为从一张4096x4096的图像中截取出十张灰度化和二值化之后的小图像并将其两两对应拼接在一起，并且批量导出
clear
origImg=imread('C:\Users\lenovo\MVS\Data\新建文件夹 (2)\2.bmp');
%figure('Position',[200,40,900,500],'name','binarized');
%figure(1)
grayImg=rgb2gray(origImg);

%二值化处理
level=graythresh(grayImg)%利用最大类间方差法（Otsu）找到图片的一个合适阈值（0-1之间）
bwImg=imbinarize(grayImg,level-0.05);%此处可在level前后进行加减以达到类似膨胀或者腐蚀的效果
%imshow(bwImg);
figure(2)
cut2=imcrop(grayImg,[1700,1350,1200,800]);
cut3=imcrop(bwImg,[1700,1350,1200,800]);
imshow(cut3);
%%
figure(3)
for i=1:5
    cutgray=imcrop(cut2,[360,120*i,240,160]);
    cutbw=imcrop(cut3,[360,120*i,240,160]);
    cutbw=cutbw*255;%bw图像只有0和1，为了让其在拼接时与灰度图有同样的显示方式因此将其变为0和255，此处也可将灰度图归一化处理，效果是一样的
    fuse=[cutgray;cutbw];%拼接
    imshow(fuse);
    saveas(3,['D:\op\2\',num2str(i),'.jpg']);%导出
end
for i=1:5
    cutgray=imcrop(cut2,[360,120*i,240,160]);
    cutbw=imcrop(cut3,[360,120*i,240,160]);
    cutbw=cutbw*255;
    fuse=[cutgray;cutbw];
    imshow(fuse);
    saveas(3,['D:\op\2\',num2str(i+5),'.jpg']);
end

    
