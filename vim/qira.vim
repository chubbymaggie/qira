if !has('python')
  echo "vim must be compiled with +python"
  finish
endif

" highlight the line
" hi CursorLine cterm=NONE ctermbg=darkblue
set cursorline

function! Bob()

python << EOF

from socketIO_client import SocketIO, BaseNamespace
import vim

class CdaNamespace(BaseNamespace):
  pass

fn = vim.current.window.buffer.name
(row, col) = vim.current.window.cursor

sio = SocketIO('localhost', 3002)
cda_namespace = sio.define(CdaNamespace, '/cda')
cda_namespace.emit('navigateline', fn, row)

#print fn, row

#vim.current.buffer.append('bobobbb')
#print dir(vim)

EOF

" autocmd CursorMoved * :call Bob()

endfunction

