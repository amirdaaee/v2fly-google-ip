pushd $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export JSON_FILE=data/goog.json
export TEXT_IPV4_FILE=data/ipv4.txt
export TEXT_IPV6_FILE=data/ipv6.txt
mkdir -p ./data
wget -O $JSON_FILE https://www.gstatic.com/ipranges/goog.json
python3 json_parser.py
go install -v github.com/v2fly/geoip@latest
geoip
popd