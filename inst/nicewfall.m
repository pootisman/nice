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
%% usage: fs = nicehist(nf, samps, times, Ns, Nt)
%%
%% Draw waterfall histogram of the time-series
%%
%% nf - root struct for Nice Figure to draw on 
%% samps - sample values
%% times - sample timestamps
%% Ns, Nt - Number of "bins" in sample and time domains
%%
%% output "fs" is a root struct for Nice Figure, should be passed
%% to other nice functions to draw modify content in figure
%%

function fig_struct = nicewfall(fig_struct, samps, times, Ns, Nt)
    if ~exist("fig_struct")
      warning("nicewfall expects nice figure struct, creating fig in-place...");
      fig_struct = nicefig();
    end
    
    figure(fig_struct.f);
    hold on;
    
    sampmin = min(samps);
    sampmax = max(samps);
    nss = floor(length(samps)/Nt);
    
    timemin = min(times);
    timemax = max(times);
    
    ss = linspace(sampmin, sampmax, Ns);
    ts = linspace(timemin, timemax, Nt);

    Zvals = [];
    
    for i = 1:length(ts)
      [hits, bins] = hist(samps((i-1)*nss+1:i*nss), ss);
      hitsn = hits/sum(hits)/(bins(2) - bins(1));
      Zvals = [Zvals; hitsn];
    end
    
    [S,T] = meshgrid(ss, ts);
    
    size(S);
    size(T);
    size(Zvals);
    
    surface(S, T, Zvals, "EdgeColor", "None");
    
    colormap(fig_struct.cmap);
    
    box on;
    grid on;

    xlim([sampmin, sampmax]);
    ylim([timemin, timemax]);

    shading(fig_struct.shade);
    lighting(fig_struct.lights);
end
