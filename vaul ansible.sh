Information and Notes to use Vault

Summary: vault to encrypt data for my need I only need encrypt the password from clear text to Ansible
The following example will show how will see:

ansible_network_os: cisco.ios.ios
ansible_user: admin
ansible_password: cisco
 
##########################################################################################

ansible_network_os: cisco.ios.ios
ansible_user: admin
ansible_password: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          62386336616663366561323533623435353861323230383865623434316663373831353463393536
          6164653336643530346263656433663264666366623735340a623361623564656265313962363531
          35313433653337346462323439346435653464623961336338663662323231326230373935313264
          6465313738353364370a343333646537616230333139643330386462306566343433373861313664
          3961
 
Before we encrypt the data we need create a strong password and storage that in safe location like ~/.ansible/.vault_key
After we have or secure password it would be acceptable to also edit the permission access to only be access to a secure group
After we have the .vault_key we need edit the ansible.cfg "vault_password_file = ~/.ansible/.vault_key" and after we have this-
the proccess will be automatic to encrypt and dencrypt


1. never store the your vault key in github "lol"

Step 1
# Save your password in secure location
# Example password cisco or use Generator key
home/potasio/.vault_key

Step2
# Change permission of the file
# Notes Ansible user should be able to read the files
# chmod 600
-rw-------- home/potasio/.vault_key

Step3
# Examples
# Create a file
Encrypt File
nano info.txt 

# To encrypt the file "info.txt" use following command
# Manually
ansible-vault encrypt info.txt
New Vault password: "cisco"
Confirm New Vault password: "cisco"
Encrypt successful

# Decrypt
##########   Command ############           |   path  | | Document |
ansible-vault Decrypt --vault-password-file ~/.vault_key info.txt
check the File

# To encrypt the file "info.txt" use following command
# Using the ~/.vault_key
ansible-vault encrypt --vault-password-file ~/.vault_key info.txt


#Edit
# To encrypt the file "info.txt" use following command
# Using the ~/.vault_key
ansible-vault edit --vault-password-file ~/.vault_key info.txt



#view
#This command will view the document like cat
ansible-vault view --vault-password-file ~/.vault_key info.txt


#Playbook and Vault#
#declaring vault in the playbook or groups_var or host_vars

vars_files:
  - vaultley.yml # pwd vault location
Calling a vagrant{{ secrets.key1}}

#create vault key
ansible-vault create vaultley.yml 
secrets:
  key1: abc123 #pw
  key2: def456 #apikey

# see the vault file
ansible-vault view vaultley.yml
password:

# edit
ansible-vault edit vaultley.yml

# Rekey the password
ansible-vault rekey vaultley.yml



# ansible.cfg
# If set, configures the path to the Vault password file as an alternative to
# specifying --vault-password-file on the command line.
vault_password_file = /etc/ansible/ansible-cisco/lab-ansible/vault-pass


Resource
https://www.digitalocean.com/community/tutorials/how-to-use-vault-to-protect-sensitive-ansible-data-on-ubuntu-16-04

https://symfonycasts.com/screencast/ansible/variable-vault












