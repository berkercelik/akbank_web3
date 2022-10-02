pragma solidity ^0.8.7;
//SPDX-License-Identifier: MIT

contract FeeCollector { 
    address public owner;
    uint256 public balance;
    
    constructor() {
        owner = msg.sender; 
    }
    
    receive() payable external {
        balance += msg.value; 
    }
    
    
    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= balance, "Insufficient funds");
        
        destAddr.transfer(amount); 
        balance -= amount;
    }
}

//0x43d15cA7aF4ea0d16349289968e02d1E7e5207a6 is my contract on Rinkeby