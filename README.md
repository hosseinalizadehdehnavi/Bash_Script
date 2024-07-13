#This Bash script is designed to monitor the status of system services and send notifications to a Rocket.Chat channel whenever a service's status changes.
#It uses the systemctl command to check the status of services and an associative array to keep track of previous statuses. When a service's status changes, the script sends a message to a specified Rocket.Chat webhook.
#Note: You can substitute any other webhook for Chat Rocket.
