function niceprint(fig_struct, filename)
  assert(isstruct(fig_struct), "niceprint expects nice figure struct");
 
  printer = sprintf("-d%s", strsplit(filename, '.'){end})
  sizestr = sprintf("-S%d,%d", fig_struct.size(1),  fig_struct.size(2))
  fontstr = sprintf("-F%s:%d", fig_struct.font,  fig_struct.fontsize)
  
  print(fig_struct.f, filename, sizestr, fontstr, printer)
endfunction
