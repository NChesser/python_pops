import subprocess

from concurrent.futures import ThreadPoolExecutor
from timer_decorator import timer

HOST_TYPE = 250 * ['192.168.2.181']

def health_check(host):
    # ssh to host and run
    commands = subprocess.check_output('cat commands.sh', shell=True)

    ssh = subprocess.Popen(['ssh', host, commands],
                            shell=False,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE)
    
    print(ssh.stdout.readlines())

    return ssh.stdout.readlines()

@timer
def main():
    # gather hosts
    hosts = [host for host in HOST_TYPE]

    with ThreadPoolExecutor() as executor:
        for host, result in zip(hosts, executor.map(health_check, hosts)):
            # print result to log file / files
            print(75 * '-')

if __name__ == "__main__":
    # test using threadPool - takes about 4 seconds to run
    main()