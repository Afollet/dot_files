alias gst='git status -u no'
alias gsh='git show --color'
alias ga='git add'
alias conflict='git diff --name-only --diff-filter=U'
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -ah'
alias latr='ls -latr'
alias cd='pushd 1>/dev/null'
alias dirs='dirs -p -v | sort -k2 | uniq -f1 | sort -k1 -g'

umask 007

gls () {
    git ls-files "$@"
}

grb () {
    git rebase "$@"
}

gco () {
    git checkout "$@"
}

groovy_ngs (){
    /home/alex/vcgs/cpipe/tools/groovy/2.5.13/bin/groovy -cp /home/alex/vcgs/cpipe/tools/groovy/2.5.13/embeddable/groovy-all-2.5.13.jar:/home/alex/vcgs/cpipe/tools/groovy-ngs-utils/1.0.8/groovy-ngs-utils.jar "$@"
}

click(){
    xdg-open "$@"
}

libre() {
    libreoffice "$@"
}

weather() {
    curl wttr.in/Melbourne
}

bat() {
    batcat "$@"
}

dbuild () {
    dc up -d --force-recreate "$@" 
}

ra () {
    ranger "$@"
}

hpc_jup () {
    scp dev.meerkat.mcri.edu.au:/hpc/bpipeLibrary/shared/jupyter-lab-scripts/scripts/start_jupyterlab_client_script.sh . && bash start_jupyterlab_client_script.sh
}

branch () {
    git branch "$@"
}

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
    libreoffice --calc "$@" &  2>&1 > /dev/null
}
cdk () 
{ 
    ls --color=auto | yank-cli;
    cd $( xclip -o -selection clipboard )
}
xclipin (){
    xclip -in -selection clipboard "$@"
}

dc () {
    docker-compose "$@"
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
gbr () 
{ 
    git branch "$@"
}
function gdf () 
{ 
    git diff --color "$@"
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
snapr () 
{ 
    laun snap run "$1"
}
tickets () 
{ 
    laun firefox "https://git.mcri.edu.au/vcgs/clinicalbioinformatics/-/issues?scope=all&utf8=%e2%9c%93&state=opened&assignee_username=alex.follette"
}
vif () 
{ 
    %vim 2> /dev/null || vim
}
ynk () 
{ 
    cat - | yank-cli;
    xclip -o -selection primary | xclip -i -selection clipboard
}
you_cool_bro () 
{ 
    IF [ $? -EQ 0 ]; THEN
        ECHO "😎";
    ELSE
        ECHO "💩";
    FI
}
