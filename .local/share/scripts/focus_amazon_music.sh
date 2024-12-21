niri msg action focus-window --id $(niri msg windows|grep --before-context=1 --color=never 'Amazon Music Unlimited'|awk 'NR==1{print substr($3,1,length($3)-1)}')
