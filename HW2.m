close all; clear, clc, format shortG

% AerE 421 HW2 Logan Wessel
% HW2

% Q1
% a
fprintf("Q1.a\n")

f_x = 0; % N
f_z = 12000; % N
f_y = 500; % N

M_x = f_z * 0.5; % Nm
M_y = -f_z * 5; % Nm
M_z = f_y * 5; % Nm

fprintf("M_x = %.6g Nm\n", M_x)
fprintf("M_y = %.6g Nm\n", M_y)
fprintf("M_z = %.6g Nm\n", M_z)

% b
fprintf("\nQ1.b\n")

A = [1 1 5 1 5 1] / 100^2; % m^2

y = [2.5 1.5 .5 0 .5 1.5]; % m
z = [0 -.0625 -0.125 0 .125 .0625]; % m

y_bar = sum(A.*y) / sum(A); % m
z_bar = 0; % m

fprintf("y_bar = %.6g m\n", y_bar)
fprintf("z_bar = %.6g m\n", z_bar)

%Part c
fprintf("\nQ1.c\n")

I_y = sum(A .* (z - z_bar).^2); % m^4
I_z = sum(A .* (y - y_bar).^2); % m^4
I_yz = sum(A .* (y - y_bar) .* (z - z_bar)); % m^4

fprintf("I_y = %.6g m^4\n", I_y)
fprintf("I_z = %.6g m^4\n", I_y)
fprintf("I_yz = %.6g m^4\n", I_y)

% d
fprintf("\nQ1.d\n")

sigma = (-((I_y * M_z + I_yz * M_y) / (I_y * I_z - I_yz^2)) * (y - y_bar)) + (((I_z * M_y + I_yz * M_z) / (I_y * I_z - I_yz^2)) * (z - z_bar)); % Pa

for i = 1:length(sigma)
    if sigma(i) > 0
        fprintf("sigma %d = %.6g Pa [T]\n", i, sigma(i))
    else
        fprintf("sigma %d = %.6g Pa [C]\n", i, sigma(i))
    end
end

%Q2
%a
fprintf("\nQ2.a\n")

S_z = 5000; % N at shear center

A = [.5 1 .5 .5 1] / 100^2; % m^2

y = [0 500 2500 2500 500] / 1000; % m
z = [0 -100 -25 25 100] / 1000; % m

y_bar = sum(A .* y) / sum(A); % m
z_bar = 0; % m

fprintf("y_bar = %.6g m\n", y_bar)
fprintf("z_bar = %.6g m\n", z_bar)

I_y = sum(A .* (z - z_bar).^2); % m^4
I_z = sum(A .* (y - y_bar).^2); % m^4
I_yz = sum(A .* (y - y_bar) .* (z - z_bar)); % m^4

fprintf("I_y = %.6g m^4\n", I_y)
fprintf("I_z = %.6g m^4\n", I_y)
fprintf("I_yz = %.6g m^4\n", I_y)

%Q3
%a
fprintf("\nQ3.a\n")

A = [1.5, 2, 1.5, 2] / 100^2; % m^2
t = 1 / 1000; % m
G = 27 * 10^9; % Pa

