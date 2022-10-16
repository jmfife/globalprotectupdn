# Global Protect Up/Dn (gp)

A bash script for MacOS that can be used to disable and re-enable Global Protect.  (Based on a solution from https://kb.mc3.edu/article.php?id=11457)

## Installation

Clone this repo.  Note: probably global protect needs to be disabled from the UI before you can access GitHub, which in itself dempostrates why this kind of command line tool is useful!

```bash
git clone git@github.com:jmfife/globalprotectupdn.git
```

Make sure you have a place to keep scripts that is in PATH, e.g. in `/Users/<user_id>/bin`.  If you don't have it already:

```bash
mkdir ~/bin
echo "export PATH=\"\$HOME/bin:\$PATH\"" >> ~/.zshrc
```

Install gp there. 

```bash
cp globalprotectupdn/gp ~/bin
chmod +x ~/bin/gp
```

Now you can remove the Git repo if you like.

```bash
rm -rf globalprotectupdn
```

## Usage:

```bash
gp [-h] [up|dn]
```

## Options:

     -h       Display help message

## Commands:

     up       Activate Global Protect
     dn       De-Activate Global Protect

## Example:

```
% gp
GP Enabled
% gp dn
Disabling Global Protect
% gp
GP Disabled
% gp up
Re-Enabling Global Protect
% gp
GP Enabled
```
