function nvim --wraps=TERM=\'xterm-kitty\'\ /usr/bin/nvim --description alias\ nvim\ TERM=\'xterm-kitty\'\ /usr/bin/nvim
  TERM='xterm-kitty' /usr/bin/nvim $argv
        
end
