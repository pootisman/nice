function nf = niceeye(nf, sig, sps, varargin)
  assert(isstruct(nf), "niceplot expects first argument to be a nicefig struct");
  
  figure(nf.f);
  hold on;
  
  nsymbs = floor(length(sig)/sps);
  
  cm_override = 0;
  if any(strcmp(varargin, 'Color')) ~= 0
    cm_override = 1;
  endif
  
  for i = [1:nsymbs]
    plot([1:sps], sig([(i-1)*sps+1:i*sps]), 'Color', nf.cmap(nf.cmid,:), varargin{:});
  endfor
  
  if cm_override == 0
    nf.cmid=mod(nf.cmid+1, length(nf.cmap));
  endif
endfunction
