function leg = niceleg(varargin)
  fontname = "Arial";
  fontsize = 14;

  for i = 1:length(varargin)
    if strcmp(varargin{i}, "fontname")
      fontname = varargin{i+1};
      i=i+1;
    elseif strcmp(varargin{i}, "fontsize")
      fontsize = varargin{i+1};
      i=i+1;
    end
  end

  leg = legend();
  set(leg, 'fontname', fontname);
  set(leg, 'fontsize', fontsize);
end
