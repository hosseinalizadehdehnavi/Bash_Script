# **Root Directory Usage Cleaner**  

This script monitors the disk usage of the root (`/`) directory and automatically frees up space if it exceeds a specified threshold.  

## **How It Works**  

1. **Checks disk usage** of the root (`/`) directory.  
2. If usage exceeds the defined **threshold (85%)**, it:  
   - **Clears Docker container logs** (`*.log` files in `/var/lib/docker/containers/`).  
   - **Runs `docker system prune`** to remove unused containers, images, and volumes.  
3. The script is scheduled to run **every hour** via `cron`.  

## **Installation & Setup**  

### **1. Clone the Repository**  
```bash
git clone git@github.com:hosseinalizadehdehnavi/Bash_Script.git
cd Root_Dir_Usage_Cleaner
```

### **2. Make the Script Executable**  
```bash
chmod +x check_root_usage.sh
```

### **3. Add to Crontab (Scheduled Execution)**  
To run the script **every hour**, add this line to your crontab (`crontab -e`):  
```bash
0 * * * * /opt/devops/clean_root_usage/check_root_usage.sh
```

## **Configuration**  

- The default **threshold** for disk usage is `85%`.  
- You can modify the `THRESHOLD` variable in `check_root_usage.sh` to change it:  
  ```bash
  THRESHOLD=90  # Change threshold to 90%
  ```

## **Warnings & Notes**  

- **Data Loss Risk**: Running `docker system prune -a` removes **all unused Docker images and containers**. Use with caution.  
- **Requires Root Privileges**: The script should be executed as **root or with sudo**.  
- **Docker Installation**: Ensure Docker is installed before running the script.  
