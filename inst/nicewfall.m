%% Copyright (C) 2020-2021 Aleksei Ponomarenko-Timofeev
%%
%% This file is part of Nice plotter package.
%%
%% This program is free software: you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
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

function fig_struct = nicewfall(fig_struct, samps, times, Ns, Nt, varargin)
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

    for i = 1:length(varargin)
      if strcmp(varargin{i}, "binlims")
        sampmin = varargin{i+1}(1);
        sampmax = varargin{i+1}(2);
        i=i+1;
      end
    end

    binsize = (sampmax - sampmin) / Ns;
    bincenters = sampmin+(binsize/2):binsize:sampmax-(binsize/2);

    ts = linspace(timemin, timemax, Nt);

    Zvals = [];

    for i = 1:length(ts)
      [hits, bins] = hist(samps((i-1)*nss+1:i*nss), bincenters);
      hitsn = hits/sum(hits)/(bins(2) - bins(1));
      Zvals = [Zvals; hitsn];
    end

    [S,T] = meshgrid(bincenters, ts);

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
