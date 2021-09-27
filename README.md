## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

!(diagrams/Web_VM_Diagram.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above, or alternatively select portions of the VNSetup_Ansible_Playbook.txt file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly stable, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the metrics and system logs.

The configuration details of each machine may be found below.


| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    | DVWA Host| 10.0.0.10  | Linux            |
| Web-2    | DVWA Host| 10.0.0.11  | Linux            |
| Web-3    | DVWA Host| 10.0.0.12  | Linux            |
| RedElk   | Monitor  | 10.1.0.4   | Linux            |
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
24.6.27.133

Machines within the network can only be accessed by SSH connections from the Ansible container within Jump Box.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | No                  | 24.6.27.133          |
| Web-1/2/3| No                  | 10.0.0.4             |
| RedElk   | No                  | 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because mistakes can be made. A script can be modified to perfection before use.

The playbook implements the following tasks:
- Downloads, installs and configures Docker on every VM on both networks
- Downloads and installs DVWA, Metricbeat, and Filebeat on the Web machines
- Downloads and installs a Docker container for Elk on the Elk machine

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/docker_ps_output.jpg)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
10.0.0.10 (Web-1)
10.0.0.11 (Web-2)
10.0.0.12 (Web-3)

We have installed the following Beats on these machines:
Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
Filebeat allows us to collect logs produced by the system like errors or authorization attempts, while Metricbeats allows us to monitor things like CPU usage, network load, memory usage, and inbound/outbound requests.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the vn-setup file to /etc/ansible
- Update the hosts file to include "[Internal-IP of desired machine] ansible_python_interpreter=/usr/bin/python3" within the section titled [webservers]
- Run the playbook, and navigate to "http://[Public-IP of ElkVM]:5601/app/kibana" to check that the installation worked as expected.
