pragma solidity ^0.5.13;

import "./Allowance.sol";


contract simplewallet is Allowance {
    
    
    event MoneySent(address indexed _benefical, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);
    
    // address public owner;
    
    // constructor() public {
    //     owner = msg.sender;
    // }
    // modifier onlyOwner() {
    //     require(owner == msg.sender ," You are not owner");
    //     _;
    // }
    
        function widthrawMoney(address payable _to,uint _amount) public ownerorAllowed(_amount) {
        if(!isOwner()){
            
            reduceAllowence(msg.sender,_amount);
        }
        emit MoneySent(_to,_amount);
        _to.transfer(_amount);
    }
    
    function() external payable{
        emit MoneyReceived(msg.sender,msg.value);
        
    }
}
