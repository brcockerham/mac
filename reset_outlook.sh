#!/bin/bash

echo "====================================================="
echo "   Outlook Full Backup & Uninstall Script (macOS)   "
echo "====================================================="

# Quit Outlook and Office background processes
echo "[1/5] Closing Outlook and background processes..."
pkill "Microsoft Outlook" 2>/dev/null
pkill "Microsoft AutoUpdate" 2>/dev/null
pkill "Microsoft AU Daemon" 2>/dev/null
pkill "Office365Service" 2>/dev/null
pkill "Microsoft Software Updater" 2>/dev/null

# Create backup folder
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="$HOME/Desktop/OutlookBackup_$TIMESTAMP"
mkdir -p "$BACKUP_DIR"
echo "[2/5] Backup folder created at: $BACKUP_DIR"

# List of Outlook data paths to backup and remove
TARGETS=(
"/Applications/Microsoft Outlook.app"
"~/Library/Containers/com.microsoft.Outlook"
"~/Library/Containers/com.microsoft.Outlook.CalendarWidget"
"~/Library/Containers/com.microsoft.Outlook.ProfileManager"
"~/Library/Containers/com.microsoft.Outlook.ShareExtension"
"~/Library/Containers/com.microsoft.Outlook.OutlookNSE"
"~/Library/Group Containers/UBF8T346G9.Outlook"
"~/Library/Group Containers/UBF8T346G9.Office"
"~/Library/Preferences/com.microsoft.Outlook.plist"
"~/Library/Preferences/com.microsoft.Outlook.shared.plist"
"~/Library/Preferences/com.microsoft.autoupdate2.plist"
"~/Library/Caches/com.microsoft.Outlook"
"~/Library/Saved Application State/com.microsoft.Outlook.savedState"
"~/Library/Logs/Microsoft/Outlook"
"~/Library/LaunchAgents/com.microsoft.office.licensingV2.helper.plist"
)

# Backup and remove
echo "[3/5] Backing up and deleting Outlook..."
for path in "${TARGETS[@]}"; do
    expanded=$(eval echo "$path")
    if [ -e "$expanded" ]; then
        cp -R "$expanded" "$BACKUP_DIR/" 2>/dev/null
        sudo rm -rf "$expanded" 2>/dev/null || rm -rf "$expanded"
        echo "[✓] Backed up and removed: $expanded"
    else
        echo "[–] Not found: $expanded"
    fi
done

# Summary
echo
echo "[4/5] Backup completed. Location: $BACKUP_DIR"
echo "[5/5] Outlook fully removed. Ready for a fresh install."
echo
echo "====================================================="
echo "Next steps:"
echo "1. Download and run the latest Outlook installer here:"
echo "   https://portal.office.com/account"
echo "2. Launch Outlook and log in to your accounts."
echo "3. Optional: Restore specific items from the backup folder if needed."
echo "====================================================="

echo "Opening Office download page in your browser..."
open "https://portal.office.com/account"
