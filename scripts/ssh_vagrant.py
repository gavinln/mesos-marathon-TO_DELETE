''' This program connects to the vagrant virtual machine and should be
run from the root directory of the project. It assumes that Git has been
installed and uses the Git ssh executable to connect to the virtual machine
'''
import subprocess
import os
import _winreg
import sys
from collections import namedtuple


def here():
    return os.path.abspath(os.path.dirname(__file__))


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


def getGitDir():
    name = 'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Git_is1'
    with _winreg.OpenKey(_winreg.HKEY_LOCAL_MACHINE, name) as key:
        value, valueType = _winreg.QueryValueEx(key, 'InstallLocation')
        return value
    return None


def getVagrantSSH():
    output, err = call_command_shell(['vagrant', 'ssh-config'])
    lines = output.split(os.linesep)
    lines = [line.strip() for line in lines]
    paramNames = ['HostName ', 'Port ', 'User ', 'IdentityFile ']

    paramValues = [None] * len(paramNames)
    for line in lines:
        for index, param in enumerate(paramNames):
            if line.startswith(param):
                paramValues[index] = line[len(param):].strip()
                break
    ParamSSH = namedtuple('ParamSSH', ['host', 'port', 'username', 'keyFile'])
    # remove quotes for filename
    paramValues[3] = paramValues[3].replace('"', '')
    return ParamSSH._make(paramValues)


def getGitSsh(gitDir):
    return os.path.join(gitDir, 'bin', 'ssh.exe')


def checkStatusVM():
    ''' prints error message and exits if VM not running '''
    output, err = call_command_shell(['vagrant', 'status'])
    lines = output.split(os.linesep)
    for line in lines:
        line = line.strip()
        if line.startswith('default'):
            if line.find('running') >= 0:
                pass
            else:
                sys.exit('Type "vagrant up" to start VM before connecting')


def checkCwd():
    ''' returns error message if current directory does not contain
        a .vagrant file
    '''
    cwd = os.getcwd()
    if not os.path.exists(os.path.join(cwd, '.vagrant')):
        sys.exit('Should be run from directory containing .vagrant file')


def main():
    checkCwd()
    checkStatusVM()
    gitDir = getGitDir()
    gitExe = getGitSsh(gitDir)
    paramSSH = getVagrantSSH()
    cmd = ['"%s"' % gitExe, '-p', paramSSH.port, '-i', paramSSH.keyFile,
           '%s@%s' % (paramSSH.username, paramSSH.host),
           '-t', 'cd /home/vagrant;bash --login'
           ]
    os.system(' '.join(cmd))

if __name__ == "__main__":
    main()
