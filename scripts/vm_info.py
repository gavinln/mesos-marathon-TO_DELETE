''' This program uses Oracle's VirtualBox command line tools to display VM
information. It should be run from the root directory of the project.
'''
import subprocess
import os
import _winreg
import json
import ConfigParser
import StringIO



# VBoxManage showvminfo e38ff153-82e0-4a55-86dd-2063a1071fb9 --machinereadable | findstr Forward
# .vagrant\machines\default\virtualbox\id

def call_command(command):
    process = subprocess.Popen(command,
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE)
    return process.communicate()


def call_command_shell(command):
    process = subprocess.Popen(command,
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE,
                               shell=True)
    return process.communicate()


def getVirtalBoxDir():
    keyName = r'SOFTWARE\Oracle\VirtualBox'
    with _winreg.OpenKey(_winreg.HKEY_LOCAL_MACHINE, keyName, 0,
                         _winreg.KEY_READ | _winreg.KEY_WOW64_64KEY) as key:
        value, valueType = _winreg.QueryValueEx(key, 'InstallDir')
        return value
    return None


def getVMuuid():
    idFile = r'.vagrant\machines\default\virtualbox\id'
    idFullFile = os.path.join(os.getcwd(), idFile)
    # TODO: add check for file existing
    return open(idFullFile, 'r').read()


def main():
    virtualBoxDir = getVirtalBoxDir()
    cmd = [os.path.join(virtualBoxDir, 'VBoxManage.exe'),
           'showvminfo', getVMuuid(), '--machinereadable']
    #cmd = [os.path.join(virtualBoxDir, 'VBoxManage.exe'),
    #        '--nologo', 'guestproperty', 'get', getVMuuid(),
    #        '/VirtualBox/GuestInfo/Net/1/V4/IP']
    output, err = call_command(cmd)
    configFile = StringIO.StringIO(output)
    config = ConfigParser.SafeConfigParser()
    config.readfp(configFile)


# If machine is not running
# VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$i,tcp,,$i,,$i";

# If machine is running
#VBoxManage controlvm 7ff9c70f-f3fb-471f-ac3e-eded15d07daa natpf1 "tcp-port2,tcp,,9002,,9002
#VBoxManage showvminfo 7ff9c70f-f3fb-471f-ac3e-eded15d07daa --machinereadable | grep Forward

if __name__ == "__main__":
    main()

