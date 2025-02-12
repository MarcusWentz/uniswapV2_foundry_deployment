// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.28;

import {Test, console} from "forge-std/Test.sol";
// import {IUniswapV2Router02} from "../src/UniswapV2Router02.sol";
interface IUniswapV2Router02 {
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
}

 
// Simplified from: 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol

interface IERC20 {
    // function transfer(address to, uint256 value) external returns (bool);
    // function transferFrom(address from, address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
}

contract UniswapV2Router02Test is Test {
    IUniswapV2Router02 public uniswapRouterV2;
    IERC20 public linkToken;
    address public constant addressUniswapV2Router02 = 0x794c842Ef3EE218464068F0FFC4Bc084453CDeDD;
    address public constant linkTokenAddress = 0xE4aB69C077896252FAFBD49EFD26B5D171A32410;

    function setUp() public {
        uniswapRouterV2 = IUniswapV2Router02(addressUniswapV2Router02);
        linkToken = IERC20(linkTokenAddress);
    }

    function testAddLiquidityEth() public {
        //LINK TOKEN ADDRESS
        // address token = linkTokenAddress;
        uint amountTokenDesired = 2000;
        uint amountTokenMin = 1000;
        uint amountETHMin = 1000;
        address to = address(this);
        uint deadline = type(uint256).max;

        // Deal Ethereum.
        deal(address(this), amountETHMin);
        // Deal ERC-20 tokens.
        // deal(token,msg.sender, 10 ether);
        deal(linkTokenAddress, address(this), 10 ether);
        assertEq(
            linkToken.balanceOf(address(this)),
            10 ether
        );        
        linkToken.approve(addressUniswapV2Router02, 10 ether);
        assertEq(
            linkToken.allowance(address(this), addressUniswapV2Router02),
            10 ether
        );

        // assertEq(
        //     address(this),
        //     msg.sender
        // );

        vm.startPrank(address(this));
 
        uniswapRouterV2.addLiquidityETH{value: amountETHMin}(
            linkTokenAddress,
            amountTokenDesired,
            amountTokenMin,
            amountETHMin,
            to,
            deadline
        );
    
    }
    
}