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
%% usage: niceprint(fig_struct, filename)
%%
%% Print instance of Nice Figure to file on disk
%%
%% fig_struct - which figure to print to file
%% filename - what is the output file, format determined from filename
%%

function niceprint(fig_struct, filename)
  assert(isstruct(fig_struct), "niceprint expects nice figure struct");
 
  printer = sprintf("-d%s", strsplit(filename, '.'){end});
  sizestr = sprintf("-S%d,%d", fig_struct.size(1),  fig_struct.size(2));
  fontstr = sprintf("-F%s", fig_struct.fontname);
  
  print(fig_struct.f, filename, sizestr, fontstr, printer)
end
