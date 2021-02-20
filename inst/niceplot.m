## Copyright (C) 2020-2021 Aleksei Ponomarenko-Timofeev
## 
## This file is part of Nice plotter package.
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## usage: fs = niceplot(nf, y, varargin)
##
## Plot data on instance of Nice Figure nf
##
## nf - root struct for Nice Figure to draw on 
## y - data to plot
## varargin may contain following parameters:
## "Color" - Triggers use of figure colormap, instead of default one
## Any other option that can be passed to plot
## If you want to pass x, pass it after y
##
## output "fs" is a root struct for Nice Figure, should be passed
## to other nice functions to draw modify content in figure
##

function nf = niceplot(nf, y, varargin)
  assert(isstruct(nf), "niceplot expects first argument to be a nicefig struct");
  
  figure(nf.f);
  axes(nf.cax);
  hold on;

  cm_override = 1;

  if any(strcmp(varargin, 'Color')) ~= 0
    cm_override = 0;
  endif
  
  if length(varargin) > 0
    Y = varargin{1};
    varargin = varargin(2:end);
    if cm_override == 0
      plot(y, Y, 'Color', nf.cmap(nf.cmid,:), varargin{:});
    else
      plot(y, Y, varargin{:});
    endif
  else
    plot(y, 'Color', nf.cmap(nf.cmid,:), varargin{:});
  endif
 
  if cm_override == 0
    nf.cmid=mod(nf.cmid+1, length(nf.cmap));
  endif

endfunction
