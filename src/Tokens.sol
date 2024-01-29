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
    // Public state variables for token details.
    string public name;                // Token name (e.g., MyToken).
    string public symbol;              // Token symbol (e.g., MYT).
    uint256 constant DECIMAL = 18;     // Number of decimal places for the token (assumed fixed at 18).

    // The total token supply.
    uint256 public totalSupply;

    // The owner's address of the contract (set to the account that deploys the contract).
    address public owner;

    // A mapping to keep track of each holder's balance.
    mapping(address => uint256) private balances;

    // The constructor sets the initial token details and initial supply.
    constructor(
        string memory _name,
        string memory _symbol,
        uint256 initialSupply
    ) {
        name = _name;                       // Set the token name.
        symbol = _symbol;                   // Set the token symbol.
        totalSupply = initialSupply;        // Set the initial total supply.
        balances[msg.sender] = totalSupply; // Assign initial supply to contract deployer.
        owner = msg.sender;                 // Set deployer as owner.
    }

    // The mint function allows the owner of the contract to create new tokens.
    function mint(uint256 amount) public {
        require(msg.sender == owner, "Only owner can call this function");
        totalSupply += amount * 10e18;      // Increase total supply by the specified `amount`.
        balances[msg.sender] += amount * 10e18; // Credit the minted tokens to the owner's balance.
    }

    // The transfer function allows a caller to send tokens to another address.
    function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount * 10e18, "Not enough balance");
        require(to != address(0), "To address cannot be zero");
        require(amount != 0, "Transfer amount cannot be zero");

        balances[msg.sender] -= amount * 10e18;  // Debit sender's balance.
        balances[to] += amount * 10e18;          // Credit receiver's balance.
    }

    // The balanceOf function returns the balance of a given account.
    function balanceOf(address account) public view returns (uint _balance) {
        _balance = balances[account];
        return _balance;
    }

    // The burn function allows a user to destroy tokens in their possession.
    function burn(uint256 amount) external {
        require(balances[msg.sender] >= amount * 10e18, "Insufficient balance");
        balances[msg.sender] -= amount * 10e18;  // Debit the amount of tokens to be burned.
        totalSupply -= amount * 10e18;           // Reduce total supply by the amount of burned tokens.
    }
}
