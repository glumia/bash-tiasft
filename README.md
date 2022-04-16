[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/glumia/bash-tiasft)](https://github.com/glumia/bash-tiasft/releases)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)


# bash-tiasft

`bash-tiasft` (I know, what an unpronounceable name) loads your aliases and reminds
you about them when you type a command that could have been abbreviated.

## Install
First things first, set up [bash-preexec](https://github.com/rcaloras/bash-preexec).

Then download `bash-tiasft.sh` and source it in your `.bashrc` **before
bash-preexec**.

### Step by step
Download `bash-tiasft.sh` and place it in your home directory:
```bash
curl https://raw.githubusercontent.com/glumia/bash-tiasft/master/bash-tiasft.sh -o ~/.bash-tiasft.sh
```

Now add `[[ -r ~/.bash-tiasft.sh ]] && source ~/.bash-tiasft.sh` in your `.bashrc`.

This is how it should look like:
```bash
# Activate Bash-Tiasft
[[ -r ~/.bash-tiasft.sh ]] && source ~/.bash-tiasft.sh

# Activate Bash-Preexec (https://github.com/rcaloras/bash-preexec)
[[ -r ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
```

## Usage
Define some aliases, eg:
```bash
alias gcd='git checkout develop'
alias gcm='git checkout master'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
```

Now use the command line as usual. If you type a command that could have been
abbreviated with an alias, bash-tiasft will suggest it for the next time:
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
You can run tests with [bats](https://github.com/bats-core/bats-core).
```
~/bash-tiasft$ bats test/
 ✓ should match a shortcut
 ✓ should match the most powerful shortcut
 ✓ should not import if it's already defined
 ✓ should import if not defined

4 tests, 0 failures

```


## Acknowledgments
- Thanks to the people of [bash-preexec](https://github.com/rcaloras/bash-preexec) for
  this utility!
