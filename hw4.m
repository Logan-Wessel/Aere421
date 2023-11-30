clear, clc, close all

% Logan Wessel 11/29/2023

w = linspace(1, 20000, 500);

x = (.0226 ./ (1 - (w ./ 10990) .^2) + .00403 ./ (1 - (w ./ 17350) .^2));
t = (- .0266 ./ (1 - (w ./ 10990) .^2) + .00787 ./ (1 - (w ./ 17350) .^2));

figure(1)
plot(w, x, w, t);
legend("x", "theta")
legend("Location", "northwest")
xlabel("omega (rad/s)");
ylabel("displacement (m)");
title("displacement vs frequency plot");

