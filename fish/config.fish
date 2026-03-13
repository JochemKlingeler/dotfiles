# Store in ~/.config/fish/config.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr -a -- phpd 'XDEBUG_CONFIG=ideakey=docker php'

    abbr -a -- u 'runuser -u www-data --'
    abbr -a -- makeu 'runuser -u www-data -- make'
end
