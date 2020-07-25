function [f, a] = nicefig(varargin)
  fontname = "Arial";
  fontsize = 14;
  pos = [300 200];
  sz = [560 420];

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
    end
  end

  f = figure();
  a = gca();
  box on;
  grid on;
  set(a, 'fontname', fontname);
  set(a, 'fontsize', fontsize);
  set(f, 'position', [pos sz]);
end

