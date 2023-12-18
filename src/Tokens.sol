// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

// Challenge: This is part of a 15 day smart contract writing challenge, with 5 days for each level of difficulty, basic, intermediate and advanced.

/*
Basic 2: 
Write a smart contract that can create and transfer tokens.
The contract should have a mapping that stores the balances of each address.
The contract should also have a function to mint new tokens and assign them to the contract owner.
The contract should also have a function to transfer tokens from one address to another, only if the sender has enough balance.
*/

contract TokensChallenge {
    string public name;
    string public symbol;
    uint256 constant DECIMAL = 18;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) private balances;

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 initialSupply
    ) {
        name = _name;
        symbol = _symbol;
        totalSupply = initialSupply;
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    //    modifier onlyOwner() {
    //        require(msg.sender == owner, "Only owner can call this function");
    //        _;
    //    }

    function mint(uint256 amount) public {
        require(msg.sender == owner, "Only owner can call this function");
        totalSupply += amount * 10e18;
        balances[msg.sender] += amount * 10e18;
    }

    function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Not enough balance");
        require(to != address(0), "To address cannot be zero");
        require(amount != 0, "Transfer amount cannot be zero");

        balances[msg.sender] -= amount * 10e18;
        balances[to] += amount * 10e18;
    }

    function balanceOf(address account) public view returns (uint _balance) {
        _balance = balances[account];
        return _balance;
    }

    function burn(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount * 10e18;
        totalSupply -= amount * 10e18;
    }
}
