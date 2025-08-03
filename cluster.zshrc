##################################################################
# Load some default settings
source /home/itv/zsh/itvdefault

##################################################################
# Setup nice command history
source /home/itv/zsh/history

##################################################################
# Load useful ITV tools
source /home/itv/zsh/itvtools

##################################################################
# Load useful ITV libs
source /home/itv/zsh/itvlibs

##################################################################
# Link your own tools
#export PATH=$HOME/tools:$PATH

##################################################################
# Add your program options

# 'o' infornt means Terence version 
# 's' infront means smaller version

##export GREP_OPTIONS=--exclude-dir=".svn"
alias ogrep='grep --exclude-dir=".svn"'
alias grep='rg -n -i'
alias sgrep='rg -n -i -j1'

# Add your aliases
alias em='emacs --no-splash'
alias vi='nvim'
alias vim='vim'
alias ovim='vim'
alias pv='paraview'

# Aktivieren von Farben
autoload -U colors && colors

# Alias
alias l="ls -lh --color=always | awk '{print \$6, \$7, \$8, \$5, \$9}'"
alias lsa="ls -lah --color=always | awk '{print \$6, \$7, \$8, \$5, \$9}'"
alias ll='ls -lh'
alias ol='ls -lh'
alias oll='ls -lah'

alias squeue_jf='squeue -u mm406063 --format="%10u %30j %10A %10P %9a %7D %7C %12M %12l %12L %22V %25R %E" --sort="P,u,t,j"'
alias sq='squeue_jf'
alias squeue_projects='squeue -A p0020340 --format="%10u %30j %10A %15P %9a %7D %7C %12M %12l %12L %22V %25R %E" --sort="P,u,t,j"'
alias sqp='squeue_projects'
alias squeue_itv='squeue -p itv --format="%10u %30j %10A %15P %9a %7D %7C %12M %12l %12L %22V %25R %E" --sort="P,u,t,j"'
alias sq_itv='squeue_itv'
alias sc='scancel'
alias sqpa='squeue -A thes1969 --format="%10u %30j %10A %15P %9a %7D %7C %12M %12l %12L %22V %25R %E" --sort="P,u,t,j"'
alias sqs='squeue -u mm406063 --format="%30j %10A %10P %7C %12M %12l %12L %22V" --sort="P,u,t,j"'
alias sqspa='squeue -A thes1969 --format="%30j %10A %10P %7C %12M %12l %12L %22V" --sort="P,u,t,j"'

alias job_pv='salloc --time=01:00:00 --nodes=1 --ntasks=1 --mem=4G'

alias rwlm='r_wlm_usage -q; r_wlm_usage -p p0020340;'
alias rquota='r_quota -u p0020340;'
alias rq="rquota"

alias amrvis2="~/Software/Amrvis/amrvis2d.gnu.ex"
alias av2="amrvis2"
alias amrvis3="~/Software/Amrvis/amrvis3d.gnu.ex"
alias av3="amrvis3"

alias partitions="sacctmgr show associations user=$USER format=User,Account,Cluster,Partition"
alias pt="partitions"

alias linebreak='echo ###############################; echo ###############################; echo ###############################; echo ###############################;'

alias cd.="cd .."
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."

alias .="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias tma="tmux attach -t"
alias tmn="tmux new-session -t"
alias pushd="pushd > /dev/null"
alias dirs="dirs -v"
alias fm="foamMonitor postProcessing/secondaryInletMassFlow/0/surfaceFieldValue.dat"
alias fmo="foamMonitor postProcessing/secondaryInletMassFlow/0/surfaceFieldValue_0.dat"

##################################################################
# Custom Prompt
# === Grundfarben ===
setopt prompt_subst
typeset -a pathcolors=(104 105)
arrow_color='%F{109}'

# === Virtualenv-Prompt (selbst) ===
export VIRTUAL_ENV_DISABLE_PROMPT=1
prompt_virtualenv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    print -n "%F{103}(${VIRTUAL_ENV:t})%f "
  fi
}

# === Farbige Pfadangabe (wechselnd) ===
colorize_path() {
  local short=${PWD/#$HOME/~}
  local seg i=0 out
  for seg in ${${(s:/:)short}//~/~/}; do
    ((i++))
    out+="%F{${pathcolors[(i%2)+1]}}${seg}%f/"
  done
  # letztes "/" entfernen
  echo -n "${out%/}"
}

# === Finaler Prompt ===
PROMPT='$(prompt_virtualenv)$(colorize_path) '"$arrow_color"'>%f '

##################################################################
# Aliasing to python scripts
#
alias ceptr_module="module restore ceptr;source ~/Software/venv_ceptr/bin/activate"

##################################################################
# Often used dirs 

export ceptr_dir=~/Software/PelePhysics/Support/ceptr/ceptr/
export transport_dir=~/Software/PelePhysics/Source/Transport/
export project_dir=/hpcwork/p0020340/JustinFreiberger
export pa_dir=/hpcwork/thes1969

alias ceptr_dir="cd $ceptr_dir"
alias pa_dir="cd $pa_dir"

setopt AUTO_CD

################################################################
# Load your default modules
# DO NOT CHANGE THE DEFAULT MPI MODULE HERE
# CHANGING MPI USUALLY LEADS TO SERIOUS ISSUES
# BE CAREFUL WITH CHANGING THE DEFAULT COMPILER
# CHANGING THE DEFAULT COMPILER ALSO OFTEN LEADS TO ISSUES

# module load GCCcore
# Loading my own workflow, will fail, if neovim and tmux are not installed localy

# new tmux
export PATH="$HOME/.local/bin:$PATH"
# neovim
export PATH="$HOME/.neovim/bin:$PATH"
# ripgrep
export PATH="$HOME/.local/bin/rg:$PATH"
