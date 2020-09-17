function nf = nicehist(x, y, varargin)
  assert(isstruct(nf), "niceplot expects first argument to be a nicefig struct");
  
  figure(nf.f);
  hold on;
  
  if length(varargin) > 0
    Y = varargin{1};
    varargin = varargin(2:end);
    plot(y, Y, 'Color', nf.cmap(nf.cmid,:), varargin);
  else
    plot(y, 'Color', nf.cmap(nf.cmid,:), varargin);
  endif
  
  nf.cmid=nf.cmid+1;
endfunction
