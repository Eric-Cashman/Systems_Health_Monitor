#!/bin/bash
# Systems Health Monitor
# A system monitoring tool for nonprofits and community organizations
# Uses HAL-9000 personality for alerts, and offers logging and Email Alerts

# ============ CONFIG ============
LOGFILE="$HOME/monitor.log"
ADMIN_EMAIL="youremail@example.com"

RED="\033[1;31m"
YELLOW="\033[1;33m"
GREEN="\033[1;32m"
RESET="\033[0m"
# ================================

echo "═══════════════════════════════════════════════"
echo "           SYSTEMS HEALTH MONITOR v1.0"
echo " \"All systems functional. No need for concern.\""
echo "═══════════════════════════════════════════════"
echo ""

# Get current date and time
CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S")

# ================== Disk Check ==================
echo "Checking Disk Space..."
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ $DISK_USAGE -gt 90 ]; then
    echo -e "${RED}🔴 Disk Space: ${DISK_USAGE}% - CRITICAL${RESET}"
    echo "   \"I'm sorry Dave, I'm afraid the disk is nearly full.\""
    echo -e "${RED}CRITICAL ALERT: Disk usage at ${DISK_USAGE}%" | mail -s "HAL-9000 ALERT: Disk Critical" "$ADMIN_EMAIL${RESET}"
elif [ $DISK_USAGE -gt 75 ]; then
    echo -e "${YELLOW}🟡 Disk Space: ${DISK_USAGE}% - WARNING${RESET}"
    echo "   \"Dave, we're approaching disk capacity limits.\""
else
    echo -e "${GREEN}🟢 Disk Space: ${DISK_USAGE}% - Normal${RESET}"
fi

echo ""

# ================== Memory Check ==================
echo "Checking Memory..."
MEMORY_USAGE=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')

if [ $MEMORY_USAGE -gt 90 ]; then
    echo -e "${RED}🔴 Memory: ${MEMORY_USAGE}% - CRITICAL${RESET}"
    echo -e  "${RED}CRITICAL ALERT: Memory usage at ${MEMORY_USAGE}%" | mail -s "HAL-9000 ALERT: Memory Critical" "$ADMIN_EMAIL${RESET}"
    echo "   \"Memory resources are critically low, Dave.\""
elif [ $MEMORY_USAGE -gt 75 ]; then
    echo -e "${YELLOW}🟡 Memory: ${MEMORY_USAGE}% - WARNING${RESET}"
    echo "   \"I'm monitoring memory usage carefully, Dave.\""
else
    echo -e "${GREEN}🟢 Memory: ${MEMORY_USAGE}% - Normal${RESET}"
fi

echo ""

# ================== CPU Check ==================
echo "Checking CPU Load..."
CPU_PERCENT=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_PERCENT=${CPU_PERCENT%.*} 

if [ $CPU_PERCENT -gt 90 ]; then
    echo -e "${RED}🔴 CPU Load: ${CPU_PERCENT}% - CRITICAL${RESET}"
    echo "   \"Dave, the processor is under extreme stress.\""
    echo -e  "${RED}CRITICAL ALERT: CPU load at ${CPU_PERCENT}%" | mail -s "HAL-9000 ALERT: CPU Critical" "$ADMIN_EMAIL${RESET}"
elif [ $CPU_PERCENT -gt 75 ]; then
    echo -e "${YELLOW}🟡 CPU Load: ${CPU_PERCENT}% - WARNING${RESET}"
    echo "   \"I'm detecting elevated CPU activity, Dave.\""
else
    echo -e "${GREEN}🟢 CPU Load: ${CPU_PERCENT}% - Normal${RESET}"
fi

echo ""

# ============== Logging ==============
echo "[$CURRENT_TIME] Disk: ${DISK_USAGE}%, Mem: ${MEMORY_USAGE}%, CPU: ${CPU_PERCENT}%" >> "$LOGFILE"

echo "═══════════════════════════════════════════════"
echo "Last Check: $CURRENT_TIME"
echo "═══════════════════════════════════════════════"
echo ""
echo "\"This mission is too important for me to allow"
echo " system failures to jeopardize it.\" - HAL 9000"
echo ""
