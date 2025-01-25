# uniswapv2_foundry_deployment

## Deploy

1. Deploy UniswapV2Factory with INIT_CODE_HASH public variable (added already).

⚠️  Note: the constructor arguments set in a text file to avoid forge compilation issues. ⚠️ 

⚠️  Note: this example sets feeToSetter to 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045 (vitalik.eth). ⚠️ 

```shell
forge create src/UniswapV2Factory.sol:UniswapV2Factory  \
--constructor-args-path src/deployConstructor/UniswapV2Factory.txt \
--private-key $devTestnetPrivateKey \
--rpc-url $baseSepoliaHTTPS \
--etherscan-api-key $basescanApiKey \
--broadcast \
--verify 
```

2. Update library inside Router INIT_CODE_HASH on line 704 in this format:

https://github.com/MarcusWentz/uniswapV2_foundry_deployment/blob/main/src/UniswapV2Router02.sol#L704 

⚠️ Do not use this exact value unless it matches your new INIT_CODE_HASH ⚠️

```solidity
hex'295e81838c52ea539beeced4b28b067224b25534c7f513a6ee295364a9d3fe0d' // init code hash
```

3. Deploy UniswapV2Router02:

```shell
forge create src/UniswapV2Router02.sol:UniswapV2Router02 \
--constructor-args-path src/deployConstructor/UniswapV2Router02.txt \
--private-key $devTestnetPrivateKey \
--rpc-url $baseSepoliaHTTPS \
--etherscan-api-key $basescanApiKey \
--broadcast \
--verify 
```

## Sepolia Verified Deployments:

Note: this example from the deployed address for UniswapV2Factory INIT_CODE_HASH is :

```solidity
hex'f5cf876c1910617ea1749e7346a0c71cf8d678a08fc2fb10ae44fded41499415' // init code hash
```

UniswapV2Factory:

https://sepolia.etherscan.io/address/0xdbaa7dfbd9125b7a43457d979b1f8a1bd8687f37#code

UniswapV2Router02:

https://sepolia.etherscan.io/address/0xd49d79d476215bef1e5ac43c46ec9db6e7906dbd#code

## Base Sepolia Verified Deployments:

UniswapV2Factory:

https://sepolia.basescan.org/address/0xaec91b299dc7b7001e32112f2a72a3a51f3b9303

UniswapV2Router02:

https://sepolia.basescan.org/address/0x794c842Ef3EE218464068F0FFC4Bc084453CDeDD