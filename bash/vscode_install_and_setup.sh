#install and setup link
https://learn.microsoft.com/en-us/azure/developer/go/configure-visual-studio-code

1. Install Go
Follow these steps to install Go:

In a web browser, go to go.dev/doc/install.
Download the version for your operating system.
Once downloaded, run the installer.
Open a command prompt, then run go version to confirm Go was installed.
2. Install Visual Studio Code
Follow these steps to install Visual Studio Code:

In a web browser, go to code.visualstudio.com.
Download the version for your operating system, supports Windows, Linux, and macOS.
Once downloaded, run the installer. This will only take a minute.
3. Install the Go extension
Instructions	Screenshot
In Visual Studio Code, bring up the Extensions view by clicking on the Extensions icon in the Activity Bar. Or use keyboard shortcut (Ctrl+Shift+X).	A screenshot showing how search for the Go extension.
Search for the Go extension, then select install.	A screenshot showing how to use the search box in the top tool bar to find App Services in Azure.
4. Update the Go tools
Instructions	Screenshot
In Visual Studio Code, open Command Palette's Help > Show All Commands. Or use the keyboard shortcut (Ctrl+Shift+P)	A screenshot showing how search the Command Palette.
Search for Go: Install/Update tools then run the command from the pallet	A screenshot showing how to run the Go: install/update tool from the command pallet.
When prompted, select all the available Go tools then click OK.	A screenshot showing how to update all the available Go tools.
Wait for the Go tools to finish updating.	A screenshot showing all the Go tools that were updated.
5. Write a sample Go program
Instructions	Screenshot
In Visual Studio Code, open the folder where you'll create the root directory of your Go application. To open the folder, click the Explorer icon in the Activity Bar then click Open Folder.	A screenshot showing how to create a new folder.
Click New Folder in the Explorer panel, then Create the root director for your sample Go application named sample-app	A screenshot showing how to create a folder in vs code.
Click New File in the Explorer panel, then name the file main.go	A screenshot showing how to create a file in vs code.
Open a terminal, Terminal > New Terminal, then run the command go mod init sample-app to initialize your sample Go app.	A screenshot running the go mod init command.
Copy the following code into the main.go file.	A screenshot displaying a sample Go program.
Sample code:

Go

Copy
package main

import "fmt"

func main() {
    name := "Go Developers"
    fmt.Println("Azure for", name)
}
6. Run the debugger
Instructions	Screenshot
Create a break point on line 7 by left clicking to the left of the numbered line. Or place your cursor on line 7 and hit F9.	A screenshot showing how to set a breakpoint.
Bring up the Debug view by clicking on the debug icon in the Activity Bar on the side of Visual Studio Code. Or use keyboard shortcut (Ctrl+Shift+D).	A screenshot showing how to navigate to the debug panel.
Click Run and Debug, or hit F5 to run the debugger. Then Hover over the variable name on line 7 to see its value. Exit the debugger by clicking Continue on the debugger bar or hit F5.

Material Icon Theme
# install go and have a debug, your can use F1 -> Go Extension
Rich Go language support for Visual Studio Code

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
