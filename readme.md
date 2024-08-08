





# Overview

These are installation instructions and scripts for deploying a STEREO application on a WHM-based VPS via rsync.

The script will run STEREO's build process (`npm run build`), then use rsync to add new/updated files, delete removed files (keeping the default WHM/CP & SSL files), and set permissions on the added files (644) & directories (755) on the VPS.

This solution assumes a standard WHM/cPanel setup (using Apache, PHP managed by EA/MultiPHP, etc), and is specifically intended for MY servers. These concepts _could_ be adapted for general use by other stacks, but YMMV if you're not me.




# A - Server prep

Before installing, make sure you have set up the following with cPanel:

- 1 - cPanel user with SSH access (for the whole cpanel account, site owner or whatever)
  - 1a - (optional) SSH keys - I personally like to have an SSH key saved locally so I'm not prompted for a password
    - Do this as root to copy from another site:
    - ```mv /home/example/.ssh /home/example/.ssh_bk``` _(extremely optional)_
    - ```cp -R /home/othersite/.ssh /home/example```
    - ```chown -R example:example /home/example/.ssh```
  - Otherwise you'll want to generate and install SSH keys both on the server and your local machine [(example here)](https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/)

- 2 - Root domain (`example.com`) or whatever subdomains (`staging.example.com`, `dev.example.com`, etc)
  - Note the docroots for your domain (to use in the config below)
  - Probably a good idea to choose "Force HTTPS Redirect" on the cPanel Domains screen.
  - Also in cPanel - "optimize website" / enable compression









# B - Installation - Local machine

1 - In the root of your STEREO application, add the local deploy script (and add to .gitignore):
```
curl https://raw.githubusercontent.com/jyoungblood/0x00-stereo-deploy/master/deploy.sh -o deploy.sh && echo "/deploy.sh" >> .gitignore
```

2 - Edit `deploy.sh` to add your SSH login info, STEREO site path, and deployment path. After editing, make sure the script is executable:
```
chmod +x deploy.sh
```




# C - Usage

If everything has been set up correctly, you should be able to run the deployment script locally and watch as the process unfolds:
```
./deploy.sh
```

If you run into any problems at this point, it's because you've done something wrong and god is mad at you. If it all worked, then that's great! 

Either way, it's time for a smoke break 🚬


