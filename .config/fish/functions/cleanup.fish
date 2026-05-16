function cleanup
    sudo pacman -Rns (pacman -Qtdq)
end
