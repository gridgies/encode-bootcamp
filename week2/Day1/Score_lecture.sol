//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Score {
    uint score = 5;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        if (msg.sender == owner) {
            _;
        }
    }

    function getScore() public view returns (uint) {
        return score;
    }

    event Score_set(uint indexed);

    function setScore(uint _newScore) public onlyOwner {
        score = _newScore;
        emit Score_set(_newScore);
    }


}
