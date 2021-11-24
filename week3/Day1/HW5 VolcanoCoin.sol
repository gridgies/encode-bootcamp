//SPDX-License-Identifier: UNLICENSED
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.0;

contract VolcanoCoin is ERC20("VolcanoCoin", "VOL"), Ownable {
    
    uint initialSupply = 10000;
    
    constructor() {
        _mint(msg.sender, initialSupply);
    }
    
    function mintToken(uint _quantity) public onlyOwner {
        _mint(msg.sender, _quantity);
        emit Supply_increased(_quantity);
    }
    
    uint supply;

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

    mapping (address => Payment[]) public payments;
    
    function transfer(address _recipient, uint _amount) public virtual override returns (bool) {
        _transfer(msg.sender, _recipient, _amount);
        addPayment(msg.sender, _recipient, _amount);
        return true;
    }

    
    function getPayments(address _user) public view returns (Payment[] memory) {
        return payments[_user];
    }
    
    function addPayment(address _sender, address _recipient, uint _amount) internal {
        payments[_sender].push(Payment(_amount, _recipient));
    }


}
