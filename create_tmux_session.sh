#!/bin/bash

set -xe

SUDO_PASSWD=password

# TODO criar variaveis para configurar se deve rodar os command quando criar
# as workspaces
# TODO evitar os valores fixos de session e window, pq o terminal da sessao
# esta nascendo no index 1 por causa de uma config no .tmux.conf

#if tmux has-session -t $SESSION_NAME 2>/dev/null; then
#    echo "Session $SESSION_NAME already exists. Attaching to it."
#    tmux attach-session -t $SESSION_NAME
#else

    # VPN Workspace
    tmux new-session -d -s vpn
    tmux rename-window -t vpn:1 sp3
    tmux new-window
    tmux rename-window -t vpn:2 cg
    tmux send-keys -t vpn:sp3.0 'echo "'$SUDO_PASSWD'" | sudo -S ls; sp3' C-m
    tmux send-keys -t vpn:cg.0 'echo "'$SUDO_PASSWD'" | sudo -S ls; cg' C-m

    # Application Workspace
    tmux new-session -d -s background
    tmux rename-window -t background:1 dbeaver
    tmux new-window -n postman
    tmux send-keys -t background:dbeaver.0 'pwd; dbeaver' C-m
    tmux send-keys -t background:postman.0 'pwd; postman' C-m

    # CardTerminais Workspace
    tmux new-session -d -s cardterminais
    tmux rename-window -t cardterminais:1 terminal
    tmux new-window -n vim
    tmux send-keys -t cardterminais:terminal.0 'cd ~/workspaces/card/cardterminais/; source .venv/bin/activate' C-m
    tmux send-keys -t cardterminais:vim.0 'cd ~/workspaces/card/cardterminais/; vim' C-m
    
    # LancamentoCredito Workspace
    tmux new-session -d -s lancamento_credito
    tmux rename-window -t lancamento_credito:1 terminal
    tmux new-window -n vim
    tmux send-keys -t lancamento_credito:terminal.0 'cd ~/workspaces/card/lancamento_credito/; source .venv/bin/activate' C-m
    tmux send-keys -t lancamento_credito:vim.0 'cd ~/workspaces/card/lancamento_credito/; vim' C-m

    # CardCredenciamento Workspace
    tmux new-session -d -s cardcredenciamento
    tmux rename-window -t cardcredenciamento:1 terminal
    tmux new-window -n vim
    tmux send-keys -t cardcredenciamento:terminal.0 'cd ~/workspaces/card/cardcredenciamento/; source .venv/bin/activate' C-m
    tmux send-keys -t cardcredenciamento:vim.0 'cd ~/workspaces/card/cardcredenciamento/; vim' C-m

    tmux attach-session

    #SESSION_NAME=vpn
    #tmux new-session -d -s $SESSION_NAME
    #tmux split-window -h
    #tmux send-keys -t 0 'echo "Hello from pane 1"' C-m
    #tmux send-keys -t 1 'echo "Hello from pane 2"' C-m
    #tmux attach-session -t $SESSION_NAME
#fi
