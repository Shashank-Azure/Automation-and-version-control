clear
#Installing git
sudo apt update #updating the package list
sudo apt install git -y #installing Git
git --version #verifying the installation of Git
clear
#Installation of Powershell Core
sudo apt-get update && sudo apt-get install -y wget apt-transport-https software-properties-common #installing the dependencies
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - #Downloading Microsoft GPG key
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" #Register the Microsoft Ubuntu Repository
sudo apt-get update && sudo apt-get install -y powershell #Installing Powershell
pwsh --version #verify the installation
clear
git clone https://github.com/Shashank-Azure/Automation-and-version-control.git ## Cloning Git repository
clear
#cloning Git Repository
git clone https://github.com/Shashank-Azure/Automation-and-version-control.git
clear
git clone https://github.com/Shashank-Azure/Automation-and-version-control.git
clear
#cloning Git repo
git clone https://github.com/Shashank-Azure/Automation-and-version-control.git
clear
#Cloning Git repository
git clone https://github.com/Shashank-Azure/Automation-and-version-control.git
#Navigating into the clone directory
cd azure-automation-scripts
mkdir azure-automation-scripts
#created a directory
#Navigating into the directory
cd azure-automation-scripts
# Basic Linux Commands
mkdir Basic-Linux-Commands
# To create a new directory
ls 
# to list out all the files and directories within specified directories
pwd
#displaying the fullpath of the current working directory.
vim file1.txt
# to create files inside a directory
cp file1.txt file2.txt
# create a copy of "file1.txt" named "file2.txt"
mv file1.txt new_file1.txt
# renaming "file1.txt" to "new_file1.txt"
cat new_file1.txt
#to display the content of new_file1.txt
nano file3.txt
# this is also to create file- ctrl O to save and ctrl x to exit
rm file3.txt
rm new_file1.txt
# to remove file from the directory
sudo
clear
#Creating Powershell scripts
vm.ps1 #Virtual machine Powershell script
clear
# creating powershell scripts for resources
vim vm.ps1 # virtual machine script
vim storage.ps1 # storage account
vim NSG.ps1 #network security group
vim storage.ps1
clear
connect-AzAccount
clear
Connect-AzAccount -UseDeviceAuthentication
Az 
Az -version
clear
Install-Module -Name Az -AllowClobber -Scope CurrentUser
Import-Module Az
wsh
pwsh
clear
ls
clear
Connect-AzAccount -Identity
clear
pwsh ./vm.ps1
pwsh ./storage.ps1
pwsh ./NSG.ps1
clear
pwsh
clear
Connect-AzAccount -UseDeviceAuthentication
clear
pwsh
clear
rm NSG.ps1 -f
rm storage.ps1 -f
rm vm.ps1 -f
ls
clear
vim vm.ps1
ls
rm vm.ps1
ls
clear
vim vm.ps1
vim storage.ps1
vim NSg.ps1
pwsh
clear
ls
rm NSg.ps1 -f
rm storage.ps1 -f
rm vm.ps1 -f
ls
clear
vim vm.ps1
pwsh
clear
ls
rm storage.ps1 vm.ps1 webapp.ps1
ls
rm NSG.ps1
clear
vim vm.ps1
vim storage.ps1
vim NSG.ps1
vim index.html
vim 404.html
pwd
ls
pwsh
clear
pwsh
clear
git add . # adding scripts to the staging area
clear
git init
git add
clear
git init
git add .
clear
git init #intialized git 
git add *.ps1 #adding all the files ending with.ps1
git commit -m "Adding all the Powershell scripts"
git remote add origin https://github.com/Shashank-Azure/Automation-and-version-control.git # Connecting to the remote repository
git push -u origin main #pushing remote repo
git branch -m master main  # Rename 'master' to 'main'
git push -u origin main
git branch -m master main  # Rename 'master' to 'main'
git push -u origin main
clear
git init
git add *.ps1
git commit -m "Add PowerShell scripts"
git remote add origin https://github.com/Shashank-Azure/Automation-and-version-control.git
clear
git push -u origin main
clear
git push -u origin main
clear
git push -u origin main
clear
git pull origin main
git push origin main
git config pull.rebase false
git pull origin main
git push origin main
git config pull.rebase true
git pull origin main
clear
git pull origin main
git push --force-with-lease origin main
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch <file_path>' --prune-empty --tag-name-filter cat -- --all
git push --force-with-lease origin main
clear
rm -rf .git
git config --global --edit
clear
ls
git init
ls
clear
git init
git add vm.ps1
git commit -m " Adding Vm pwsh file"
git remote add origin https://github.com/Shashank-Azure/Automation-and-version-control.git
Shashank-Azure
git push -u origin main
git push
git push origin main
git help config
clear
cd/home/Shashankpnaidu
clear
cd
cd /home
cd /Shashankpnaidu
pwsh
clear
ls
vim vm.ps1
