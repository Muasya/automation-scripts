# debian 10

Oracle’s open-source and cross-platform VirtualBox is a  free and user-friendly virtualization platform especially for the desktop OS that allows you to create, run and manage guest OS on a single hardware. You can run several guest OS at the same time depending upon your system resources.

In this article, we will explain how you can install VirtualBox on a Debian OS both through the command-line and the graphical way. We have used Debian 10 for running the commands and procedures mentioned in this article.
Installing VirtualBox on Debian via command-line

In order to install VirtualBox in your system using the command-line Terminal, follow the below steps:

To open Terminal, click on the Activities tab in the top left corner of your desktop. Then by using the search bar that appears, search for the Terminal application by typing its keyword. When the Terminal icon appears, click on it to open.
1. Update the system

First, update your system’s repository index using the following command in Terminal:

```$ sudo apt update```

2. Import VirtualBox repository keys

Now import the GPG key for VirtualBox repository using the following command:

```$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -```

The above command should return OK which implies that the GPG key has been imported successfully and the VirtualBox package we are adding from this repository is going to be trusted by the system.

Import VirtualBox repository keys
3. Add the VirtualBox Repository

Now we can add the VirtualBox repository to our sources list. Run the following command in Terminal to do so:

```$ echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list```

After adding the VirtualBox repository to the sources list, we will need to update the system’s repository index. Run the following command in Terminal to do so:

```$ sudo apt update```

Add the VirtualBox Repository
4. Install VirtualBox

Now in order to install VirtualBox, run the following command in Terminal:

```$ sudo apt install virtualbox-6.0```

Install VirtualBoxAdvertisement

The system will ask for installation confirmation by providing you with Y/n option. Hit y to confirm and then the VirtualBox will be installed in your system.
5. Launch VirtualBox

Once installed, you can launch VirtualBox by searching it from the Applications list or by simply running the following command in Terminal:

```$ virtualbox```
`
Install VirtualBox Extension Pack
``` wget https://download.virtualbox.org/virtualbox/6.0.10/Oracle_VM_VirtualBox_Extension_Pack-6.0.10.vbox-extpack ```

Once the VirtualBox extension pack is downloaded, you can install it by running the following command in Terminal:

```$ sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.0.10.vbox-extpack```

The installation will be started and the following message will appear presenting you with the VirtualBox license terms and conditions. Hit y and then Enter to accept the terms and conditions. Once the installation is completed, you will see the message indicating the successful installation of the VirtualBox extension pack.
Uninstall VirtualBox Extension

Launch the VirtualBox either through UI or the command line. When it opens, go to Preferences.

Uninstall VirtualBox Extensions

Now from the Preferences view, go to the Extensions tab. Here you will see the VirtualBox extension listed in the extension packages. You can add or remove the entries from the list using the “+” and “–” buttons. To remove the VirtualBox extension, select it and click the “–” button.

Virtualbox on Debian

In case, you want to remove the extension package using the command line, run the following command:

```$ VBoxManage extpack uninstall "Oracle VM VirtualBox Extension Pack"```

VBox Manage command
Uninstall VirtualBox

In case, you want to uninstall VirtualBox installed via the above method, run the following command in Terminal:

```$ sudo apt-get remove virtualbox-6.0```

Uninstall VirtualBox

By running the above command, the un-installation process will be started. The system might provide you with Y/n option for continuing the un-installation process. Hit y and then Enter to continue and then the virtual box will be uninstalled from your system.

Now run the following command in Terminal to remove the dependencies that were installed along with the VirtualBox:

```$ sudo apt autoremove```

Installing VirtualBox on Debian via GUI

If you want to install VirtualBox via the GUI method, here is how you can do it:

1. Open the following link and download the package for your Linux distribution. Here we are downloading the package for Debian 10 system.

https://www.virtualbox.org/wiki/Linux_Downloads

The downloaded package will be saved to your Downloads directory by default.

2. Go to the Downloads directory using the Debian file manager. Right-click the VirtualBox .deb file and click Open With Other Application.
Download VirtualBox

3. Then from the Select Application dialog box, choose Software Install and click the Select button.
Choose Software Install

It will open the installer in the Debian Software Center. Click the Install button in order to install VirtualBox in your system.
Install

It will then prompt for authentication. Enter the password for the authorized user and click the Authenticate button. Now the installation will be started and you will see the following view with the progress bar showing the progress of the installation process.

Installing VirtualBox

Once the installation is finished, you will see the following view.

Remove VirtualBox
Uninstall VirtualBox

To uninstall VirtualBox via graphical way, open the folder containing the VirtualBox .deb file. Right-click the .deb file and select Open With Other Application. Then click on Software Install to open the file in Software Center. Here, you will see the Remove button as displayed in the above screenshot, click on it to uninstall VirtualBox from your system.

That is all there is to it! In this article, you have learned how to install VirtualBox in a Debian 10 operating system, now you can install any number of guest machines based on your system resources.

