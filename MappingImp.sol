pragma solidity ^0.5.11;

contract MaappingStructure {
    
    mapping(address => uint) public balanceRecived;
    
    function getBalance() public view returns(uint){
        
        return address(this).balance;
    }
    
    function sendMoney() public payable {
        
        balanceRecived[msg.sender]=msg.value;
        
    }
    
    function widthrawMoney(address payable _to,uint _amount) public {
        require(balanceRecived[msg.sender] >= _amount,"not enough funds");
        balanceRecived[msg.sender] -=_amount;
        _to.transfer(_amount);
    }
    function widthrawAllMonney(address payable _to) public  {
        uint balanceToSend = balanceRecived[msg.sender];
        balanceRecived[msg.sender]=0;
        _to.transfer(balanceToSend);
    }
}
