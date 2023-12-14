// SPDX-License-Identifier: GPL-3.0

// Solidity version declaration
pragma solidity >=0.5.0 <0.9.0;

// ----------------------------------------------------
// EIP-20: ERC-20 Token Standard
// https://eips.ethereum.org/EIPS/eip-20
// ----------------------------------------------------

// Interface for the ERC-20 Token Standard
interface ERC20Interface {
    // Returns the total supply of tokens
    function totalSupply() external view returns (uint);

    // Returns the balance of tokens for a given address
    function balanceOf(address tokenOwner) external view returns (uint balance);

    // Transfers a specified amount of tokens to the given address
    function transfer(address to, uint tokens) external returns (bool success);

    // Returns the remaining allowance that a spender has to transfer tokens on behalf of a token owner
    function allowance(address tokenOwner, address spender) external view returns (uint remaining);

    // Approves a spender to transfer a specified amount of tokens on behalf of the owner
    function approve(address spender, uint tokens) external returns (bool success);

    // Transfers tokens from one address to another on behalf of a third-party (if approved)
    function transferFrom(address from, address to, uint tokens) external returns (bool success);

    // Events for token transfer and approval
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

// Implementation of the ERC-20 Token Standard
contract Cryptos is ERC20Interface {
    // Token details
    string public name = "Cryptos";
    string public symbol = "CRPT";
    uint public decimals = 0; // 18 (Uncomment and set to 18 if you want to use decimals)
    uint public override totalSupply;

    // Address of the token founder (deployer)
    address public founder;

    // Mapping to store the balances of token holders
    mapping(address => uint) public balances;
    // Example: balances[0x1111...] = 100;

    // Mapping to store allowances for token transfers between addresses
    mapping(address => mapping(address => uint)) allowed;
    // Example: allowed[0x111][0x222] = 100;

    // Contract constructor
    constructor() {
        totalSupply = 1000000;
        founder = msg.sender;
        balances[founder] = totalSupply;
    }

    // Returns the balance of tokens for a given address
    function balanceOf(address tokenOwner) public view override returns (uint balance) {
        return balances[tokenOwner];
    }

    // Transfers a specified amount of tokens to the given address
    function transfer(address to, uint tokens) public override returns (bool success) {
        require(balances[msg.sender] >= tokens);

        balances[to] += tokens;
        balances[msg.sender] -= tokens;
        emit Transfer(msg.sender, to, tokens);

        return true;
    }

    // Returns the remaining allowance that a spender has to transfer tokens on behalf of a token owner
    function allowance(address tokenOwner, address spender) view public override returns (uint) {
        return allowed[tokenOwner][spender];
    }

    // Approves a spender to transfer a specified amount of tokens on behalf of the owner
    function approve(address spender, uint tokens) public override returns (bool success) {
        require(balances[msg.sender] >= tokens);
        require(tokens > 0);

        allowed[msg.sender][spender] = tokens;

        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    // Transfers tokens from one address to another on behalf of a third-party (if approved)
    function transferFrom(address from, address to, uint tokens) external override returns (bool success) {
        require(allowed[from][msg.sender] >= tokens);
        require(balances[from] >= tokens);

        balances[from] -= tokens;
        allowed[from][msg.sender] -= tokens;
        balances[to] += tokens;

        emit Transfer(from, to, tokens);
        return true;
    }
}
