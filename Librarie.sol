pragma solidity ^0.5.11;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/math/SafeMath.sol";

contract Librarie {
    
    mapping(address => uint) public tokenBal;

    using SafeMath for uint;

    event TokenSent(address from, address to ,uint _amount); 

    constructor() public {
        tokenBal[msg.sender] = 200;
    }
    
    function sendToken(address _to, uint _amount) public returns(bool) { 
        tokenBal[msg.sender] =tokenBal[msg.sender].sub(_amount);
        tokenBal[_to] += _amount;
        
         return true;
}

}
