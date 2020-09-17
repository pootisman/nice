function h = nicewfall(samps, times, Ns, Nt, fig_struct )
    if ~exist("fig_struct")
      warning("nicewfall expects nice figure struct, creating fig in-place...");
      fig_struct = nicefig();
    endif
    
    sampmin = min(samps);
    sampmax = max(samps);
    nss = floor(length(samps)/Nt);
    
    timemin = min(times);
    timemax = max(times);
    
    ss = linspace(sampmin, sampmax, Ns);
    ts = linspace(timemin, timemax, Nt);

    Zvals = [];
    
    for i = 1:length(ts)
      [hits, bins] = hist(samps((i-1)*nss+1:i*nss), ss);
      hitsn = hits/sum(hits)/(bins(2) - bins(1));
      Zvals = [Zvals; hitsn];
    endfor
    
    [S,T] = meshgrid(ss, ts);
    
    size(S);
    size(T);
    size(Zvals);
    
    surface(S, T, Zvals, "EdgeColor", "None");
    
    colormap(fig_struct.cmap);
    
endfunction
