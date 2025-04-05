function deps --wraps=pactree\ -r\ \ \$\(paru\ -Q\ \|\ fzf\ \|\ awk\ \'\{print\ \}\'\) --wraps=pactree\ -r\ \ \$\(paru\ -Q\ \|\ fzf\ \|\ awk\ \'\{print\ \$1\}\'\) --description alias\ deps\ pactree\ -r\ \ \$\(paru\ -Q\ \|\ fzf\ \|\ awk\ \'\{print\ \$1\}\'\)
  pactree -r  $(paru -Q | fzf | awk '{print $1}') $argv
        
end
