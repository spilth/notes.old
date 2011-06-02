# Git

> Git is a free & open source, distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

## Configuration

### Set Name and Email Address

	$ git config --global user.name "Your Name"
	$ git config --global user.email "yourname@yourdomain.com"

### Set Colors

	$ git config color.ui true

## General Commands

### Create a Repository

	$ mkdir project
	$ cd project
	$ git init

### Ignore Files or Directories

Create `.gitignore` and add file and directory globs:

	dist
	tmp
	log
	.DS_Store

### See List of Changed Files

	$ git status
	
### See Difference of Files

	$ git diff

### Stage Files for Committing

	$ git add foo.txt
	$ git add bar.txt

### Unstage a File

	$ git reset HEAD bar.txt

### See Differences of Staged Files

	$ git diff --cached
	
### Commit Staged Files

	$ commit -m "Your Message Here"

### Revert a Changed File

	$ git checkout name/of/file
	
## Remote Repositories

### Show List of Remote Repositories

	$ git remote
	
### Add a Remote Repository

	$ git remote add <remoteName> <url>
	
### Remote a Remote Repository

	$ git remote rm <remoteName>
	
### Rename a Remote Repository

	$ git remote rename <oldRemoteName> <newRemoteName>

### Push to a Remote Repository

	$ git push <remoteName> <branchName>
