" vim: et sw=2 sts=2

scriptencoding utf-8

" Function: #run {{{1
function! sy#action#run(fname) abort
  if !exists('b:sy') || empty('b.sy.hunks')
    echomsg 'signify: I cannot detect any changes!'
    return
  endif

  let lnums = []
  for hunk in b:sy.hunks
    let lnums = extend(lnums, range(hunk.start, hunk.end))
  endfor

  call call(a:fname, [lnums])
  noautocmd update
endfunction
