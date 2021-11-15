//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract VolcanoCoin {
    uint supply = 10000;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => uint) balance;

    modifier onlyOwner {
        if (msg.sender == owner) {
            _;
        }
    }

    function getSupply() public view returns (uint) {
        return supply;
    }

    function increaseSupply() public onlyOwner {
        supply += 1000;
        emit Supply_increased(supply);
    }

    event Supply_increased(uint);
}
