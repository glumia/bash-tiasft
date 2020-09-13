[![Build Status](https://travis-ci.com/glumia/bash-tiasft.svg?branch=master)](https://travis-ci.com/github/glumia/bash-tiasft)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)


# Bash-Tiasft
*Bash - There is a shortcut for that!*

Suggests shortcuts for commands for which an alias is defined.  
Useful if you've defined new aliases for commands you use often and need
to build muscle memory for them.

## Install
First things first, install [Bash-Preexec](https://github.com/rcaloras/bash-preexec).

Then pull down the script and add it to your bash profile/configuration (i.e
~/.bashrc, ~/.profile, ~/.bash_profile, etc). **It must be imported before
Bash-Preexec in your bash profile.**

### Step by step
Pull down Bash-Tiasft and place it in your home directory
```bash
curl https://raw.githubusercontent.com/glumia/bash-tiasft/master/bash-tiasft.sh -o ~/.bash-tiasft.sh
```

Now add the following line in your our bash profile (e.g. ~/.bashrc,
~/.profile, or ~/.bash_profile).
```
[[ -f ~/.bash-tiasft.sh ]] && source ~/.bash-tiasft.sh
```

This is how the end of your bash profile should look like:
```
$ tail -n7 .bashrc
# Activate Bash-Tiasft
[[ -f ~/.bash-tiasft.sh ]] && source ~/.bash-tiasft.sh

# Activate Bash-Preexec (https://github.com/rcaloras/bash-preexec)
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

```

## Usage
Define some aliases, eg:
```bash
alias gcd='git checkout develop'
alias gcm='git checkout master'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
```

Now just give your commands as usual, if you forget you have a shortcut for
a command bash-tiasft will suggest it to you for the next time:
```
$ git commit --amend --no-edit
There is a shortcut for that!
    alias gcan='git commit --amend --no-edit'

[master 239a721] Add todo list
 Date: Sat Sep 12 19:09:59 2020 +0200
 1 file changed, 9 insertions(+)
 create mode 100644 TODO.md
$
$
$ gcan
[master b0972e3] Add todo list
 Date: Sat Sep 12 19:09:59 2020 +0200
 1 file changed, 9 insertions(+)
 create mode 100644 TODO.md
```

## Tests
You can run tests using [Bats](https://github.com/bats-core/bats-core).
```bash
bats test
```
Should output something like:
```
$ bats test/
 ✓ should match a shortcut
 ✓ should match the most powerful shortcut
 ✓ should not import if it's already defined
 ✓ should import if not defined

4 tests, 0 failures
```


## Acknowledgments
Thanks to the people behind [Bash-Preexec](https://github.com/rcaloras/bash-preexec)
for their wonderful utility!
