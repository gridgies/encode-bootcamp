//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract VolcanoCoin {
    uint supply = 10000;
    address owner;

    constructor() {
        owner = msg.sender;
        balance[owner] = supply;
    }

    modifier onlyOwner {
        if (msg.sender == owner) {
            _;
        }
    }

    mapping(address => uint) balance;

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

    function transfer(address recipient, uint amount) public {
        balance[owner] = balance[owner] - amount;
        balance[recipient] = balance[recipient] + amount;
        emit Amount_transferred(amount, recipient);
    }

    event Amount_transferred(uint, address);
}
