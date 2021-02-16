pragma solidity ^0.7.4;


contract ownable {
    address  owner;
 
    constructor(){
        
     owner = msg.sender;
 }
    
    
    modifier onlyOwner() {
        
       require( msg.sender == owner,"must be owner");
        _;
    }
}


contract secretvalut {
    string secrets;
    
        constructor(string memory _secrets){
        
        secrets = _secrets;
        
        
    }
     function getSecrets() public view  returns(string memory) {
        
        return secrets;
        
    }
    
    
}



contract Fact is ownable{
    address secretvalut;
    
    
    constructor(string memory _secrets){
        secretvalut _secrets = new secretvalut(_secrets);
    _secrets
        
        super;
    }
    
    
    function getSecrets() public view onlyOwner returns(string memory) {
        
        return secrets;
        
    }
}
