function niceprint(fig_struct, filename)
  assert(isstruct(fig_struct), "niceprint expects nice figure struct");
 
  printer = sprintf("-d%s", strsplit(filename, '.'){end})
  sizestr = sprintf("-S%d,%d", fig_struct.size(1),  fig_struct.size(2))
  fontstr = sprintf("-F%s", fig_struct.font)
  
  print(fig_struct.f, filename, sizestr, fontstr, printer)
endfunction
