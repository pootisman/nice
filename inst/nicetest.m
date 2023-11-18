%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%%
%% usage: nicetest()
%%
%% Run all tests for the Nice package
%%

function nicetest()
  X = linspace(-pi, pi, 62);

  phases = linspace(eps, 2*pi, 62);

  disp("Testing 2D plot display...");
  nf = nicefig("fontname", "Latin Modern Roman", "fontsize", 14);

  for i = phases
    nf = niceplot(nf, X, sin(X + i));
  end

  xlabel("X values");
  ylabel("Y values");
  title("2D figure test");
  xlim([-pi,pi]);

  disp("Testing 3D waterfall display...");

  X = randn(1,1e5);

  X = X + sin(2*pi*[1:length(X)]./length(X));

  nf2 = nicefig("fontname", "Latin Modern Roman", "fontsize", 14, "cmap", jet);

  nicewfall(nf2, X, 1:length(X), 50, 100);

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
  end

  disp("Testing eye-diagram plotting on noisy sine/cosine wave...");

  nf3 = nicefig("fontname", "Latin Modern Roman", "fontsize", 14, "cmap", jet);

  N = randn(1,5e4)/10;
  X = [1:length(N)]/100 * 2 * pi;

  niceeye(nf3, [5*sin(X(1:length(X)/2)),5*sin(X((length(X)/2+1):end)+pi)] + N, 100);
  xlabel("Normalized time");
  ylabel("Amplitude");
  title("Eye-diagram, Sine/Cosine");
  
  niceleg(nf, "Eye diagram");

  
  disp("Testing sub-plotting...");

  nf4 = nicefig("fontname", "Latin Modern Roman", "fontsize", 14, "cmap", jet);
  
  nf4 = nicesubplot(nf4, 221);
  nf4 = niceeye(nf4, [5*sin(X(1:length(X)/2)),5*sin(X((length(X)/2+1):end)+pi)] + N, 100);
  xlabel("Normalized time");
  ylabel("Amplitude");
  title("Eye-diagram, Sine/Cosine");
  
  X = randn(1,1e5);

  X = X + sin(2*pi*[1:length(X)]./length(X));
  
  nf4 = nicesubplot(nf4, 222);

  nf4 = nicewfall(nf4, X, 1:length(X), 50, 100);

  xlabel("X values");
  ylabel("Y values");
  zlabel("Hit probability");
  title("3D waterfall surface test [Gaussian histograms]");
  view(45,45);
  xlim([-6,6]);
  
  nf4 = nicebar(nf4, "title", "Probability", "location", "SouthOutside");
  
  
  nf4 = nicesubplot(nf4, 223);

  X = [1:300];
  Y = sinc(deg2rad(X)) + randn(300)./(X/2);
  
  nf4 = stdmean(nf4, X, Y, 'r', 'Display', "Noisy sinc");

  nf4 = niceleg(nf4);
  
  xlabel("Degress");
  ylabel("Y values");
  title("2D stdmean plot test");

end
