pragma solidity ^0.5.11;

contract Structure {
    
    struct Payment {
        uint amount;
        uint timestamps;
    }
    struct Balance {
        uint totalBal;
        uint numPayments;
        mapping(uint => Payment) payments;
    }
    
    mapping(address => Balance) public balanceRecived;
    
    function getBalance() public view returns(uint){
        
        return address(this).balance;
    }
    
    function sendMoney() public payable {
        
        balanceRecived[msg.sender].totalBal += msg.value;
        
        Payment memory payment =Payment(msg.value,now);
        
        balanceRecived[msg.sender].payments[balanceRecived[msg.sender].numPayments]=payment;
        balanceRecived[msg.sender].numPayments++;
        
    }
    
    function widthrawMoney(address payable _to,uint _amount) public {
        require(balanceRecived[msg.sender].totalBal >= _amount,"not enough funds");
        balanceRecived[msg.sender].totalBal -=_amount;
        _to.transfer(_amount);
    }
    function widthrawAllMonney(address payable _to) public  {
        uint balanceToSend = balanceRecived[msg.sender].totalBal;
        balanceRecived[msg.sender].totalBal=0;
        _to.transfer(balanceToSend);
    }
}
