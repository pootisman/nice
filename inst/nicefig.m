function fs = nicefig(varargin)
  fontname = "Latin Modern Roman";
  fontsize = 14;
  pos = [300 200];
  sz = [560 420];
  cmap = viridis(64);
  
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
    endif
  endfor

  fs.f = figure();
  fs.a = gca();
  fs.font = fontname;
  fs.fontsize = fontsize;
  fs.pos = pos;
  fs.size = sz;
  fs.cmap = cmap;
  fs.cmid = 1;
  fs.legs = {};
  fs.cbars = {};
  
  box on;
  grid on;
  hold on;
  set(fs.a, 'fontname', fontname);
  set(fs.a, 'fontsize', fontsize);
  set(fs.f, 'position', [pos sz]);
endfunction
