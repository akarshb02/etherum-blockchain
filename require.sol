pragma solidity ^0.5.11;
contract ExceptionEx {
    
    mapping(address=>uint)  public balanceReceived;
    
    function receiveMoney() public payable{
        
        balanceReceived[msg.sender] += msg.value;
    }
    
    function widthraMoney(address payable _to, uint _amount) public {
        
        require(_amount <= balanceReceived[msg.sender],"You don't have enough money"); 
        
            balanceReceived[msg.sender] -= _amount;
             _to.transfer(_amount);
    
}
}
