# Token Smart Contract

## Background

The smart contract in this repository is part of a 15 day smart contract building challenge. The challenge has three levels of difficulty, namely:

- Basic: The challenges from Day 1 to Day 5
- Intermediate: The challenges from Day 6 to Day 10
- Advanced: The challenges from Day 11 to Day 15

## Challenge Task: Basic 2

Write a smart contract that can create and transfer tokens. The contract should have a mapping that stores the balances of each address. The contract should also have a function to mint new tokens and assign them to the contract owner. The contract should also have a function to transfer tokens from one address to another, only if the sender has enough balance.

## Building

### Features:

#### Token Creation:

- It manages a custom token with a name, symbol, and decimal base (18 in this case).
- The initial supply is fixed during deployment.
- Only the contract owner can mint new tokens, increasing the total supply and their own balance.

#### Token Transfer:

- Users can transfer tokens to other addresses.
- Transfers are verified for sufficient sender balance, non-zero recipient address, and non-zero transfer amount.

#### Balance Management:

- A mapping tracks the token balance for each address.
- Users can view their own balance with the balanceOf function.

#### Burn Functionality:

- Users can burn a portion of their own tokens, permanently reducing their balance and the total supply.

### Usage:

- Use the transfer function to send tokens between user addresses.
- The owner can mint new tokens using the mint function.
  Users can burn their own tokens with the burn function.

- **Note:** This is a basic implementation and lacks certain features for production use, such as security measures and access control mechanisms. It is intended as a learning exercise and a starting point for exploring tokenization concepts in Solidity.

**Feel free to:**

- Modify the contract to add new features or functionalities.
- Experiment with different deployment parameters and usage scenarios.
- Contribute to the code or suggest improvements by raising issues or pull requests.

## Disclaimer:

This is provided as a basic example and should not be used in production without proper security and testing. If to be used in production, use at your own risk.

## License

This contract is unlicensed.

## Acknowledgments

This contract was developed and tested using Foundry, a Solidity development and testing platform.
