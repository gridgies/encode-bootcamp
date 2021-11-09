//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Score {
    uint score = 5;
    address owner;

    event NewScore(uint _newScore);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        if(msg.sender == owner) {
            _;
        }
    }

    function getScore() public view returns (uint) {
        return score;
    }

    function setScore(uint _newScore) public {
        score = _newScore;

        emit NewScore(score);
    }

}
