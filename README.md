# Global Protect Up/Dn (gp)

A bash script for MacOS that can deactivate and re-activate Global Protect.

## Installation

Clone this repo.  Note: probably global protect needs to be disabled

```bash
git clone git@github.com:jmfife/globalprotectupdn.git
```

Make sure you have a place to keep scripts that is in PATH, e.g. in `/Users/<user_id>/bin`.  If you don't have it already:

```bash
mkdir ~/bin
echo "export PATH=\"\$HOME/bin:\$PATH\"" >> ~/.zshrc
````

Install gp there. 

```bash
cp globalprotectupdn/gp ~/bin
chmod +x globalprotectupdn/gp
````

## Usage:

```bash
gp [-h] [up|dn]
```

## Options:

     -h       Display this help message

## Commands:

     up       Activate Global Protect
     dn       De-Activate Global Protect

## Example:

```bash
gp up
````
