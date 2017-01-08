#!/bin/sh

#git checkout
function gitCheckout() {
         stty erase ^H
         echo -n "What is the branch name"?
         stty echo
         read var1
         git checkout ${var1}
}
alias git-c=gitCheckout

# git checkout -b 
function gitCheckoutBranch() {
         stty erase ^H
         echo -n "What is the new branch name for checkout?"
         stty echo
         read var1
         git checkout -b ${var1}
}
alias git-c-b=gitCheckoutBranch

#git pull
function gitPull() {
        stty erase ^H
        echo -n "What is the remote repository name?"
        stty echo
        read var1
        git pull origin ${var1}
}
alias git-p=gitPull

#git update
function gitUpdate() {
	git add .;
        git commit -m '[update]';
        git push origin master;
}
alias git-update=gitUpdate

#git set
function gitSet() {
      stty erase ^H
      echo -n "What file name do you add?"
      read -r var1
      git add ${var1}
      git commit
      echo -n "What is the branch name?"
      read var3
      stty echo
      git push origin ${var3}
}
alias git-set=gitSet
