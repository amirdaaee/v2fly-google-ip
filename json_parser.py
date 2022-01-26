import json
from os import environ

JSON_FILE = environ['JSON_FILE']
TEXT_IPV4_FILE = environ['TEXT_IPV4_FILE']
TEXT_IPV6_FILE = environ['TEXT_IPV6_FILE']

with open(JSON_FILE, encoding='utf8') as f_:
    json_file = json.load(f_)
ipv4 = []
ipv6 = []
for i_ in json_file['prefixes']:
    for k_, v_ in i_.items():
        if k_ == 'ipv4Prefix':
            ipv4.append(v_)
        elif k_ == 'ipv6Prefix':
            ipv6.append(v_)
file_set = [
    {
        'file': TEXT_IPV4_FILE,
        'data': ipv4
    },
    {
        'file': TEXT_IPV6_FILE,
        'data': ipv6
    },
]
for file in file_set:
    with open(file['file'], 'w', encoding='utf8') as f_:
        f_.write('\n'.join(file['data']))
