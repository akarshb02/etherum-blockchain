pragma solidity ^0.5.4;

contract HotelRoom {
    
    
     enum Statuses {Vacat,Occupied};
        Statuses currentStatus;
    
    address payable public owner;
   
    constructor()  {
        owner = msg.sender;
        currentStatus Statuses.Vacat;
    }
    modifier const() {
        
    }
    
    function book() public payable {
        owner.transfer(msg.value);
        currentStatus = Statuses.Occupied;
    }
    
    receive() public {
        book();
    }
}
