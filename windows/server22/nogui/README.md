# The command below, will be use to create an ISO image with the content of the folder file.
#
#Linux
#
```
export PKR_VAR_password=''
export PKR_VAR_username=
export PKR_VAR_node=
export PKR_VAR_proxmox_url=https://xxx.xxx.xxx.xxx:8006/api2/json
export PKR_VAR_local_admin=
export PKR_VAR_local_pass=''
cd file
mkisofs -J -l -R -V "Label CD" -iso-level 4 -o templatewsgui22.iso .
# upload the iso into proxmox server
cd ..
```

#Windows
#
```
.\New-IsoFile.ps1
set PKR_VAR_password=''
set PKR_VAR_username=
set PKR_VAR_node=
set PKR_VAR_proxmox_url=https://xxx.xxx.xxx.xxx:8006/api2/json
set PKR_VAR_local_admin=
set PKR_VAR_local_pass=
cd file
New-IsoFile "Autounattend.xml","unattend.xml" -Path "templatewsgui22.iso"
# upload the iso into proxmox server
cd ..
```
#Packer
# add the variables below, before run it.
packer init .

packer validate .

packer build .
