pragma solidity ^0.5.11;


contract SmartWallet {
    

    function withdrawal(address payable _to,uint _amount) public {
        _to.transfer(_amount);
        
    }
    
    function() external payable {
        
        
    }
}
