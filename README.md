# vagrant-zeusminer
A vagrant setup for running a Zeusminer Blizzard / GAW Fury scrypt miner.

### Mapping the USB Device to the VM

We need to create the VM, and then halt it so we can map the USB mining device.

```
$ vagrant up --provision
$ vagrant halt
```

At this point, you'll need to launch the VirtualBox application and go to the settings pane for the "vagrant-zeusminer" VM.

Go to the `Ports` tab and then the `USB` sub-tab. Check the box to `Enable USB controller` and then click the `+` icon to the right of `USB Device Filters` list. Choose the `Silicon Labs CP2102 USB to UART Bridge Controller` device.

Boot up the VM again:
```
$ vagrant up
```

### Running the Miner

```
./mine -h HOST -u USERNAME -p PASSWORD
```
