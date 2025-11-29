#!/bin/bash
# Community Tech Health Monitor
# A system monitoring tool for nonprofits and community organizations
# Uses HAL-9000 personality for alerts

echo "═══════════════════════════════════════════════"
echo "   COMMUNITY TECH HEALTH MONITOR v1.0"
echo "   \"All systems functional. No need for concern.\""
echo "═══════════════════════════════════════════════"
echo ""

# Get current date and time
CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S")

# Check Disk Space
echo "🔍 Checking Disk Space..."
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ $DISK_USAGE -gt 90 ]; then
    echo "🔴 Disk Space: ${DISK_USAGE}% - CRITICAL"
    echo "   \"I'm sorry Dave, I'm afraid the disk is nearly full.\""
elif [ $DISK_USAGE -gt 75 ]; then
    echo "🟡 Disk Space: ${DISK_USAGE}% - WARNING"
    echo "   \"Dave, we're approaching disk capacity limits.\""
else
    echo "🟢 Disk Space: ${DISK_USAGE}% - Normal"
fi

echo ""

# Check Memory Usage
echo "🔍 Checking Memory..."
MEMORY_USAGE=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')

if [ $MEMORY_USAGE -gt 90 ]; then
    echo "🔴 Memory: ${MEMORY_USAGE}% - CRITICAL"
    echo "   \"Memory resources are critically low, Dave.\""
elif [ $MEMORY_USAGE -gt 75 ]; then
    echo "🟡 Memory: ${MEMORY_USAGE}% - WARNING"
    echo "   \"I'm monitoring memory usage carefully, Dave.\""
else
    echo "🟢 Memory: ${MEMORY_USAGE}% - Normal"
fi

echo ""

echo "🔍 Checking CPU Load..."
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
CPU_PERCENT=${CPU_USAGE%.*}

if [ $CPU_PERCENT -gt 90 ]; then
    echo "🔴 CPU Load: ${CPU_PERCENT}% - CRITICAL"
    echo "   \"Dave, the processor is under extreme stress.\""
elif [ $CPU_PERCENT -gt 75 ]; then
    echo "🟡 CPU Load: ${CPU_PERCENT}% - WARNING"
    echo "   \"I'm detecting elevated CPU activity, Dave.\""
else
    echo "🟢 CPU Load: ${CPU_PERCENT}% - Normal"
fi

echo ""
echo "═══════════════════════════════════════════════"
echo "Last Check: $CURRENT_TIME"
echo "═══════════════════════════════════════════════"
echo ""
echo "\"This mission is too important for me to allow"
echo " system failures to jeopardize it.\" - HAL 9000"
echo ""
