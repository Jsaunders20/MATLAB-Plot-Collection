% MATLAB Script to Plot a 3D Cylinder Using Various Definitions
% Author: Jackson Saunders
% Date: 7/13/24

% Clear variables and close figures
clear all; close all; clc;

%% ================== Important Parameters (Edit these to define your cylinder) ==================

% Method selection (Uncomment the method you want to use)
% method = 'circular';
% method = 'elliptical';
method = 'parabolic';

% Parameters for Circular Cylinder
r = 5;                      % Radius of the circular cylinder
z_min = -10; z_max = 10;    % Range for z-axis

% Parameters for Elliptical Cylinder
a = 5;                      % Semi-major axis length
b = 3;                      % Semi-minor axis length
z_min = -10; z_max = 10;    % Range for z-axis

% Parameters for Parabolic Cylinder
x_min = -5; x_max = 5;      % Range for x-axis
y_min = -5; y_max = 5;      % Range for y-axis

% Grid size for plotting
gridSize = 50;              % Adjust the density of the grid

%% =============================== Plotting the Cylinder =========================================

switch method
    case 'circular'
        % ----- Circular Cylinder -----
        % Equation: x^2 + y^2 = r^2
        % Create a grid of theta and z
        theta = linspace(0, 2*pi, gridSize);
        z = linspace(z_min, z_max, gridSize);
        [Theta, Z] = meshgrid(theta, z);
        % Calculate X, Y
        X = r * cos(Theta);
        Y = r * sin(Theta);

        % Plotting
        surf(X, Y, Z);
        title('Circular Cylinder: x^2 + y^2 = r^2');

    case 'elliptical'
        % ----- Elliptical Cylinder -----
        % Equation: x^2/a^2 + y^2/b^2 = 1
        % Create a grid of theta and z
        theta = linspace(0, 2*pi, gridSize);
        z = linspace(z_min, z_max, gridSize);
        [Theta, Z] = meshgrid(theta, z);
        % Calculate X, Y
        X = a * cos(Theta);
        Y = b * sin(Theta);

        % Plotting
        surf(X, Y, Z);
        title('Elliptical Cylinder: x^2/a^2 + y^2/b^2 = 1');

    case 'parabolic'
        % ----- Parabolic Cylinder -----
        % Equation: z = x^2
        % Create a grid of x and y
        x = linspace(x_min, x_max, gridSize);
        y = linspace(y_min, y_max, gridSize);
        [X, Y] = meshgrid(x, y);
        % Calculate Z
        Z = X.^2;

        % Plotting
        surf(X, Y, Z);
        title('Parabolic Cylinder: z = x^2');

    otherwise
        error('Invalid method selected.');
end

% ----- Enhance Plot Appearance -----
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
axis equal;
grid on;
shading interp;
colormap jet;
colorbar;

% ----- Adjust View -----
view(3);  % 3D view
