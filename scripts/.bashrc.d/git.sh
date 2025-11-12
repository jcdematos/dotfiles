
function gam {
	files=$(git status | grep modified | awk '{print $2}')
	git add $files
}

alias gm='git commit -m'

alias gst='git checkout main && git pull && git checkout -b '

alias gp='git push'
alias gpset='git push --set-upstream origin'


