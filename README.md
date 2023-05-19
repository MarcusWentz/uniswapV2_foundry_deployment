# uniswapv2_foundry_deployment

1. Deploy !! with INIT_CODE_HASH public variable (added already).

??. Update INIT_CODE_HASH:

```solidity
hex'f5cf876c1910617ea1749e7346a0c71cf8d678a08fc2fb10ae44fded41499415' // init code hash
```

forge create --legacy --rpc-url https://liberty20.shardeum.org/ --private-key $devTestnetPrivateKey src/Contract.sol:SimpleStorage