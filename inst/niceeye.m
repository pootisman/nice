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

## usage: fs = niceeye(nf, sig, sps, varargin)
##
## Draw eye-diagram on instance of Nice Figure nf
##
## nf - root struct for Nice Figure to draw on
## sig - Overall signal to plot
## sps - Samples per symbol
## varargin may contain following parameters:
## "Color" - use builtin figure colormap
##
## output "fs" is a root struct for Nice Figure, should be passed
## to other nice functions to draw modify content in figure
##

function nf = niceeye(nf, sig, sps, varargin)
  assert(isstruct(nf), "niceplot expects first argument to be a nicefig struct");
  
  figure(nf.f);
  hold on;
  
  nsymbs = floor(length(sig)/sps);
  
  cm_override = 0;
  if any(strcmp(varargin, 'Color')) ~= 0
    cm_override = 1;
  endif
  
  for i = [1:nsymbs]
    plot([1:sps], sig([(i-1)*sps+1:i*sps]), 'Color', nf.cmap(nf.cmid,:), varargin{:});
  endfor
  
  if cm_override == 0
    nf.cmid=mod(nf.cmid+1, length(nf.cmap));
  endif
endfunction
