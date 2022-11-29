https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-10#3-download-ubuntu

https://learn.microsoft.com/en-us/windows/wsl/install

wsl --install

wsl --list --online

wsl --install -d <DistroName>

wsl --install -d Ubuntu-20.04

Ubuntu-20.04    Ubuntu 20.04 LTS

Install WSL 2 on Windows 10
First we need to enable WSL and Virtualization on the machine by running the following commands:

	dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
	dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
	Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart



Then, reboot your machine.

Download the kernel patch for WSL 2 by following the link here:  https://aka.ms/wsl2kernel, and get it installed.

Finally, enable WSL 2 as default:

	wsl --set-default-version 2

Resources
https://www.omgubuntu.co.uk/how-to-install-wsl2-on-windows-10
