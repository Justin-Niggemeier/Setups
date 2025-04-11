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
##export GREP_OPTIONS=--exclude-dir=".svn"
alias grep='grep --exclude-dir=".svn"'

##################################################################
# Add your aliases
#alias em='emacs -nw'
alias em='emacs --no-splash'
alias vi='nvim'
alias vim='nvim'
alias oldvim='vim'
alias pv='paraview'
alias ne='nedit'

# Aktivieren von Farben
autoload -U colors && colors

# Alias
alias l="ls -lh --color=always | awk '{print \$6, \$7, \$8, \$5, \$9}'"
alias lsa="ls -lah --color=always | awk '{print \$6, \$7, \$8, \$5, \$9}'"
alias ll='ls -lh'
alias oldl='ls -lh'
alias oldll='ls -lah'

alias squeue_jf='squeue -u mm406063 --format="%10u %30j %10A %10P %9a %7D %7C %12M %12l %12L %22V %25R %E" --sort="P,u,t,j"'
alias sq='squeue_jf'
alias squeue_projects='squeue -A p0020340 --format="%10u %30j %10A %15P %9a %7D %7C %12M %12l %12L %22V %25R %E" --sort="P,u,t,j"'
alias sqp='squeue_projects'
alias squeue_itv='squeue -p itv --format="%10u %30j %10A %15P %9a %7D %7C %12M %12l %12L %22V %25R %E" --sort="P,u,t,j"'
alias sq_itv='squeue_itv'
alias sc='scancel'

alias rwlm='r_wlm_usage -q; r_wlm_usage -p p0020340;'
#alias rquota='r_quota -u p0020340;'
#alias rq="rquota"

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

alias tma="tmux attach -t"
alias tmn="tmux new-session -t"
alias pushd="pushd > /dev/null"
alias dirs="dirs -v"

#################################################################
# Terence Leftovers 
#alias python=python3
#alias pip=pip3
#alias python=python3
#alias pip=pip3
#alias ScanMan_Parallel='~/Software/FlameMaster_parallel/Bin/bin/ScanMan'
#alias FlameMan_Parallel='~/Software/FlameMaster_parallel/Bin/bin/FlameMan'
#alias m_ciao='module purge; module restore CIAO'
#alias m_FM='module purge; module restore Flamemaster'
#alias m_FM_p='module purge; module restore Flamemaster_parallel'
#alias m_paraview='module purge; module restore ParaView'
##################################################################
# Aliasing to python scripts
#
alias ceptr_module="module restore ceptr;. ~/Software/venv_ceptr/bin/activate"

##################################################################
# Often used dirs 

export ceptr_dir=~/Software/PelePhysics/Support/ceptr/ceptr/
export transport_dir=~/Software/PelePhysics/Source/Transport/
export project_dir=/hpcwork/p0020340/JustinFreiberger
setopt AUTO_CD

# loading neovim

export PATH=$HOME/neovim/nvim-linux64/bin:$PATH

################################################################
# Load your default modules
# DO NOT CHANGE THE DEFAULT MPI MODULE HERE
# CHANGING MPI USUALLY LEADS TO SERIOUS ISSUES
# BE CAREFUL WITH CHANGING THE DEFAULT COMPILER
# CHANGING THE DEFAULT COMPILER ALSO OFTEN LEADS TO ISSUES

# module load GCCcore
# Loading my own workflow, will fail, if neovim and tmux are not installed localy
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.neovim/bin:$PATH"
