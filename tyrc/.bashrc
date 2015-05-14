# system aliases
alias ~="cd ~" 
alias ls="ls -GFh"

####wxapi specific aliases
#source wxapi virtualenv
alias activate=". ~/projects/wxapi/ENV/bin/activate"
# alias for test_hapi
alias ht="python test.py --wxgrid-nodes cassa-e1a-00.pyke.meridian-enviro.com,cassa-e1a-01.pyke.meridian-enviro.com,cassa-e1a-02.pyke.meridian-enviro.com,cassa-e1a-03.pyke.meridian-enviro.com,cassa-e1d-00.pyke.meridian-enviro.com,cassa-e1d-01.pyke.meridian-enviro.com,cassa-e1d-02.pyke.meridian-enviro.com,cassa-e1d-03.pyke.meridian-enviro.com,cassa-e1e-00.pyke.meridian-enviro.com,cassa-e1e-01.pyke.meridian-enviro.com,cassa-e1e-02.pyke.meridian-enviro.com,cassa-e1e-03.pyke.meridian-enviro.com --wxgrid-pool-size 12 --statsd-prefix 'test_delete_me' --statsd-loc 'localhost' --statsd-batch-size 100 --keyspace='wxgrid_long_lived_v2' --wx_host_address='mizar' --wx_host_port=22220"
#alias for wxapit gunicorn
alias wxup="activate; cd ~/projects/wxapi; gunicorn -w 10 -t 240 --max-requests 10000 -b :22220 -e port=22220 -e statsd_loc=$HOST -e statsd_prefix=$HOST-delete-me -e wxgrid_nodes=cassa-e1a-00.pyke.meridian-enviro.com,cassa-e1a-01.pyke.meridian-enviro.com,cassa-e1a-02.pyke.meridian-enviro.com,cassa-e1a-03.pyke.meridian-enviro.com,cassa-e1d-00.pyke.meridian-enviro.com,cassa-e1d-01.pyke.meridian-enviro.com,cassa-e1d-02.pyke.meridian-enviro.com,cassa-e1d-03.pyke.meridian-enviro.com,cassa-e1e-00.pyke.meridian-enviro.com,cassa-e1e-01.pyke.meridian-enviro.com,cassa-e1e-02.pyke.meridian-enviro.com,cassa-e1e-03.pyke.meridian-enviro.com hapi:app"

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedababagacad

source ~/git-completion.bash
