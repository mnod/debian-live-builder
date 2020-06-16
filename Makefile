list-instances:
	./ec2.py --list

stack-create-dryrun:
	ansible-playbook --syntax-check stack_create.playbook
	ansible-playbook --list-tasks stack_create.playbook
	ansible-playbook -i /dev/null --check --diff -e @extra_vars.json stack_create.playbook

stack-create:
	ansible-playbook -i /dev/null --diff -e @extra_vars.json stack_create.playbook

stack-terminate-dryrun:
	ansible-playbook --syntax-check stack_terminate.playbook
	ansible-playbook --list-tasks stack_terminate.playbook
	ansible-playbook -i /dev/null --check --diff -e @extra_vars.json stack_terminate.playbook

stack-terminate:
	ansible-playbook -i /dev/null --diff -e @extra_vars.json stack_terminate.playbook

build-debianlive-dryrun:
	ansible-playbook --syntax-check debianlive.yml
	ansible-playbook --list-tasks debianlive.yml
	ansible-playbook -i ec2.py --check --diff -e @extra_vars.json debianlive.playbook

build-debianlive:
	ansible-playbook -i ec2.py --diff -e @extra_vars.json debianlive.playbook
