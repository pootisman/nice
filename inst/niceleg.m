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

## usage: fs = niceleg(nf, varargin)
##
## Draw legend in figure, inheriting the style from the root struct.
## Alternatively, some parameters can be overriden.
## 
## varargin may contain following parameters:
## "fontname" - Which font to use on figure (Default: Latin Modern Roman)
## "fontsize" - What size of the font to use (Default: 14)
## "location" - Where the legend shall appear in the figure (Default: "southeast")
## "orientation" - Which orientation should be used for the legend (Default: "vertical")
## "numcolumns" - How many colums should be in the figure (Default: 1)
## output "fs" is a root struct for Nice Figure, should be passed
## to other nice functions to draw modify content in figure
##

function nf = niceleg(nf, varargin)
  assert(isstruct(nf), "niceleg expects first argument to be a nicefig struct");
  
  figure(nf.f);
  
  fontname = nf.fontname;
  fontsize = nf.fontsize;

  location = "southeast";
  orientation = "vertical";
  numcolumns = 1;
  
  reduce = 1;
  
  for i = 1:length(varargin)
    if strcmp(varargin{i}, "fontname")
      fontname = varargin{i+1};
      i=i+1;
      reduce=reduce+2;
    elseif strcmp(varargin{i}, "fontsize")
      fontsize = varargin{i+1};
      i=i+1;
      reduce=reduce+2;
    elseif strcmp(varargin{i}, "location")
      location = varargin{i+1};
      i=i+1;
      reduce=reduce+2;
    elseif strcmp(varargin{i}, "orientation")
      orientation = varargin{i+1};
      i=i+1;
      reduce=reduce+2;
    elseif strcmp(varargin{i}, "numcolumns")
      numcolumns = varargin{i+1};
      i=i+1;
      reduce=reduce+2;
    end
  end

  leg = legend(varargin{reduce:end});
  
  set(leg, 'fontname', fontname);
  set(leg, 'fontsize', fontsize);
  set(leg, 'location', location);
  set(leg, 'orientation', orientation);
  set(leg, 'numcolumns', numcolumns);
  set(leg, 'interpreter', 'tex');
  
  nf.legs(end + 1) = leg;
end
