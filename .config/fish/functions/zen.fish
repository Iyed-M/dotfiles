function zen --wraps='MOZ_ENABLE_WAYLAND=1 zen-browser' --wraps='set MOZ_ENABLE_WAYLAND 1 ; zen-browser' --description 'alias zen set MOZ_ENABLE_WAYLAND 1 ; zen-browser'
  set MOZ_ENABLE_WAYLAND 1 ; zen-browser $argv
        
end
