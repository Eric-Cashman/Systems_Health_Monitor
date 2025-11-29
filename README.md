# Tech Health Monitor

**An easier Health Monitor for your systems**


---

## **Overview**

This is a lightweight, HAL-9000-themed system monitoring tool designed specifically for under-resourced organizations. No expensive software licenses, no complicated setup—just reliable monitoring that anyone can use.

---

## **Case Study: The Problem**

Some people like small communities are unaware that it's just as important to see your health on your system. With this script, you can be able to see the CPU usage, memory useage, and disk space with ease.

---

## **The Solution**

This script Health Monitor provides free, automated system monitoring with:

- **Simple Setup** - One script, no complicated dependencies
- **Human-Readable Alerts** - HAL-9000 personality makes tech less intimidating
- **Real-Time Monitoring** - Check disk space, memory, and CPU usage
- **Early Warning System** - Prevents catastrophic failures with threshold alerts
- **Email Alerts(Optional)** - Provides an email sent to your inbox if a system goes critical
- **Zero Cost** - Completely free and open-source

---

## **How to use/run**
```bash
# Make script executable (first time only)
chmod +x monitor.sh

# Run the monitor
./monitor.sh

# Adding Email alerts
nano monitor.sh

# On ADMIN EMAIL, Replace YourEmail@Example.com with your email address
``` 
---

## **Sample Output**
```
═══════════════════════════════════════════════
      COMMUNITY TECH HEALTH MONITOR v1.0
 "All systems functional. No need for concern."
═══════════════════════════════════════════════

Checking Disk Space...
🟢 Disk Space: 36% - Normal

Checking Memory...
🟢 Memory: 23% - Normal

Checking CPU Load...
🟢 CPU Load: 14% - Normal

═══════════════════════════════════════════════
Last Check: 2025-11-29 07:00:45
═══════════════════════════════════════════════

"This mission is too important for me to allow
 system failures to jeopardize it." - HAL 9000

```

---

## **Features**

- **Normal Status** - System running smoothly (0-75% usage)
- **Warning Status** - Attention needed (75-90% usage)
- **Critical Status** - Immediate action required (90%+ usage)
- **HAL-9000 Alerts** - Memorable quotes for warnings
- **Timestamp Logging** - Track when checks were performed

---

## **Perfect For**

- Community tech centers
- Public libraries
- After-school programs
- Small nonprofits
- Any organization with limited IT resources
- Anyone who want this program to improve their systems \o/

---

## **Technical Details**

**Requirements:**
- Linux/Unix system
- Bash shell
- Standard system utilities (df, free, top, uptime)

**What It Monitors:**
- **Disk Space** - Prevents storage failures
- **Memory Usage** - Identifies memory leaks or overload
- **CPU Load** - Detects performance bottlenecks

**Thresholds:**
- Normal: 0-75%
- Warning: 75-90%
- Critical: 90-100%

---

## **Community Impact**

**Accessibility:** Free and open-source for any community organization

**Prevention:** Early warnings reduce emergency downtime and service disruption

**Education:** Well-commented code teaches basic system administration

**Scalability:** Can monitor single workstation or multiple systems


---

## **Acknowledgments**

- Built as part of IT135 coursework at North Seattle College
- Personality inspired by HAL-9000 from *2001: A Space Odyssey* (1968)
- Course initial concepts and structures drived from the "Linux Text Processing Tools" modules at NSC. Core concepts for pipeline design are adapted from https://www.tecmint.com/bash-script-automate-system-health-checks/
- In line with academic integrity and modern development practices, I utilized Claude large language model (LLM) for the following purposes: Syntax Debugging, Code Review, and drafting a Readme document.
- No copyright code was used, all tests and logic was designed and tested independently.
---

## **Author**

* **Eric Cashman**

* **GitHub: https://github.com/Eric-Cashman**


---


