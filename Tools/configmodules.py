#!/usr/local/bin/python
script = open('configmodules.sh', 'w')
modules = open('gitmodules.config', 'r')

script.write('#!/usr/local/bin/bash\n')

configInfo = modules.readlines()
i = 0
while i < len(configInfo):

    location = configInfo[i + 1][8:].replace('\r', '').replace('\n', '')
    remote = configInfo[i + 2][7:].replace('\r', '').replace('\n', '')
    script.write('git submodule add ' + remote + ' ' + location + '\n')
    print('git submodule add ' + remote + ' ' + location)
    i += 3