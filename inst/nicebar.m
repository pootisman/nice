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

## usage: fs = nicebar(nf, y, varargin)
##
## Draw colorbar on instance of Nice Figure nf
##
## nf - root struct for Nice Figure to draw on 
## varargin may contain following parameters:
## "fontname" - Which font to use for the colorbar
## "fontsize" - Size of the font to use
##
## output "fs" is a root struct for Nice Figure, should be passed
## to other nice functions to draw modify content in figure
##

function nf = nicebar(nf, varargin)
  assert(isstruct(nf), "nicebar expects first argument to be a nicefig struct");

  figure(nf.f);

  fontname = nf.fontname;
  fontsize = nf.fontsize;

  reduce_vararg_len = 1;

  for i = 1:length(varargin)
    if strcmp(varargin{i}, "fontname")
      fontname = varargin{i+1};
      i=i+1;
      reduce_vararg_len = reduce_vararg_len + 2;
    elseif strcmp(varargin{i}, "fontsize")
      fontsize = varargin{i+1};
      i=i+1;
      reduce_vararg_len = reduce_vararg_len + 2;
    end
  end

  varargin = varargin(reduce_vararg_len:end);

  cb = colorbar(varargin{:});

  set(cb, 'fontname', fontname);
  set(cb, 'fontsize', fontsize);
  
  
  nf.cbars(end+1) = cb;
end