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
%% usage: fs = nicefig(varargin)
%%
%% Spawn an instance Nice Figure. Box and grid modifiers
%% are automatically enabled, as well as holding the plots
%% 
%% varargin may contain following parameters:
%% "fontname" - Which font to use on figure (Default: Latin Modern Roman)
%% "fontsize" - What size of the font to use (Default: 14)
%% "position" - Where the figure shall appear on display (Default: [300 200])
%% "size" - Which size should be used for the figure (Default: [560 420])
%% "cmap" - Default colormap for the figure (Default: viridis(64))
%%
%% output "fs" is a root struct for Nice Figure, should be passed
%% to other nice functions to draw modify content in figure
%%

function fs = nicefig(varargin)
  fontname = "Latin Modern Roman";
  fontsize = 14;
  pos = [300 200];
  sz = [560 420];
  cmap = lines();
  shade = "flat";
  lights = "none";

  for i = 1:length(varargin)
    if strcmp(varargin{i}, "fontname")
      fontname = varargin{i+1};
      i=i+1;
    elseif strcmp(varargin{i}, "fontsize")
      fontsize = varargin{i+1};
      i=i+1;
    elseif strcmp(varargin{i}, "position")
      pos = varargin{i+1};
      i=i+1;
    elseif strcmp(varargin{i}, "size")
      sz = varargin{i+1};
      i=i+1;
    elseif strcmp(varargin{i}, "cmap")
      cmap = varargin{i+1};
      i=i+1;
    elseif strcmp(varargin{i}, "shading")
      shade = varargin{i+1};
      i=i+1;
    elseif strcmp(varargin{i}, "lighting")
      lights = varargin{i+1};
      i=i+1;
    end
  end

  fs.f = figure();
  fs.a = gca();
  fs.fontname = fontname;
  fs.fontsize = fontsize;
  fs.pos = pos;
  fs.size = sz;
  fs.cmap = cmap;
  fs.cmid = 1;
  fs.legs = {};
  fs.cbars = {};
  fs.hax = {};
  fs.polys = {};
  fs.cax = fs.a;
  fs.shade = shade;
  fs.lights = lights;

  box on;
  grid on;
  hold on;
  set(fs.a, 'fontname', fontname);
  set(fs.a, 'fontsize', fontsize);
  set(fs.f, 'position', [pos sz]);
end
