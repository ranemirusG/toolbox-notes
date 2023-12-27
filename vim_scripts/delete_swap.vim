function! DeleteSwapFile()
        redir => s:a
        exe ':sil sw'
        redir end
        let b:swapname = s:a[1:]
        call delete(b:swapname)
endfunction