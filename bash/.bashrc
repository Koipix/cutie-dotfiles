
##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /home/pixy/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/pixy/.config/synth-shell/synth-shell-prompt.sh
fi

##-----------------------------------------------------
## better-ls
if [ -f /home/pixy/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/pixy/.config/synth-shell/better-ls.sh
fi

##-----------------------------------------------------
## alias
if [ -f /home/pixy/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/pixy/.config/synth-shell/alias.sh
fi

##-----------------------------------------------------
## better-history
if [ -f /home/pixy/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/pixy/.config/synth-shell/better-history.sh
fi
