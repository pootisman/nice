close all;
clear all;

X = linspace(-pi, pi, 62);

phases = linspace(0, 2*pi, 62);

disp("Testing 2D plot display");
nf = nicefig("fontname", "Latin Modern Roman", "fontsize", 14);

for i = phases
  nf = niceplot(nf, X, sin(X + i));
endfor

xlabel("X values");
ylabel("Y values");
title("2D figure test");
xlim([-pi,pi]);

%niceprint(nf, "sin.png");

disp("Testing 3D waterfall display");

X = randn(1,1e7);

X = X + sin(2*pi*[1:length(X)]./length(X));

nf2 = nicefig("fontname", "Latin Modern Roman", "fontsize", 14, "cmap", viridis);

nicewfall(X, 1:length(X), 50, 100, nf2);

xlabel("X values");
ylabel("Y values");
zlabel("Hit probability");
title("3D waterfall surface test [Gaussian histograms]");
view(45,45);
xlim([-6,6]);
%niceprint(nf2, "wfall.png");

disp("Testing 2D plot colormap override");

X = linspace(-pi, pi, 62);


for i = phases
  nf = niceplot(nf, X, sin(X + i), 'Color', copper(ceil(pi/i)));
endfor

%niceprint(nf, "sin.png");