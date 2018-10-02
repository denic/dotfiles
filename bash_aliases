alias v='nvim'
alias pctl='pulseaudio-ctl'
alias hc='herbstclient'
alias servehttp='sudo python -m SimpleHTTPServer 80'
alias ccat='pygmentize -g'

alias dcps='docker-compose ps'
alias dcup='docker-compose up -d --build'
alias dcem='docker exec -it $(docker ps | grep main | cut -d" " -f1) sh'
