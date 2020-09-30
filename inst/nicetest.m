function nicetest()
  X = linspace(-pi, pi, 62);

  phases = linspace(eps, 2*pi, 62);

  disp("Testing 2D plot display...");
  nf = nicefig("fontname", "Latin Modern Roman", "fontsize", 14);

  for i = phases
    nf = niceplot(nf, X, sin(X + i));
  endfor

  xlabel("X values");
  ylabel("Y values");
  title("2D figure test");
  xlim([-pi,pi]);

  disp("Testing 3D waterfall display...");

  X = randn(1,1e5);

  X = X + sin(2*pi*[1:length(X)]./length(X));

  nf2 = nicefig("fontname", "Latin Modern Roman", "fontsize", 14, "cmap", viridis);

  nicewfall(X, 1:length(X), 50, 100, nf2);

  xlabel("X values");
  ylabel("Y values");
  zlabel("Hit probability");
  title("3D waterfall surface test [Gaussian histograms]");
  view(45,45);
  xlim([-6,6]);

  disp("Testing 2D plot colormap override, re-capture of old figure...");

  X = linspace(-pi, pi, 62);
  cm = copper(length(phases));

  for i = 1:length(phases)
    niceplot(nf, X, cos(X + phases(i)), 'Color', cm(ceil(i),:));
  endfor

  disp("Testing eye-diagram plotting on noisy sine/cosine wave...");

  nf3 = nicefig("fontname", "Latin Modern Roman", "fontsize", 14, "cmap", viridis);

  N = randn(1,5e4)/10;
  X = [1:length(N)]/100 * 2 * pi;

  niceeye(nf3, [5*sin(X(1:length(X)/2)),5*sin(X((length(X)/2+1):end)+pi)] + N, 100);
  xlabel("Normalized time");
  ylabel("Amplitude");
  title("Eye-diagram, Sine/Cosine");

endfunction