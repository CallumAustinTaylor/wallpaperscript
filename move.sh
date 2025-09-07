#!/run/current-system/sw/bin/bash

echo "Starting the script..." > /tmp/debug.log

# List all kitty instances and their sockets for debugging
kitty @ ls >> /tmp/debug.log 2>&1

# Remove old colors config
rm -f ~/.config/kitty/colors.conf

# Extract colors from wal and create new config
cat ~/.cache/wal/colors-kitty.conf | grep color > ~/.config/kitty/colors.conf

kitty @ set-colors ~/.config/kitty/colors.conf
# Apply colors to ALL kitty instances
# Method 1: Try to find all kitty sockets and apply to each
for socket in /tmp/kitty-*; do
    if [ -S "$socket" ]; then
        echo "Applying colors to socket: $socket" >> /tmp/debug.log
        kitty @ --to "unix:$socket" set-colors ~/.config/kitty/colors.conf 2>> /tmp/debug.log
    fi
done

# Method 2: Alternative approach - apply to current kitty instance
# kitty @ set-colors ~/.cache/wal/colors-kitty.conf 2>> /tmp/debug.log

echo "Script completed." >> /tmp/debug.log
