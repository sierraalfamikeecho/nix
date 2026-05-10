EDITOR := "nvim"

rebuild:
        git add -A
        sudo nixos-rebuild switch --flake

edit:
        sudo {{ EDITOR }}
        just commit

commit:
        just rebuild
        git commit

update:
        nix-channel --update
        just rebuild
