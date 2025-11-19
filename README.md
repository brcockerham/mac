# 🛠 Outlook Reset Guide for Mac

Follow these steps to reset Outlook on your Mac safely.

---

## Step 1: Enable Full Disk Access for Terminal
1. Open **Mac Settings**  
2. Go to **Privacy and Security**  
3. Click **Full Disk Access**  
4. Make sure **Terminal** is toggled **ON**

---

## Step 2: Copy and Run the Reset Script
Copy the following command exactly:

`bash
curl -fsSL https://raw.githubusercontent.com/brcockerham/mac/refs/heads/main/reset_outlook.sh -o ~/Desktop/outlook-reset-backup.sh && chmod +x ~/Desktop/outlook-reset-backup.sh && ~/Desktop/outlook-reset-backup.sh
`

1. **Open Terminal** on your computer.  
2. **Paste the command above** into Terminal, then press **Enter**.  
   - Enter your password when prompted (it will not show as you type, but type carefully).  
3. **Wait** for the script to finish running until it displays **Next Steps**.

---

## Download and Install Outlook

1. Go to the [Microsoft Account Office page](https://portal.office.com/account).  
2. Log in if you are not already signed in.  
3. Click **Install Office**.  
4. If prompted, **Download Unverified file**.  
5. Once the download completes, **run the installer**.  

---

## Sign in to Outlook

- Open Outlook and **sign in** with your account credentials.

---

## Alternative: Use Outlook on the Web

If the above steps do not work, you can access Outlook in your browser:  
[https://outlook.office.com/mail/](https://outlook.office.com/mail/)
