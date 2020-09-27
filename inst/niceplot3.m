function nf = niceplot3(nf, x, y, z, varargin)
  assert(isstruct(nf), "niceplot expects first argument to be a nicefig struct");
  
  figure(nf.f);
  hold on;

  cm_override = 0;

  if any(strcmp(varargin, 'Color')) ~= 0
    cm_override = 1;
  endif

 
  if ~cm_override
      plot3(x, y, z, 'Color', nf.cmap(nf.cmid,:), varargin{:});
  else
      plot3(x, y, z, varargin{:})
  endif
 
  if cm_override == 0
    nf.cmid=mod(nf.cmid+1, length(nf.cmap));
  endif

endfunction
