Information and Notes to use Vault

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




Resource
https://www.digitalocean.com/community/tutorials/how-to-use-vault-to-protect-sensitive-ansible-data-on-ubuntu-16-04

https://symfonycasts.com/screencast/ansible/variable-vault












