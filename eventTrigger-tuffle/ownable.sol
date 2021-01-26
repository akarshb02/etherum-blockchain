pragma solidity ^0.6.0;


contract Ownable {
    address payable _owner;
    
    constructor() public  {
        _owner = msg.sender;
    }
    
    modifier onlyOwner() {
        
        require(isOwner(), "You are not owner");
        _;
    }
    
    function  isOwner() public view returns(bool) {
        
        return (msg.sender == _owner);
    }
}

contract Item {
    uint public priceInWei;
    uint public index;
    uint public isPaid;
    
    
    eventTrigger parentContract;
    
    constructor(eventTrigger _parentContract,uint _priceInWei,uint _index) public {
        parentContract = _parentContract;
        priceInWei =  _priceInWei;
        index = _index;
        
    }
    
    fallback() external payable {
        
        
        //address(parentContract).transfer(msg.value);
        
        //low Level function
        require(isPaid == 0,"Item paid already");
        isPaid += msg.value;
        (bool success,)= address(parentContract).call.value(msg.value)(abi.encodeWithSignature('triggerPayment(uint256)',index));
        require(success,"The transaction wasn't successful,canceling");
        
    }
}





contract eventTrigger is Ownable{


enum supplyChainState{Created,Paid,Delivered }


struct s_state {
    Item _item;
    string  identifier;
    uint itemPrice;
    eventTrigger.supplyChainState _state;
    
}

mapping(uint=>s_state) public items;
uint itemIndex;

event supplyChainStep(uint _itemIndex,uint _step);

function createItem(string memory _identifier,uint itemPrice) public onlyOwner {
    
    Item item = new Item(this,itemPrice,itemIndex);
    items[itemIndex]._item = item;
    items[itemIndex].identifier = _identifier;
    items[itemIndex].itemPrice =  itemPrice;
    items[itemIndex]._state = supplyChainState.Created;
    emit supplyChainStep(itemIndex,uint(items[itemIndex]._state));
    itemIndex++;
}

function triggerPayment(uint _itemIndex) public  payable onlyOwner{ 
    
    require(items[_itemIndex].itemPrice==msg.value,"Only full payment accepted");
    require(items[_itemIndex]._state == supplyChainState.Created,"item is further in chain");
        items[_itemIndex]._state = supplyChainState.Paid;

      emit supplyChainStep(_itemIndex,uint(items[_itemIndex]._state));
    
}

function triggerDelivery(uint _itemIndex) public {

    require(items[_itemIndex]._state == supplyChainState.Paid,"item is further in chain");
    items[itemIndex]._state = supplyChainState.Delivered;
    
          emit supplyChainStep(_itemIndex,uint(items[_itemIndex]._state));
    
}
fallback() external payable {
    triggerPayment(itemIndex);
}

}
