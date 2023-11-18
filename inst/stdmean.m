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
%% usage: fs = stdmean(nf, x, y, varargin)
%%
%% Plot mean and STD on instance of Nice Figure nf
%%
%% nf - root struct for Nice Figure to draw on 
%% x - X values for specific columns of the y [1, Times]
%% y - data matrix to plot [Nsamps, Times]
%% varargin may contain following parameters:
%% "Color" - Triggers use of figure colormap, instead of default one
%% Any other option that can be passed to plot
%% If you want to pass x, pass it after y
%%
%% output "fs" is a root struct for Nice Figure, should be passed
%% to other nice functions to draw modify content in figure
%%

function nf = stdmean(nf, x, y, varargin)
  assert(isstruct(nf), "stdmean expects first argument to be a nicefig struct");
  assert(size(x,2) == size(y,2), "Error: Expected size of X = [1, TIMES], Y = [NSAMPS, TIMES]");
  
  figure(nf.f);
  axes(nf.cax);
  hold on;
  
  argv = {};
  argc = 1;
  varargc = 0;
  
  while length(varargin) > varargc
    switch varargin{argc}
      case {"Display"}
        dname = varargin{argc + 1};
        argc = argc + 2
        varargc = varargc + 2;
      otherwise  
        argv{argc} = varargin{argc};
        argc = argc + 1;
        varargc = varargc + 1;
      end
      
  end
  
  offset = std(y,0,1);
  
  areax = [x, fliplr(x)];
  
  areay = [mean(y,1) - offset, fliplr(mean(y,1) + offset)];
  
  if length(argv) ~= 0
    fh = fill(areax, areay, argv{:});
    pl = plot(x, mean(y,1), argv{:});
  else
    fh = fill(areax, areay, 'm');
    pl = plot(x, mean(y,1), 'm');
  end
  
  if ~exist("dname", "var")
    dname = get(fh, "displayname");
  end
  
  set(fh, "displayname", strcat(dname, " STD"));
  
  if ~exist("dname", "var")
    dname = get(pl, "displayname");
  end
  
  set(pl, "displayname", strcat(dname, " mean"));
  
  nf.polys{length(nf.polys) + 1} = fh;
  
  set(fh, 'facealpha', 0.2);
  
  grid on;
  box on;
end

