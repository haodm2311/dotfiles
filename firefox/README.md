### Steps to customize Firefox
1. Download latest or your preferred Firefox version.
2. Type `about:config` in Firefox search bar, then set `toolkit.legacyUserProfileCustomizations.stylesheets` to "True" for your custom themes to work.
3. You can find your profile folder by writing `about:support` in URL bar and using `Open folder` in `Profile` folder section.
4. Copy `chrome` folder from Github and paste it in your Profile.

#### How to change Firefox's wallpaper into your favorites ?
- Replace `wallpaper.jpg` in `dotfiles/firefox/chrome/ASSETS/wallpaper/`, and make sure that the file name = `wallpaper` and file type = `jpg`.
- You can use you favorite wallpapper or those I already provided in `dotfiles/wallpaper/`.

---

## Automated install script

I included a small script to copy the `chrome` folder into your Firefox profile(s) and enable user stylesheets.

Usage:

Run for all profiles:

```
bash firefox/install_firefox_config.sh
```

Run for a single profile (use the folder name shown in `~/Library/Application Support/Firefox/Profiles`):

```
bash firefox/install_firefox_config.sh your-profile-folder.default
```

The script will copy files from this repo's `firefox/chrome/` into each profile's `chrome/` and will create or update `user.js` with:

```
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
```

If you'd like, I can run the script for you (it will modify your Firefox profile folders). Just tell me which profile to target or confirm running for all profiles.
