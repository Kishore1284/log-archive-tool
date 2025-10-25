A simple CLI tool to archive logs from a directory into a compressed tar.gz file with timestamping.

Project URL- https://roadmap.sh/projects/log-archive-tool

# Make the script executable
chmod +x log-archive.sh

# Run the tool
./log-archive.sh <log-directory>
# Log Archive Tool

A simple CLI tool to archive logs from any directory on Linux systems.  
This tool compresses logs into timestamped `.tar.gz` files, stores them in a dedicated archive directory, and logs the archive operations.

---

## Features

- Compress logs from any directory into a `.tar.gz` archive.
- Automatically store archives in `~/log_archives`.
- Logs the archive date and time in `archive_log.txt`.
- Skips unreadable files without stopping the process.
- Works with or without `sudo`.

---

## Requirements

- Linux/Unix-based system
- Bash shell
- `tar` command installed (usually pre-installed on Linux)

---

## Usage

### Make the script executable

```bash
chmod +x log-archive.sh
