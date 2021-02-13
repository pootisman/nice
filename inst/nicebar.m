function cb = nicebar(nf, varargin)
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

  varargin = varargin(reduce_vararg_len:end)

  cb = colorbar(varargin{:});

  set(cb, 'fontname', fontname);
  set(cb, 'fontsize', fontsize);
  
  nf.cbars(end+1) = cb;
end