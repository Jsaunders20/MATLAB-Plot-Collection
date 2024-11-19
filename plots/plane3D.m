% MATLAB Script to Plot a 3D Plane Using Various Definitions
% Author: Jackson Saunders
% Date: 7/13/24

% Clear variables and close figures
clear all; close all; clc;

%% ================== Important Parameters (Edit these to define your plane) ==================

% Method selection (Uncomment the method you want to use)
% method = 'point-normal';
% method = 'general';
% method = 'parametric';
method = 'three-points';

% Parameters for Point-Normal Form
P0 = [1, 2, 3];     % Point on the plane (x0, y0, z0)
n = [2, -3, 1];     % Normal vector (a, b, c)

% Parameters for General Form
coeffs = [2, -3, 1, -6];   % Coefficients [a, b, c, d] in ax + by + cz + d = 0

% Parameters for Parametric Form
P_param = [1, 2, 3];       % Point on the plane (x0, y0, z0)
v1 = [1, 0, -1];           % Direction vector 1
v2 = [0, 1, 2];            % Direction vector 2

% Parameters for Three Points
P1 = [1, 4, 4];            % First point
P2 = [4, 5, 6];            % Second point
P3 = [7, 8, 9];            % Third point

% Grid size for plotting
[xmin, xmax] = deal(-10, 10);
[ymin, ymax] = deal(-10, 10);
gridSize = 10;             % Adjust the density of the grid

%% =============================== Plotting the Plane =========================================

% Create a grid of points
[X, Y] = meshgrid(linspace(xmin, xmax, gridSize), linspace(ymin, ymax, gridSize));

switch method
    case 'point-normal'
        % ----- Point-Normal Form -----
        % Equation: n • (r - r0) = 0 => a(x - x0) + b(y - y0) + c(z - z0) = 0
        % Solve for Z: z = ( -a(x - x0) - b(y - y0) ) / c + z0

        a = n(1); b = n(2); c = n(3);
        if c == 0
            error('Normal vector cannot have c = 0 for this plotting method.');
        end
        Z = (-a*(X - P0(1)) - b*(Y - P0(2)))/c + P0(3);

        % Plotting
        surf(X, Y, Z);
        title('Plane Defined by Point-Normal Form');
        
    case 'general'
        % ----- General Form -----
        % General form: aX + bY + cZ + d = 0
        a = coeffs(1); b = coeffs(2); c = coeffs(3); d = coeffs(4);
        if c == 0
            error('Coefficient c cannot be zero for this plotting method.');
        end
        Z = (-a*X - b*Y - d)/c;

        % Plotting
        surf(X, Y, Z);
        title('Plane Defined by General Form');
        
    case 'parametric'
        % ----- Parametric Form -----
        % Parametric form: r(u,v) = P0 + u*v1 + v*v2
        % Create a grid of parameters u and v
        [U, V] = meshgrid(linspace(-5, 5, gridSize), linspace(-5, 5, gridSize));
        % Calculate X, Y, Z
        X = P_param(1) + U*v1(1) + V*v2(1);
        Y = P_param(2) + U*v1(2) + V*v2(2);
        Z = P_param(3) + U*v1(3) + V*v2(3);

        % Plotting
        surf(X, Y, Z);
        title('Plane Defined by Parametric Form');
        
    case 'three-points'
        % ----- Plane Defined by Three Points -----
        % Calculate two vectors in the plane
        v1 = P2 - P1;
        v2 = P3 - P1;
        % Create a grid of parameters u and v
        [U, V] = meshgrid(linspace(0, 1, gridSize), linspace(0, 1, gridSize));
        % Calculate X, Y, Z
        X = P1(1) + U*v1(1) + V*v2(1);
        Y = P1(2) + U*v1(2) + V*v2(2);
        Z = P1(3) + U*v1(3) + V*v2(3);

        % Plotting
        surf(X, Y, Z);
        title('Plane Defined by Three Points');
        
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

% ----- Plot the Points Used in Defining the Plane -----
hold on;
if strcmp(method, 'point-normal')
    plot3(P0(1), P0(2), P0(3), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
elseif strcmp(method, 'parametric')
    plot3(P_param(1), P_param(2), P_param(3), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
elseif strcmp(method, 'three-points')
    plot3([P1(1), P2(1), P3(1)], [P1(2), P2(2), P3(2)], [P1(3), P2(3), P3(3)], 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
end
hold off;
