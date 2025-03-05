# **System Service Monitor & Rocket.Chat Notifier**  

This **Bash script** continuously monitors the status of **system services** and sends real-time notifications to a **Rocket.Chat channel** whenever a service's status changes (e.g., from `active` to `failed`).  

## **Features**  

- Monitors all system services using `systemctl`.  
- Detects **status changes** of services.  
- Sends **real-time notifications** to a **Rocket.Chat webhook**.  
- Uses an **associative array** to track previous service states.  

## **How It Works**  

1. The script initializes an associative array to store the previous status of each service.  
2. It continuously loops through all services, checking their current status using `systemctl is-active`.  
3. If a service's status changes (e.g., `active` → `failed`), a **notification is sent** to Rocket.Chat.  
4. The notification includes a **timestamp, service name, and status change details**.  

## **Setup & Installation**  

### **1. Clone the Repository**  
```bash
git clone git@github.com:hosseinalizadehdehnavi/Bash_Script.git
cd Services_Monitoring
```

### **2. Make the Script Executable**  
```bash
chmod +x service_monitor.sh
```

### **3. Update the Webhook URL**  
Modify the `WEBHOOK` variable inside `monitor_services.sh` with your Rocket.Chat webhook URL:  
```bash
WEBHOOK="http://your-rocket-chat-url/hooks/your-webhook-id"
```

### **4. Run the Script**  
```bash
./service_monitor.sh &
```

## **Example Notification Sent to Rocket.Chat**  

```
2025/03/04 12:30:45 - 'nginx' service changed from 'active' to 'failed'
```

## **Customization**  

- Modify the **notification format** by editing the `MESSAGE` variable in the script.  
- Adjust the **check interval** by modifying the `sleep` duration in the loop.  

## **Potential Enhancements**  

- Add **support for other notification services** (e.g., Slack, Telegram).  
- Implement a **configuration file** for customizable settings.  
- Include a **whitelist/blacklist** feature to monitor specific services.  
