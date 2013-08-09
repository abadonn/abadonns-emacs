abadonns-emacs
==============

This is not really a project but merely an attempt to unify all my emacs settings.
I would like to create a personal tool suitable for my development but hopefully it can help others too.
My main dev languages are PHP and Python with bits of HTML, CSS and JS so I would like to focus on features supporting their syntax.

General settings
- using 2 spaces for indentation. No one likes TABs so there's no reason for me to use them either.
- Ads newline character if not present already

Requirements
Of course basic requirement is to install git, emacs and goodies so on debian do:
sudo apt-get install emacs23-nox
sudo apt-get install emacs-goodies-el
sudo apt-get install git

then clone this repo wherever you feel like and creat symbolic link in your home dir to emacs like this:
ln -s path/to/cloned/repo/emacs .emacs

TODO
- Ensure single and only one newline character is left in buffer after save.
- Highlight all tabs and rubbish characters
- PHP mode
- Python mode
- CSS mode
- HTML mode
