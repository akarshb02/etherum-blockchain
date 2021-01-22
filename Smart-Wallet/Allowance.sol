pragma solidity ^0.5.13;

import  "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/ownership/Ownable.sol";
import   "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract Allowance is Ownable{
    
    using SafeMath for uint;
    
    event AllowanceChanged(address indexed _forwho,address indexed _fromWhome,uint _oldAmount,uint _newAmount);
    mapping(address=>uint) public allowance;
    

    
    modifier ownerorAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }
    
    function addAllowence(address _who,uint _amount) public onlyOwner {
       emit AllowanceChanged(_who,msg.sender,allowance[_who],_amount);
        allowance[_who] = _amount;
    }
    
    function reduceAllowence(address _who,uint _amount) public {
        emit AllowanceChanged(_who,msg.sender,allowance[_who],allowance[_who].sub(_amount));
        allowance[_who]= allowance[_who].sub(_amount);
    }
    
}



