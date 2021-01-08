pragma solidity ^0.5.11;


contract Transfer {
    
    uint public balReceived;
    function receive() public payable {
        
        balReceived = msg.value;
        
        
    }
    
    function getBalance() public view returns(uint) {
        
                return address(this).balance;
    }
    
    function widthdrawMoney() public {
        address payable to =  msg.sender;
        to.transfer(this.getBalance());
    }
    function widthDrawto(address payable __to) public {
        
        __to.transfer(this.getBalance());
        
    }
}
