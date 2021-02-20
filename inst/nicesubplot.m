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

## usage: fs = nicesubplot(nf, idx)
##
## Spawn an instance Nice Figure. Box and grid modifiers
## are automatically enabled, as well as holding the plots
## 
## varargin may contain following parameters:
## "fontname" - Which font to use on figure (Default: Latin Modern Roman)
## "fontsize" - What size of the font to use (Default: 14)
## "position" - Where the figure shall appear on display (Default: [300 200])
## "size" - Which size should be used for the figure (Default: [560 420])
## "cmap" - Default colormap for the figure (Default: viridis(64))
##
## output "fs" is a root struct for Nice Figure, should be passed
## to other nice functions to draw modify content in figure
##

function nf = nicesubplot(nf, idx, varargin)
  assert(isstruct(nf), "niceplot expects first argument to be a nicefig struct");
  
  figure(nf.f);
  
  fontname = nf.fontname;
  fontsize = nf.fontsize;

  cmap = viridis(64);
  
  if length(varargin) > 0
    hax = subplot(idx, varargin);
  else
    hax = subplot(idx);
  end
  
  set(hax, 'fontname', fontname);
  set(hax, 'fontsize', fontsize);
  
  nf.cax = hax;
endfunction