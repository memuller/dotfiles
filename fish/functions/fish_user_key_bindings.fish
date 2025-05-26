function fish_user_key_bindings
    if type fzf
      fzf --fish | source
    end
  end