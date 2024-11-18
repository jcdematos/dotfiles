
alias dir='dir --color=auto'
alias la='ls -A -B --color=always --group-directories-first'
alias ls='ls --color=always'
alias c='clear'
alias t='task'
alias :q='exit'

# swallow
alias mpv="swallow mpv"
alias zathura="swallow zathura"
alias emacs="swallow emacs"

alias yt-mp3='youtube-dl --extract-audio --audio-format mp3'
alias yt-playlist="
yt-dlp --ignore-errors --write-description -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' -o '%(playlist)s/%(playlist_index)s - %(title)s'"
alias yt-mp3-playlist="youtube-dl --ignore-erros --extract-audio --audio-format mp3 --write-description -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"

alias wiki="vim ~/wiki/docs/"
alias org="vim ~/org/"

function mkcd() {
    path=$1
    mkdir -p $1
    cd $1
}
