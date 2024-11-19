% Parameters for the Möbius strip
clear;
u = linspace(0, 2*pi, 100); 
v = linspace(-0.5, 0.5, 50); 

%test
a= 2;

[U, V] = meshgrid(u, v); 

% Mobius strip parameterization
x = (1 + V.*cos(U/a)).*cos(U);
y = (1 + V.*cos(U/a)).*sin(U);
z = V.*sin(U/a);

% Plot the Mobius strip
surf(x, y, z);
colormap('jet'); 
shading interp; 
axis equal; 
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Möbius Strip');
