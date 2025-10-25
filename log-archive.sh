#!/bin/bash

# -------------------------------
# Log Archive Tool (Improved)
# -------------------------------
# Usage: sudo ./log-archive.sh <log-directory>
# Compresses all readable logs and stores them in a timestamped tar.gz archive in the user's home directory.
# -------------------------------

# Check if directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR="$1"

# Check if directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory $LOG_DIR does not exist."
    exit 1
fi

# Determine archive directory in the original user's home
if [ "$SUDO_USER" ]; then
    # Running with sudo, use original user's home
    USER_HOME=$(eval echo "~$SUDO_USER")
else
    USER_HOME="$HOME"
fi

ARCHIVE_DIR="$USER_HOME/log_archives"
mkdir -p "$ARCHIVE_DIR"

# Create timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Archive filename
ARCHIVE_FILE="$ARCHIVE_DIR/logs_archive_$TIMESTAMP.tar.gz"

# Compress logs, ignore unreadable files
tar -czf "$ARCHIVE_FILE" -C "$LOG_DIR" . --ignore-failed-read

# Log the archive action
echo "Archived $LOG_DIR to $ARCHIVE_FILE on $(date)" >> "$ARCHIVE_DIR/archive_log.txt"

echo "Logs have been archived to $ARCHIVE_FILE"

