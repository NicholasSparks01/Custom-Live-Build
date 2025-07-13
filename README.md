# Custom Debian Live (Reverse Engineering + Daily Use Build)

## 🧬 Overview

This project is a **custom Debian Live-Build** designed for:
- 🔍 Reverse Engineering
- 🛡️ Vulnerability Research
- 🧪 Security-Focused R&D
- 💻 Comfortable Daily Use

Built on top of **Debian Stable** (Bookworm... currently), this live environment provides a modern and stable KDE Plasma Desktop and hand-curated tools that aid in security research, analysis, and everyday computing tasks.

---

## 🎯 Project Goals

- Provide a stable, fast, and modern KDE desktop environment.
- Equip the system with essential reverse engineering and binary analysis tools.
- Optimize the system for researchers, analysts, and developers.
- Maintain transparency: Every package has a clear purpose.
- Ensure a live ISO can serve as both a daily driver and a portable analysis workstation.

---

## 📝 Philosophy

- ***Minimal but complete:** Every tool must earn its place.
  - Avoiding the b.s. Kali approach of "install everything, stability later".
- **Research-sentric:** Prioritizing tools that assist in understanding niche areas.
- **Justified choices:** Each tool included has a documented reason. See `tools.md` (comming soon).
- **Stable core:** Debian base with optional access to cutting-edge tools through backports and custom packaging.

---

## 🏗️ Build Instructions

> Prerequisites: Debian-based host with `live-build`, `xorriso`, and `debootstrap`.

```bash
sudo apt install live-build
git clone https://github.com/your-username/debian-reverse-live.git
cd debian-reverse-live
sudo chmod +x auto/*
sudo lb build
```
