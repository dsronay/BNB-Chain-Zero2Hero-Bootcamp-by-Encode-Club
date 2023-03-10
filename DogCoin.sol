// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.18;

contract DogCoin {
    uint256 public totalSupply = 2000000;
    address public owner;
    mapping(address => uint256) public balances; 

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can execute this function.");
        _;
    }

    event SupplyChanged(uint256 newSupply);
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        owner = msg.sender;
        balances[owner] = totalSupply;
    }

    function getTotalSupply() public view returns(uint256){
        return totalSupply;
    }

    function increaseTotalSupply() public onlyOwner {
        totalSupply += 1000;
        emit SupplyChanged(totalSupply);
    }

    function transfer(address recipient, uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0.");
        require(balances[msg.sender] >= amount, "Insufficient balance.");

        balances[msg.sender] -= amount;
        balances[recipient] += amount;

        emit Transfer(msg.sender, recipient, amount);
    }

}