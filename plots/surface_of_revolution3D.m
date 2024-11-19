% MATLAB Script to Plot a 3D Surface of Revolution
% Author: Jackson Saunders
% Date: 7/14/24

% Clear variables and close figures
clear all; close all; clc;

%% ================== Important Parameters (Edit these to define your surface) ==================

% Define the function to revolve (as an anonymous function)
% Example functions:
% f = @(x) sin(x);          % Sine function
% f = @(x) exp(-x);         % Exponential decay
% f = @(x) x.^2;            % Parabola
% f = @(x) sqrt(x);         % Square root function
f = @(x) x

% Define the range for x (domain of the function)
x_min = 0; x_max = 5;

% Define the range for theta (angle around the axis)
theta_min = 0; theta_max = 2*pi;

% Number of points in x and theta directions (controls the grid density)
num_x = 100;
num_theta = 100;

% Axis of revolution ('z', 'x', or 'y')
axis_of_revolution = 'z';   % Options: 'x', 'y', 'z'

%% =============================== Plotting the Surface of Revolution =========================================

% Create a grid of x and theta values
x = linspace(x_min, x_max, num_x);
theta = linspace(theta_min, theta_max, num_theta);
[X, Theta] = meshgrid(x, theta);

% Evaluate the function
Y = f(X);

% Calculate the coordinates for the surface of revolution
switch axis_of_revolution
    case 'z'
        % Revolving around the z-axis
        X_rot = Y .* cos(Theta);
        Y_rot = Y .* sin(Theta);
        Z_rot = X;
    case 'x'
        % Revolving around the x-axis
        Y_rot = Y .* cos(Theta);
        Z_rot = Y .* sin(Theta);
        X_rot = X;
    case 'y'
        % Revolving around the y-axis
        X_rot = Y .* cos(Theta);
        Z_rot = Y .* sin(Theta);
        Y_rot = X;
    otherwise
        error('Invalid axis of revolution selected.');
end

% Plotting the surface
surf(X_rot, Y_rot, Z_rot);

% ----- Enhance Plot Appearance -----
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
title('3D Surface of Revolution');
axis equal;
grid on;
shading interp;
colormap jet;
colorbar;

% ----- Adjust View -----
view(3);  % 3D view
