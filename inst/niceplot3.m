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
%% usage: fs = niceplot3(nf, x, y, z, varargin)
%%
%% Plot in 3D space
%% 
%% varargin may contain following parameters:
%% nf - root struct for Nice Figure to draw on
%% "Color" - Triggers use of figure colormap, instead of default one
%% Any other option that can be passed to plot3
%%
%% output "fs" is a root struct for Nice Figure, should be passed
%% to other nice functions to draw modify content in figure
%%

function nf = niceplot3(nf, x, y, z, varargin)
  assert(isstruct(nf), "niceplot expects first argument to be a nicefig struct");
  
  figure(nf.f);
  axes(nf.cax);
  hold on;


  cm_override = 1;

  if any(strcmp(varargin, 'Color')) ~= 0
    cm_override = 0;
  end

 
  if ~cm_override
      plot3(x, y, z, 'Color', nf.cmap(nf.cmid,:), varargin{:});
  else
      plot3(x, y, z, varargin{:})
  end
   
  box on;
  grid on;
  
  if cm_override == 0
    nf.cmid=mod(nf.cmid+1, length(nf.cmap));
  end

end
