function nf = niceplot(nf, y, varargin)
  assert(isstruct(nf), "niceplot expects first argument to be a nicefig struct");
  
  figure(nf.f);
  hold on;

  cm_override = 0;

  if any(strcmp(varargin, 'Color')) ~= 0
    cm_override = 1;
  endif
  
  if length(varargin) > 0
    Y = varargin{1};
    varargin = varargin(2:end);
    if cm_override == 0
      plot(y, Y, 'Color', nf.cmap(nf.cmid,:), varargin{:});
    else
      plot(y, Y, varargin{:});
    endif
  else
    plot(y, 'Color', nf.cmap(nf.cmid,:), varargin{:});
  endif
 
  if cm_override == 0
    nf.cmid=mod(nf.cmid+1, length(nf.cmap));
  endif

endfunction
