//SPDX-License-Identifier: UNLICENSED
import "@openzeppelin/contracts@4.2.0/token/ERC20/ERC20.sol";

pragma solidity ^0.8.0;

contract VolcanoCoin is ERC20 {
    constructor(string memory _tokenName, string memory _symbol) ERC20("VolcanoCoin", "VOL") public {
        owner = msg.sender;
        balance[owner] = supply;
    }
    
    uint supply = 10000;
    address owner;

    

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

    struct Payment {
        uint amount;
        address recipient;
    }

    function transferCoins(address recipient, uint amount) public {
        balance[owner] = balance[owner] - amount;
        balance[recipient] = balance[recipient] + amount;

        Payment memory pay;
        pay.amount = amount;
        pay.recipient = recipient;
        payments[owner].push();
        emit Amount_transferred(amount, recipient);
    }

    event Amount_transferred(uint, address);

    mapping(address => bytes) payments;

}
