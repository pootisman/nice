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
%% usage: fs = nicehist(nf, y, varargin)
%%
%% Draw histogram on instance of Nice Figure nf
%%
%% nf - root struct for Nice Figure to draw on 
%% x, y - bin centers and weights
%% varargin may contain following parameters:
%% "Color" - use built-in figure colormap
%%
%% output "fs" is a root struct for Nice Figure, should be passed
%% to other nice functions to draw modify content in figure
%%

function nf = nicehist(nf, x, y, varargin)
  assert(isstruct(nf), "niceplot expects first argument to be a nicefig struct");
  
  figure(nf.f);
  axes(nf.cax);
  hold on;
  
  if length(varargin) > 0
    Y = varargin{1};
    varargin = varargin(2:end);
    plot(y, Y, 'Color', nf.cmap(nf.cmid,:), varargin);
  else
    plot(y, 'Color', nf.cmap(nf.cmid,:), varargin);
  end
  
  nf.cmid=nf.cmid+1;
end
