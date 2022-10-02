alias wd-wgs='cd /misc/vcgs/seq/cpipe-wgs-dev'
alias wd-ex='cd /misc/vcgs/seq/cpipe-2.3-staging'
alias wd-dv='cd /misc/vcgs/seq/cpipe-2.3-dev'
alias gst='git status -u no'
alias gdf='git diff --color'
alias gsh='git show --color'
alias ga='git add'
alias bbpipe='../../../bpipe'
alias bbl='../../../bpipe log -n 10000'
alias conflict='git diff --name-only --diff-filter=U'
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -ah'
alias latr='ls -latr'
alias make_ctags='ctags --options=/home/alex.follette/groovy_ctags `pwd`/*groovy'
alias dalex='cd /misc/vcgs/data/alex'
alias cd='pushd 1>/dev/null'
alias dirs='dirs -p -v | sort -k2 | uniq -f1 | sort -k1 -g'

umask 007


rtable () {
    column -t -s $'\t' "$1"
}

git_lol () {
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

iv(){
	%vim || vim
}

bbe () 
{ 
    ../../../bpipe errors
}
bbh () 
{ 
    ../../../bpipe history
}
bbp () 
{ 
    bbpipe "$@"
}
bbpipe () 
{ 
    ../../../bpipe "$@"
}
ca () 
{ 
    libreoffice --calc "$1" &  2>&1 > /dev/null
}
cdk () 
{ 
    ls --color=auto | yank-cli;
    cd $( xclip -o -selection clipboard )
}
dclogs () 
{ 
    docker-compose logs $1 | less -R +G
}
drecreate () 
{ 
    docker-compose up -d --force-recreate "$@"
}
dsp_tickets () 
{ 
    laun firefox "https://git.mcri.edu.au/VCGS/data-sharing-project/-/boards?scope=all&utf8=%E2%9C%93&assignee_username=alex.follette"
}
edit_alias () 
{ 
    vim ~/.bash_aliases && source ~/.bash_aliases
}
fzf-file-widget () 
{ 
    local selected="$(__fzf_select__)";
    READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}";
    READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
}
gb () 
{ 
    git branch "$@"
}
gdf () 
{ 
    git diff
}
ggtags () 
{ 
    ctags --options=/home/alex/personal_projects/dot_files/groovy_ctags -R
}

laun () 
{ 
    nohup $@ > /dev/null 2>&1 & disown
}
lookupRs () 
{ 
    curl --ciphers DEFAULT@SECLEVEL=1 'https://rest.ensembl.org/variation/human/'"$1" -H 'Content-type:application/json' | jq . -
}
lookupSeq () 
{ 
    curl --ciphers DEFAULT@SECLEVEL=1 'https://rest.ensembl.org/sequence/region/human/'"$1"'?' -H 'Content-type:application/json' | jq . -
}
lookupSnpf () 
{ 
    firefox 'https://www.ncbi.nlm.nih.gov/snp/'"$1" &
}
md_to_html () 
{ 
    md_file="$1";
    pandoc -o ${md_file[1,-4]}.html -t html -f commonmark "$md_file"
}

rec () 
{ 
    rows=${1:-"1"};
    ls --color=auto -t | head -n "$rows"
}
SNAPR () 
{ 
    LAUN SNAP RUN "$1"
}
TICKETS () 
{ 
    LAUN FIREFOX "HTTPS://GIT.MCRI.EDU.AU/VCGS/CLINICALBIOINFORMATICS/-/ISSUES?SCOPE=ALL&UTF8=%E2%9C%93&STATE=OPENED&ASSIGNEE_USERNAME=ALEX.FOLLETTE"
}
VIF () 
{ 
    %VIM 2> /DEV/NULL || VIM
}
YNK () 
{ 
    CAT - | YANK-CLI;
    XCLIP -O -SELECTION PRIMARY | XCLIP -I -SELECTION CLIPBOARD
}
YOU_COOL_BRO () 
{ 
    IF [ $? -EQ 0 ]; THEN
        ECHO "😎";
    ELSE
        ECHO "💩";
    FI
}
