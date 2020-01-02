alias v='nvim'
alias pctl='pulseaudio-ctl'
alias hc='herbstclient'
alias servehttp='sudo python -m SimpleHTTPServer 80'
alias ccat='pygmentize -g'

alias dcps='docker-compose ps'
alias dcup='docker-compose up -d --build'
alias dcem='docker exec -it $(docker ps | grep main | cut -d" " -f1) sh'
alias docker-ips='for NODE in $(docker node ls --format '{{.Hostname}}'); do echo -e "${NODE} - $(docker node inspect --format '{{.Status.Addr}}' "${NODE}")"; done'

cp='cp -i'
mv='mv -i'

alias gitls='git ls-tree -r --name-only HEAD | while read filename; do   echo "$(git log -1 --format="%ai" -- $filename) $filename"; done | sort'
