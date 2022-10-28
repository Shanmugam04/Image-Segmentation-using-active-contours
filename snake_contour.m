close all; clear all; clc;

% READ IMAGE
I=im2double(imread('LetterA.tif'));
[M,N] = size(I);

% GVF - OUTER BOUNDARY
% MANUALLY SELECT INITIAL CONTOUR
[x0, y0] = snake_manual_input(I, 100,'go--');

% USE PREDEFINED CIRCLE AS INITIAL CONTOUR
% t = 0:0.1:2*pi;
% ax = floor(M/2); bx = floor(M/2);
% ay = floor(N/2); by = floor(N/2);
% x0 = ax + bx*cos(t)';
% y0 = ay + by*sin(t)';
% x0(end + 1) = x0(1);
% y0(end + 1) = y0(1);

P=[x0(:) y0(:)]; % array of initial contour coordinates

% Start Snake Process
Options=struct;
Options.Verbose=true;
Options.Iterations=200;
Options.Wedge=2;
Options.Wline=0;
Options.Wterm=0;
Options.Kappa=4;
Options.Sigma1=8;
Options.Sigma2=8;
Options.Alpha=0.1;
Options.Beta=0.1;
Options.Gamma=0.1;
Options.Mu=0.2;
Options.Delta=-0.1;
[O1,J1]=Snake2D(I,P,Options);

% BALOON - INNER BOUNDARY
[x0, y0] = snake_manual_input(I, 100,'go--');

P=[x0(:) y0(:)]; % array of initial contour coordinates

% Start Snake Process
Options=struct;
Options.Verbose=true;
Options.Iterations=150;
[O2,J2]=Snake2D(I,P,Options);
J2 = imcomplement(J2); % complement for superimposition 

% PLOT OUTPUTS

figure; imshow(J1, []);
figure; imshow(J2, []);
figure; imshow(J1+J2, []);