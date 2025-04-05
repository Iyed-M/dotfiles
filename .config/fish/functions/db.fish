function db --wraps=fish-source\ .env\ \;\ pgcli\ \'\' --wraps='fish-source .env ; pgcli $DB' --description 'alias db fish-source .env ; pgcli $DB'
  fish-source .env ; pgcli $DB $argv
        
end
