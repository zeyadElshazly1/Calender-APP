# My Week ✨ — Setup Guide

## 1. Supabase setup (5 min)
1. Go to https://supabase.com and create a free account
2. Create a new project (free tier is fine)
3. Go to **SQL Editor** → paste the contents of `supabase-setup.sql` → click **Run**
4. Go to **Project Settings → API** and copy:
   - `Project URL`  (looks like https://xxxx.supabase.co)
   - `anon / public` key

## 2. Add your keys to the app
Open `index.html` and find these two lines near the bottom:
```
const SUPA_URL = 'YOUR_SUPABASE_URL';
const SUPA_KEY = 'YOUR_SUPABASE_ANON_KEY';
```
Replace them with your actual values. Save.

## 3. Deploy to GitHub Pages (free, permanent)
1. Create a new GitHub repo called `moms-planner` (public)
2. Upload ALL files in this folder:
   - index.html
   - manifest.json
   - sw.js
   - icon-192.png
   - icon-512.png
3. Go to repo **Settings → Pages → Source: main branch → Save**
4. Your app is live at: `https://YOUR_USERNAME.github.io/moms-planner`

## 4. Install on phone (like a real app)
**iPhone (Safari):**
1. Open the URL in Safari
2. Tap the Share button (square with arrow)
3. Tap "Add to Home Screen"
4. Tap "Add"
5. Done! App icon appears on home screen ✨

**Android (Chrome):**
1. Open the URL in Chrome
2. Tap the 3-dot menu → "Install app" or "Add to Home Screen"
3. Done!

## 5. Share with your mom
Send her the URL. She creates her own account with her email.
You create your own account. Data is 100% separate per user.

## Features
- ✅ Per-day task completion (tap each day square)
- 🎨 Color-coded tasks
- 🎯 Goal tracking with progress steps
- 📅 Full weekly calendar with time slots
- 🔔 Notifications when a slot time arrives
- 📡 Works offline — syncs when back online
- 🔥 Daily streak tracker
- 💾 Data saved to cloud — never lost
