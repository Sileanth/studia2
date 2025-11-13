ansible hosts -m ping -i ./inventory.ini 


 ansible hosts -i ./inventory.ini -m ansible.builtin.apt -a "name=nginx state=present" -b 
 ansible hosts -i ./inventory.ini -m ansible.builtin.service -a "name=nginx state=started enabled=yes" -b 


ansible hosts -i ./inventory.ini -m ansible.builtin.setup


ansible hosts -i inventory.ini -m ansible.builtin.service -a "name=nginx state=stopped enabled=no" --become
 ansible hosts -i ./inventory.ini -m ansible.builtin.apt -a "name=nginx state=absent autoremove=yes" -b 



