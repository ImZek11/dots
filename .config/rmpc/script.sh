#!/usr/bin/fish

# NOTIFICATIONS
set -l TMP_DIR "/tmp/rmpc"

# Ensure the directory is created
mkdir -p "$TMP_DIR"

# Where to temporarily store the album art received from rmpc
set -l ALBUM_ART_PATH "$TMP_DIR/notification_cover"

# Path to fallback album art if no album art is found by rmpc/mpd
# Change this to your needs
set -l DEFAULT_ALBUM_ART_PATH "$TMP_DIR/default_album_art.jpg"

# Save album art of the currently playing song to a file
if not rmpc albumart --output "$ALBUM_ART_PATH"
    # Use default album art if rmpc returns non-zero exit code
    set ALBUM_ART_PATH "$DEFAULT_ALBUM_ART_PATH"
end

# Send the notification
notify-send "Now Playing" "$ARTIST - $TITLE" --app-name rmpc
