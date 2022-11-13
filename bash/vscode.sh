Material Icon Theme

{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch Package",
            "type": "go",
            "request": "launch",
            "mode": "auto",
            "sudo": true,
            "program": "${workspaceFolder}/test3.go"
        }
    ]
}

launch.json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch Package",
            "type": "go",
            "request": "launch",
            "mode": "debug",
            "host": "127.0.0.1",    //this line code 
            "port": 2345, //2345 can be any unused port 
            "program": "${workspaceFolder}/main.go"
        }
    ]
}

sudo <go/bin directory>/dlv-dap dap -l='127.0.0.1:2345' --only-same-user=false
sudo /home/ubuntu/go/bin/dlv-dap dap -l='127.0.0.1:2345' --only-same-user=false --check-go-version=false

sudo ln -s /usr/local/go/bin/go /usr/bin/go

/home/ubuntu/go/bin

check-go-version=false
i

sudo ln -s /usr/local/go/bin/go  /root/go/src/github.com/fornax/vendor/k8s.io/klog/v2

sudo ln -s /usr/local/go/bin/src/k8s.io/klog/v2  /root/go/src/github.com/fornax/vendor/k8s.io/klog/v2

sudo ln -s /usr/src/k8s.io/klog/v2  /root/go/src/github.com/fornax/vendor/k8s.io/klog

sudo ln -s /root/go/src/github.com/fornax/vendor/k8s.io/klog/v2 /usr/src/k8s.io/klog/v2

=========================================
Remote Access Setup in Visual Studio Code
=========================================

- Launch a vm (instance) on AWS
       - Launch a ubuntu vm on AWS (default setting)
       - Generate a RSA key pair or reuse the existing key pair
       - Download the private key
       - Suggest moving the key under 'C:\Users\<username>\.ssh\', otherwise may cause issues when connecting
- Install remote support package 'Remote Development'
       - Open Visual Studio Code (VSC) locally
       - Click 'Extensions' on the left navigation menu
       - Search 'Remote Development'
       - Click 'Install'
       - 'Remote Explorer' icon appears after installation
- Configure SSH connections
       - Click 'Remote Explorer' icon on the left navigation menu
       - Select 'SSH Targets' under the dropdown menu in the side bar window
       - Click the gear icon (Configure) next to 'SSH TARGETS'
       - In the pop-up bar, select 'C:\Users\<username>\.ssh\config'
       - The config file appears in the right editor area
       - Fill in the following information
              Host <alias>
                    HostName <Public IPv4 DNS of the vm on AWS>
                    User <username>
                    IdentityFile <full dir of the private key>
- Connect to the remote vm
       - Click 'Connect to host in New Window' in the side bar window
       - In the new window, select 'Linux' in the pop-up bar, select 'Continue'
       - Click 'New Terminal' under 'Terminal' tab on the menu bar
       - Now you have a terminal which ssh into the remote vm
- Install GO packages on the remote vm
       - Run 'sudo apt-get -y update; sudo apt-get -y install build-essential'
       - Run 'curl -LO https://go.dev/dl/go1.17.6.linux-amd64.tar.gz'
       - Run 'sudo tar -C /usr/local -xvf go1.17.6.linux-amd64.tar.gz'
       - Append 'export PATH=$PATH:/usr/local/go/bin' to ~/.profile
       - Run 'source ~/.profile'
- Install GO support packages on the remote vm
       - Click 'Extensions' on the left navigation menu
       - Search 'Go'
       - Click 'Go' package
       - Click 'Install in SSH:<remote_vm_alias>'
       - Press F1, search ''Go: Install/Update Tools'
       - Select all packages, click 'OK'
- Test code
