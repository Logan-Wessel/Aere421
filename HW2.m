close all; clear, clc, format shortG

% AerE 421 HW2 Logan Wessel
% HW2

%% Q1
fprintf("Q1\n")

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

% c
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

%% Q2
fprintf("\nQ2\n")

% a

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

fprintf("\nQ2.a\n")

q45 = + (S_z / I_y) * A(4) * (z(4) - z_bar); % N/m
q51 = q45 + (S_z / I_y) * A(5) * (z(5) - z_bar); % N/m
q12 = q51 + (S_z / I_y) * A(1) * (z(1) - z_bar); % N/m
q23 = q12 + (S_z / I_y) * A(2) * (z(2) - z_bar); % N/m
q34 = q23 + (S_z / I_y) * A(3) * (z(3) - z_bar); % N/m

fprintf("q45 = %.6g N/m\n", q45)
fprintf("q51 = %.6g N/m\n", q51)
fprintf("q12 = %.6g N/m\n", q12)
fprintf("q23 = %.6g N/m\n", q23)
fprintf("q34 = %.6g N/m\n", q34)

%b
fprintf("\nQ2.b\n")

zeta = (-(2 * (.5 * .5 * .2) * q12) + (2 * (.5 * 2 * 200) * q23)) / S_z; % mm
fprintf("zeta = %.6g mm\n", zeta)

%% Q3
fprintf("\nQ3\n")

% a
fprintf("\nQ3.a\n")

A = [1.5, 2, 1.5, 2] / 100^2; % m^2
t = 1 / 1000; % m
G = 27 * 10^9; % Pa

V_z = 2000; % N

% (2000 / G) * (2 / 100^2) * (40 / 1000) = 5.9259e-13
% q41 = q34 - (2000 / G) * (A(4)) * (40 / 1000) = q34 - 5.9259e-13 V_z N/m
% q12 = q34 - (5.9259e-13 * V_z) - (2000 / G) * (A(1)) * (0 / 1000) = q34 - 5.9259e-13 N/m
% (2000 / G) * (A(2)) * (-40 / 1000) = -5.9259e-13 V_z
% q23 = q34 - (5.9259e-13 * v_z) - (2000 / G) * (A(2)) * (-40 / 1000) = q34 - 5.9259e-13 + 5.9259e-13 = q34 N/m
% q34 = q34 - (2000 / G) (A(3)) * (0 / 1000) = q34 N/m

M_1 = 2000 * (40 / 1000); % Nm
% 2000 * (40 / 1000) = 80
% M_1 = (2 * Q12 * (.25 * (pi * .04^2))) + (2 * q23 * (.5 * .04 * .34)) + (2 * q34 * (.5 * .04 * .34))
% M_1 = (2 * (q34 - 5.9259e-13) * (.25 * (pi * .04^2))) + (2 * (q34) * (.5 * .04 * .34)) + (2 * q34 * (.5 * .04 * .34))
% 80 = (2 * (q34 - 5.9259e-13) * (.25 * (pi * .04^2))) + (2 * (q34) * (.5 * .04 * .34)) + (2 * q34 * (.5 * .04 * .34))
q34 = 40 / ((1 - (2000 / G) * (A(4)) * (40 / 1000)) * (.25 * (pi * .04^2)) + (.5 * .04 * .34) + (.5 * .04 * .34)); % N/m
q41 = q34 - (2000 / G) * (A(4)) * (40 / 1000);
q12 = q34 - (5.9259e-13 * V_z) - (2000 / G) * (A(1)) * (0 / 1000);
q23 = q34 - (5.9259e-13 * V_z) - (2000 / G) * (A(2)) * (-40 / 1000);
fprintf("q34 = %.6g N/m\n", q34)
fprintf("q41 = %.6g N/m\n", q41)
fprintf("q12 = %.6g N/m\n", q12)
fprintf("q23 = %.6g N/m\n", q23)

