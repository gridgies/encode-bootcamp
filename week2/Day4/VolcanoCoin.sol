//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract VolcanoCoin {
    uint public supply;
    address owner;
    
    mapping(address => uint) public balance;
    mapping(address => Payment[]) payments;

    constructor() {
        supply = 10000;
        owner = msg.sender;
        balance[msg.sender] = supply;
    }

    modifier onlyOwner {
        if (msg.sender == owner) {
            _;
        }
    }

    function getBalance() public view returns (uint) {
        return balance[owner];
    }

    function getSupply() public view returns (uint) {
        return supply;
    }

    function increaseSupply() public onlyOwner {
        supply += 1000;
        emit Supply_increased(supply);
    }

    event Supply_increased(uint);

    struct Payment {
        uint amount;
        address recipient;
    }

    function transfer(address recipient, uint amount) public {
        balance[owner] = balance[owner] - amount;
        balance[recipient] = balance[recipient] + amount;

        Payment memory pay;
        pay.amount = amount;
        pay.recipient = recipient;
        payments[owner].push();
        emit Amount_transferred(amount, recipient);
    }

    event Amount_transferred(uint, address);



}
