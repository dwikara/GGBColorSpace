clear all;
close all;
clc;

%% Import an Image
rgbImage = double(imread('Lymphocyte.jpg'));

%% Extract color channels.
redChannel      = rgbImage(:,:,1); % Red channel
greenChannel    = rgbImage(:,:,2); % Green channel
blueChannel     = rgbImage(:,:,3); % Blue channel

%% Convert to GGB
[m,n] = size(redChannel);
mean_green  = mean2(greenChannel);
mean_blue   = mean2(blueChannel);

green_new   = greenChannel./(mean_green);
blue_new    = blueChannel./(mean_blue);

green_adjust   = imadjust(green_new);

ggbImage = cat(3, green_adjust, green_adjust, blue_new);

%% Figure
figure
subplot(1,2,1);
imshow(uint8(rgbImage));
title('RGB','FontSize',15);
subplot(1,2,2);
imshow(ggbImage);
title('GGB','FontSize',15);
