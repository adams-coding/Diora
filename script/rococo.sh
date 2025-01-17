#!/bin/bash

chainSpecVersion='
{
  "id": "rococo_2.0"
}'

newBalance='
{
  "balances": [
    [
      "5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY",
      1000000000000000000000
    ],
    [
      "5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty",
      1000000000000000000000
    ],
    [
      "5FLSigC9HGRKVhB9FiEo4Y3koPsNmBmLJbpXg2mp1hXcS59Y",
      1000000000000000000000
    ],
    [
      "5DAAnrj7VHTznn2AWBemMuyBwZWs6FNFjdyVXUeYum3PTXFy",
      1000000000000000000000
    ],
    [
      "5HGjWAeFDfFCWPsjFQdVV2Msvz2XtMktvgocEZcCj68kUMaw",
      1000000000000000000000
    ],
    [
      "5CiPPseXPECbkjWCa6MnjNokrgYjMqmKndv2rSnekmSK2DjL",
      1000000000000000000000
    ],
    [
      "5GNJqTPyNqANBkUVMN1LPPrxXnFouWXoe2wNSmmEoLctxiZY",
      1000000000000000000000
    ],
    [
      "5HpG9w8EBLe5XCrbczpwq5TSXvedjrBGCwqxK1iQ7qUsSWFc",
      1000000000000000000000
    ],
    [
      "5Ck5SLSHYac6WFt5UZRSsdJjwmpSZq85fd5TRNAdZQVzEAPT",
      1000000000000000000000
    ],
    [
      "5HKPmK9GYtE1PSLsS1qiYU9xQ9Si1NcEhdeCq9sw5bqu4ns8",
      1000000000000000000000
    ],
    [
      "5FCfAonRZgTFrTd9HREEyeJjDpT397KMzizE6T3DvebLFE7n",
      1000000000000000000000
    ],
    [
      "5DtB6JvRdkzaCnozxs2x7qcqzJjut3WpXgEx7o6peqjwuPhA",
      1000000000000000000000
    ],
    [
      "5CdP9o2qTCPe26e3J5kWXm1XDrT9G9eQ6NquiYGtqZaEG7aw",
      1000000000000000000000000
    ]
  ]
}'

newSudo='
{
  "sudo":"5DtB6JvRdkzaCnozxs2x7qcqzJjut3WpXgEx7o6peqjwuPhA"
}'

rm -fr config
rm -fr data
mkdir config
mkdir data

################################################################################parachain
#alice    "5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY",
#bob      "5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty",
#charlie  "5FLSigC9HGRKVhB9FiEo4Y3koPsNmBmLJbpXg2mp1hXcS59Y"

echo "build diora chainspec"

./diora build-spec --disable-default-bootnode --chain rococo >  ./config/diora-dev.json
./diora export-genesis-state --chain ./config/diora-dev.json > ./config/diora-dev.genesis
./diora export-genesis-wasm --chain ./config/diora-dev.json > ./config/diora-dev.wasm


newParas="{\"paras\":[
        [
            4202,
            {
                \"genesis_head\": \"`cat ./config/diora-dev.genesis`\",
                \"validation_code\":\"`cat ./config/diora-dev.wasm`\",
                \"parachain\":true
            }
        ]
    ]}"

echo $newParas > ./config/newParas.json

################################################################################parachain
