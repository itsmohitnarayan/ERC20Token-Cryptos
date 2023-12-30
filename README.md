# "Cryptos(CRPT)" ERC-20 Token

## Overview

Cryptos is an implementation of the ERC-20 token standard on the Ethereum blockchain. ERC-20 is a widely adopted standard for fungible tokens on the Ethereum platform, allowing for seamless interaction with decentralized applications (DApps) and other smart contracts.

## Features

- **Name:** Cryptos
- **Symbol:** CRPT
- **Decimals:** 0 (Note: Uncomment and set to 18 if you want to use decimals)
- **Total Supply:** 1,000,000 tokens

## Smart Contract Details

### Functions

1. `totalSupply()`: Returns the total supply of Cryptos tokens.

2. `balanceOf(address tokenOwner)`: Returns the balance of tokens for a given address.

3. `transfer(address to, uint tokens)`: Transfers a specified amount of tokens to the given address.

4. `allowance(address tokenOwner, address spender)`: Returns the remaining allowance that a spender has to transfer tokens on behalf of a token owner.

5. `approve(address spender, uint tokens)`: Approves a spender to transfer a specified amount of tokens on behalf of the owner.

6. `transferFrom(address from, address to, uint tokens)`: Transfers tokens from one address to another on behalf of a third-party (if approved).

### Events

1. `Transfer(address indexed from, address indexed to, uint tokens)`: Triggered when tokens are transferred from one address to another.

2. `Approval(address indexed tokenOwner, address indexed spender, uint tokens)`: Triggered when the allowance of a spender is approved by the token owner.

## Deployment

The contract is deployed with a total supply of 1,000,000 tokens, and the deployer (founder) initially holds the entire supply.

## Usage

Feel free to use this contract as a template for creating your own ERC-20 tokens on the Ethereum blockchain.

## License

This smart contract is licensed under the GNU General Public License v3.0. Please refer to the [license file](LICENSE) for more details.

## Contributors

- Kumar Mohit

## Disclaimer

This code is provided as-is, without any warranty or support. Use it at your own risk.

## Getting Started

To deploy this contract on the Ethereum blockchain:

1. Clone the repository.
2. Compile the contract using a Solidity compiler.
3. Deploy the compiled contract to the Ethereum blockchain.

For more detailed instructions, refer to the Ethereum documentation.
