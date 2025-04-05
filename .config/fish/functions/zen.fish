function zen --wraps='MOZ_ENABLE_WAYLAND=1 zen-browser' --wraps='set MOZ_ENABLE_WAYLAND 1 ; zen-browser' --wraps='MOZ_ENABLE_WAYLAND zen-twilight' --description 'alias zen MOZ_ENABLE_WAYLAND zen-twilight'
  MOZ_ENABLE_WAYLAND zen-twilight $argv
        
end
