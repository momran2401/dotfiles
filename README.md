# Assignment 7

![Assignment 7](https://github.com/PGE383-HPC/assignment7/actions/workflows/main.yml/badge.svg)

This purpose of this assignment is to setup your own personal `dotfiles`
repository such that your own settings and customizations can be used across
all future Codespaces on Github.

I've recorded a YouTube video that walks you through all the steps of this
assignment.

https://youtu.be/asnPcPp4XoU

## Instructions

1. Create a new repository associated with your personal Github account
   (**NOT**
   the [PGE383-HPC](https://github.com/PGE383-HPC) organization).  You can do
   this by clicking the `+` in the upper right hand side of your Github account
   and select "[New repository](https://github.com/new)".  Name the repository
   exactly `dotfiles`, make sure it is a "public" repository, leave all the
   other settings unchanged, and click "Create repository".

1. Open a Codespace associated your [assignment6](https://github.com/PGE383-HPC/assignment6).  In a Terminal window, execute the following command

   ```bash
   ssh-keygen -t ed25519 -C "<your email address>"
   ```

   where `<your email address>` is replaced with your actual email address.
   Preferably the one you used to sign up for Github.  There will be
   several prompts, leave all the defaults unchanged and continue to hit
   "Enter/Return" until you are back at the normal Terminal command prompt.

   Next, run

   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```

   at the Terminal command prompt.  You should see a string that starts with
   `ssh-ed25519` and is followed by a long series of random characters and
   finally ending with the email address you entered in the previous step.
   Copy this entire string (Ctrl/Cmd-C or highlight and right-click then
   "Copy").

1. Return to the `dotfiles` repo you created in Step 1.  Click "Settings", then
   "Deploy Keys" from the menu on the left.  Paste the string you copied in
   Step 2 to the "Key" box.  You must also give the key a title, the name is
   somewhat arbitrary, but I might suggest "assignment6-deploy".  Ensure that
   the "Allow write access" box is checked.  Click "Add Key" followed by your
   Github password if prompted.

   The purpose of this is to allow us to push from the [assignment6](https://github.com/PGE383-HPC/assignment6)
   repository to our newly created `dotfiles` repository.

   Finally, return to your `dotfiles` repository homepage and copy the **SSH**
   URL.

1. Return to the running [assignment6](https://github.com/PGE383-HPC/assignment6) Codespace.  From the Terminal, execute the following commands

   ```bash
   git rm -rf .devcontainer .github src test Project.toml Manifest.toml
   git commit -am "Remove unneeded files"
   git remote set-url origin git@github.com:<your github username>/dotfiles.git
   ```

   where `<your github username>` is replaced with your actual Github username
   in the last command. Then run

   ```bash
   git push origin master
   ```

   followed by typing `yes` at the prompt.  This will push a copy of your [assignment6](https://github.com/PGE383-HPC/assignment6)
   repository to the new `dotfiles` repository on Github.  You should be able
   to refresh your browser window and see the files from [assignment6](https://github.com/PGE383-HPC/assignment6)
   now in your `dotfiles` repository.

1. Finally, go to your Github account "Settings" (click the upper rightmost
   profile icon, followed by "Settings").  Then using the menu on the left,
   navigate to "Codespaces", check the "Automatically install dotfiles" box and
   select your dotfiles repository from the dropdown box.

1. Finally, in order for the above steps to be graded, you'll need to submit a new
   commit to this repository.  The easiest way to do that is to make a small
   change to this file and make a commit.  For example, you could delete the
   following line:

   `delete me`

   and make a commit and push to Github.

From now on, the `dotfiles` repository is yours, feel free to add aliases and other
useful commands and settings as you see fit.

## Testing

There are no local tests for this assignment, the only way to test is to make
a commit, push to Github, and look for the green check mark status indicator.

If, by chance, you already have a `dotfiles` repository in your Github account,
simply make sure that the bash alias `alias lla="ls -la"` is somewhere in your
`.bashrc` file, make a commit to this repository for testing.
