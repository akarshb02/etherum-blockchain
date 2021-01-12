pragma solidity ^0.5.11;

contract EventEx {
    
    mapping(address => uint) public tokenBal;



    event TokenSent(address from, address to ,uint _amount); 

    constructor() public {
        tokenBal[msg.sender] = 200;
    }
    
    function sendToken(address _to, uint _amount) public returns(bool) { 
        require(tokenBal[msg.sender] >= _amount,"Not enough");
        assert(tokenBal[_to] + _amount >= tokenBal[_to]);
        assert(tokenBal[msg.sender] -  _amount <= tokenBal[msg.sender]);
        tokenBal[msg.sender] -= _amount;
        tokenBal[_to] += _amount;
        
        emit TokenSent(msg.sender,_to,_amount);
        return true;
}

}
