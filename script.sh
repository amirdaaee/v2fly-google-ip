export JSON_FILE=data/goog.json
export TEXT_IPV4_FILE=data/ipv4.txt
export TEXT_IPV6_FILE=data/ipv6.txt
mkdir -p ./data
wget -O $JSON_FILE https://www.gstatic.com/ipranges/goog.json
python3 json_parser.py
export ASSUME_NO_MOVING_GC_UNSAFE_RISK_IT_WITH=go1.21
go install -v github.com/v2fly/geoip@43aa8a7f3e2ca86f5a3dc4408a5523a5fe8abb1d
${GOBIN:-$HOME/go/bin}/geoip