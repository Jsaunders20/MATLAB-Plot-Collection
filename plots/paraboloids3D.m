% MATLAB Script to Plot 3D Paraboloids
% Author: Jackson Saunders
% Date: 7/14/24

% Clear variables and close figures
clear all; close all; clc;

%% ================== Important Parameters (Edit these to define your paraboloid) ==================

% Method selection (Uncomment the method you want to use)
% method = 'elliptical';
method = 'hyperbolic';

% Parameters for Elliptical Paraboloid
a = 2;                       % Parameter 'a' in z = (x^2)/a^2 + (y^2)/b^2
b = 3;                       % Parameter 'b' in z = (x^2)/a^2 + (y^2)/b^2
z_min_e = 0; z_max_e = 20;   % Range for z-axis in elliptical paraboloid

% Parameters for Hyperbolic Paraboloid (Saddle)
a_h = 2;                     % Parameter 'a' in z = (x^2)/a^2 - (y^2)/b^2
b_h = 3;                     % Parameter 'b' in z = (x^2)/a^2 - (y^2)/b^2
x_min_h = -10; x_max_h = 10; % Range for x-axis in hyperbolic paraboloid
y_min_h = -10; y_max_h = 10; % Range for y-axis in hyperbolic paraboloid

% Grid size for plotting
gridSize = 100;              % Adjust the density of the grid

%% =============================== Plotting the Paraboloid =========================================

switch method
    case 'elliptical'
        % ----- Elliptical Paraboloid -----
        % Equation: z = (x^2)/a^2 + (y^2)/b^2
        % Define the range for x and y based on z_min and z_max
        % Solve for x and y: x^2 <= a^2*z and y^2 <= b^2*z
        z = linspace(z_min_e, z_max_e, gridSize);
        [Z, R] = meshgrid(z, linspace(0, sqrt(a^2*z_max_e), gridSize));
        Theta = linspace(0, 2*pi, gridSize);
        [Theta, Z] = meshgrid(Theta, z);
        
        % Calculate X and Y based on polar coordinates
        X = a * sqrt(Z) .* cos(Theta);
        Y = b * sqrt(Z) .* sin(Theta);
        
        % Calculate Z (redundant since Z is already defined)
        % Z = (X.^2)/a^2 + (Y.^2)/b^2; % This should equal to Z
        
        % Plotting
        surf(X, Y, Z, 'EdgeColor', 'none');
        title('Elliptical Paraboloid: z = \frac{x^2}{a^2} + \frac{y^2}{b^2}');
        
    case 'hyperbolic'
        % ----- Hyperbolic Paraboloid (Saddle) -----
        % Equation: z = (x^2)/a^2 - (y^2)/b^2
        % Define the range for x and y
        x = linspace(x_min_h, x_max_h, gridSize);
        y = linspace(y_min_h, y_max_h, gridSize);
        [X, Y] = meshgrid(x, y);
        
        % Calculate Z based on the hyperbolic paraboloid equation
        Z = (X.^2)/a_h^2 - (Y.^2)/b_h^2;
        
        % Plotting
        surf(X, Y, Z, 'EdgeColor', 'none');
        title('Hyperbolic Paraboloid (Saddle): z = \frac{x^2}{a^2} - \frac{y^2}{b^2}');
        
    otherwise
        error('Invalid method selected. Choose either ''elliptical'' or ''hyperbolic''.');
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

% ----- Add Lighting for Better Visualization -----
camlight left; lighting phong;
