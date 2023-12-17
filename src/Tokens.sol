// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

// Challenge: This is part of a 15 day smart contract writing challenge, with 5 days for each level of difficulty, basic, intermediate and advanced.

/*
Basic 2: 
Write a smart contract that can create and transfer tokens.
The contract should have a mapping that stores the balances of each address.
The contract should also have a function to mint new tokens and assign them to the contract owner.
The contract should also have a function to transfer tokens from one address to another, only if the sender has enough balance.
*/

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Tokens is ERC20 {}
