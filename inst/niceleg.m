function nf = niceleg(nf, varargin)
  assert(isstruct(nf), "niceleg expects first argument to be a nicefig struct");
  
  figure(nf.f);
  
  fontname = nf.fontname;
  fontsize = nf.fontsize;

  location = "southeast";
  orientation = "vertical";
  
  for i = 1:length(varargin)
    if strcmp(varargin{i}, "fontname")
      fontname = varargin{i+1};
      i=i+1;
    elseif strcmp(varargin{i}, "fontsize")
      fontsize = varargin{i+1};
      i=i+1;
    elseif strcmp(varargin{i}, "location")
      location = varargin{i+1};
      i=i+1;
    elseif strcmp(varargin{i}, "orientation")
      orientation = varargin{i+1};
      i=i+1;
    end
  end

  leg = legend(varargin);
  
  set(leg, 'fontname', fontname);
  set(leg, 'fontsize', fontsize);
  set(leg, 'location', location);
  set(leg, 'orientation', orientation);
  set(leg, 'interpreter', 'tex');
  
  nf.legs(end + 1) = leg;
end
