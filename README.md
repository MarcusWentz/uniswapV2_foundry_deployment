# uniswapv2_foundry_deployment

## Deploy

1. Deploy UniswapV2Factory with INIT_CODE_HASH public variable (added already).

```shell
forge create --constructor-args <feeToSetter> --legacy --rpc-url <rprUrl> --private-key $devTestnetPrivateKey src/UniswapV2Factory.sol:UniswapV2Factory 
```

2. Update library inside Router INIT_CODE_HASH on line 704 in this format https://github.com/MarcusWentz/uniswapV2_foundry_deployment/blob/main/src/UniswapV2Router02.sol#L704 

⚠️ Do not use this exact value unless it matches your new INIT_CODE_HASH ⚠️

```solidity
hex'f5cf876c1910617ea1749e7346a0c71cf8d678a08fc2fb10ae44fded41499415' // init code hash
```

3. Deploy UniswapV2Router02:

```
forge create --constructor-args <factory> <weth> --legacy --rpc-url <rprUrl> --private-key $devTestnetPrivateKey src/UniswapV2Router02.sol:UniswapV2Router02 
```

## Sepolia Verified Deployments:

UniswapV2Factory:

https://sepolia.etherscan.io/address/0xdbaa7dfbd9125b7a43457d979b1f8a1bd8687f37#code

UniswapV2Router02:

https://sepolia.etherscan.io/address/0xd49d79d476215bef1e5ac43c46ec9db6e7906dbd#code
