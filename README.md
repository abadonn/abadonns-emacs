abadonns-emacs
==============

This is not really a project but merely an attempt to unify all my emacs settings.
I would like to create a personal tool suitable for my development but hopefully it can help others too.
My main dev languages are Python and PHP with bits of HTML, CSS and JS so I would like to focus on features supporting their syntax.

General settings:
- Programming languages syntax highlight
- Autocomplete for language syntax as well as defined entities
- using 4 spaces for indentation. No one likes TABs so there's no reason for me to use them either.
- Display current column and line number
- Ads newline character if not present already
- Highlight parentheses and add them automatically

Requirements:
Of course basic requirement is to install git, emacs and goodies so on debian do:
sudo apt-get install git
sudo apt-get install python-virtualenv


then clone this repo wherever you feel like and creat symbolic link in your home dir to emacs like this:
ln -s path/to/cloned/repo/emacs ~/.emacs
cd ~/emacs.d/
ln -s path/to/cloned/repo/lib .
