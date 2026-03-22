# Docker Quick Start Cheat Sheet (OSCP / OffSec Tools)

Perfect for one-off tools like Backdoor-Factory, Veil, etc.  
Copy-paste friendly for your GitHub notes.

## 1. Setup (Do Once)

```bash
# Fix "permission denied" forever (no more sudo)
sudo usermod -aG docker $USER

# LOG OUT and log back in (or reboot) — mandatory!
```

**Temporary fix only:**  
`sudo docker <command>`

## 2. Pulling Images

```bash
docker pull image/name:tag          # e.g. secretsquirrel/the-backdoor-factory
docker images                       # list all images
docker pull image/name:latest       # force latest
```

## 3. Running Containers (Most Important Section)

### Basic (what you probably started with)
```bash
docker run -it image/name bash
```

### Recommended: One-off usage (auto-delete + file sync)
```bash
mkdir -p ~/my-tool-files
docker run --rm -it --name mytool \
  -v ~/my-tool-files:/data \
  image/name bash
```

**Inside container:**
- Work in `/data` folder
- All files auto-sync to `~/my-tool-files` on your host

### Other useful flags

| Flag              | Purpose                              | Example |
|-------------------|--------------------------------------|---------|
| `--rm`            | Auto-delete container on exit        | Always use for one-off tools |
| `-v host:path:container:path` | Mount folder for file transfer | `-v ~/backdoor-files:/data` |
| `--name mytool`   | Give container a name                | Easier than random ID |
| `-p 8080:80`      | Port forwarding                      | For web tools |
| `--privileged`    | Full host access (rare)              | Only if needed |

## 4. File Transfer

### Method 1: Volume Mount (Best — already mounted)
```bash
# On host (second terminal)
cp ~/Downloads/binary.exe ~/my-tool-files/

# Inside container
ls /data                    # file appears instantly
```

### Method 2: docker cp (no volume needed)
```bash
# Find container
docker ps

# Copy in
docker cp /host/path/to/file.exe container-name-or-id:/data/

# Copy out
docker cp container-name-or-id:/data/patched.exe ~/Downloads/
```

## 5. Managing Containers

```bash
docker ps                   # running only
docker ps -a                # all (running + stopped)
docker start container-name
docker stop container-name
docker exec -it container-name bash     # attach shell
docker start -ai container-name         # re-attach original shell
```

## 6. Cleanup

```bash
# Delete specific container
docker rm -f container-name-or-id

# Delete image
docker rmi image/name

# Delete ALL unused stuff (safe)
docker system prune -a

# Delete everything (nuclear)
docker system prune -a --volumes
```

## 7. Common Pitfalls & Fixes

| Problem | Cause | Fix |
|---------|-------|-----|
| `permission denied` (docker.sock) | Not in docker group | `sudo usermod -aG docker $USER` + logout |
| "Can't find my container" | No `--rm` + exited | `docker ps -a` → `docker start -ai <name>` |
| Files disappear on exit | No volume mount | Add `-v ~/folder:/data` and use `--rm` |
| Container still exists after exit | Forgot `--rm` | `docker rm -f $(docker ps -a -q)` |
| `./tool.py` not found | Wrong working dir | `ls` or `find / -name tool.py 2>/dev/null` |
| Changes lost | No volume mount | Always mount a host folder |
| Old image cached | Want fresh copy | `docker rmi image/name` then pull again |

## 8. Best Practices for OSCP Tools

```bash
# Golden one-liner template (copy-paste & edit)
mkdir -p ~/tool-files
docker run --rm -it --name toolname \
  -v ~/tool-files:/data \
  image/name bash
```

- Always use `--rm` for tools you run once
- Always mount a volume (`-v`) for file transfer
- Never work in the container's default directory — use `/data`
- Keep a second terminal open for `cp` commands
- After `exit`, your files are safe in `~/tool-files`

## Bonus: Quick Restart Same Container (if you didn't use --rm)

```bash
docker start -ai $(docker ps -a -q -f name=mytool)
```
