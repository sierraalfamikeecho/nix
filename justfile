EDITOR := "nvim"

rebuild:
        git add -A
        sudo nixos-rebuild switch --flake

edit:
        sudo {{ EDITOR }}
        just rebuild

modify:
        sudo {{ EDITOR }}
        just commit

commit:
        just rebuild
        git commit

update:
        nix-channel --update
        sudo nix flake update
        just rebuild
