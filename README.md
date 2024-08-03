# Moduler Terrraform Template
Terraform Template to quickly provision AWS virtual infrastructure in a modular pattern 

## Features

1. **VPC Creation**: Sets up a Virtual Private Cloud (VPC) with a public subnet, including the necessary networking infrastructure such as route tables and internet gateway.

2. **IAM Roles Creation**: Defines an instance role with permissions tailored for development tasks, including the ability to change instance names, make Route53 changes, and manage EC2 instances through Systems Manager (SSM).

3. **EC2 Instance Provisioning [For testing the template]**: Launches an EC2 instance within the VPC and associates the networking infrastructure. The instance is configured with the previously created instance role.

## SSH Access with VSCode
After Terraform provisions the EC2 instance, an SSH configuration file will be generated locally on your machine. Here's how you can SSH into the instance using Visual Studio Code (VSCode):

1. **Wait for Terraform to Complete**: Ensure that Terraform has finished provisioning the EC2 instance before attempting to SSH into it.

2. **Locate the SSH Configuration File**: The SSH configuration file will be generated in the same directory where you ran the Terraform commands. It will be named according to your host OS (e.g., `windows-ssh-config` for Windows or `linux-ssh-config` for Linux).

3. **Open VSCode**: Launch Visual Studio Code on your machine.

4. **Open the Command Palette**: Press `Ctrl + Shift + P` (Windows/Linux) or `Cmd + Shift + P` (macOS) to open the command palette.

5. **Search for Remote-SSH**: In the command palette, start typing "Remote-SSH" and select "Remote-SSH: Connect to Host..." from the dropdown list.

6. **Choose the configured SSH host**: Another dropdown list with configured hosts will appear. The public IP of the host that was just provisioned will be in that list select it.

7. **Connect to Host**: VSCode will attempt to connect to the EC2 instance using the SSH configuration provided in the selected file. If successful, it will open a new VSCode window with a SSH session to the EC2 instance.