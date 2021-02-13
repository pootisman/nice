function nf = nicebar(nf, varargin)
  assert(isstruct(nf), "nicebar expects first argument to be a nicefig struct");

  figure(nf.f);
  
  fontname = nf.fontname;
  fontsize = nf.fontsize;

  for i = 1:length(varargin)
    if strcmp(varargin{i}, "fontname")
      fontname = varargin{i+1};
      i=i+1;
    elseif strcmp(varargin{i}, "fontsize")
      fontsize = varargin{i+1};
      i=i+1;
    end
  end

  cb = colorbar("southoutside");
  
  set(cb, 'fontname', fontname);
  set(cb, 'fontsize', fontsize);
  
  nf.cbars(end+1) = cb;
end