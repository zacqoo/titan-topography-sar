% This script is to calculate Titan's geoid defined in Iess et al. (2010)
% Iess et al. (2010) showed that Titan's gravity field is consistent with a
% hydrostatically relaxed body shaped by tidal and rotational effects, 
% making it slightly oblate.
% Reference: Iess, L., Rappaport, N. J., Jacobson, R. A., Racioppa, P.,
% Stevenson, D. J., Tortora, P., ... and Asmar, S. W. (2010). 
% Gravity field, shape, and moment of inertia of Titan. Science, 
% 327(5971), 1367-1369.
% This script was created by Zac Yung-Chun Liu; zacycliu@asu.edu
% Last modified 02/26/2016
clc
clear all
close all

% Set up parameters a, b, c
% SOL1
a = 2575.239;
b = 2574.932;
c = 2574.829;

% SOL2
% a = 2574.969;
% b = 2574.662;
% c = 2574.559;

% Calculate geoid
for i = 1:180
    for j = 1:360
        lon = j-180;
        lat = i-90;
        r_geoid(i,j) = (a*b*c)/(((b*c*cosd(lat)*cosd(lon))^2+ ...
            (c*a*cosd(lat)*sind(lon))^2+(a*b*sind(lat))^2)^0.5);
        r_geoid(i,j) = (r_geoid(i,j)-2575)*1000;
    end
end

% Figure
% Note: Longitude W to E: -180~0~180 degrees
%       Latitude N to S: 90~0~-90 degrees 
imagesc(r_geoid);
colorbar;