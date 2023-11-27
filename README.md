# Ansible
Ansible (RHCE) PlayBook Run on workstation 
# creating an Inventory file on control node 
# using $vim inventory 
  [A]
  servera
  
  [B]
  serverb
  
  [prod]
  serverb
  serverc
  
  [Balancers]
  serverd
  
  [Sudarshan:children]

# creating an ansible.cfg file for control node user to give the priority in pwd.
  inventory=/home/student/sudarshan/ansible/inventory
  remote_user=devops

  [privilege_escalation]
  become=True
  become_method=sudo
  become_user=root
  become_ask_pass=False

# create an First playbook using Automation tool ansible
[root@workstation ansible]# cat sudarshan.yml
  ---
  - name: Creating an playbook play1
    hosts: all
    become: yes
    tasks:
      - name: Creating an groups
        group:
          name: "{{ item }}"
          state: present
        loop:
          - sdgroup
          - rdgroups
          - ngpgroups
        when: inventory_hostname in groups['dev'] or inventory_hostname in groups['test']
      - name: sdgroups users
        user:
          name: "{{ item }}"
          state: present
          groups: sdgroups
          append: yes
  
        loop:
          - sudarshan
          - ajay
          - vijay
        when: inventory_hostname in groups['A'] or inventory_hostname in groups['B']
