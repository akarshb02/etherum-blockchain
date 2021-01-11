pragma solidity ^0.5.11;
contract FunctionEx {
    
    mapping(address=>uint64)  public balanceReceived;
    address payable owner;
    
     constructor() public  {
          owner =  msg.sender;
          
     }
    function getOwner() public view returns(address){
        return owner;
    }
    function receiveMoney() public payable{
        assert(balanceReceived[msg.sender] + uint64(msg.value) <= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += uint64(msg.value);
    }
    
    function widthraMoney(address payable _to, uint64 _amount) public {
       
        require(_amount <= balanceReceived[msg.sender],"You don't have enough etha");
            assert(balanceReceived[msg.sender]>= balanceReceived[msg.sender]   -_amount ) ;
             balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
            
           
    }
    
    function convertToEtha(uint _amt) public pure returns(uint){
        
        return _amt/1 ether;
    }
    function() external payable {
        
        receiveMoney();
    }
}


