pragma solidity ^0.6.0;


contract eventTrigger {


enum supplyChainState{Created,Paid,Delivered }


struct s_state {
    string  identifier;
    uint itemPrice;
    eventTrigger.supplyChainState _state;
    
}

mapping(uint=>s_state) public items;
uint itemIndex;

event supplyChainStep(uint _itemIndex,uint _step);

function createItem(string memory _identifier,uint8 itemPrice) public {
    
    items[itemIndex].identifier = _identifier;
    items[itemIndex].itemPrice =  itemPrice;
    items[itemIndex]._state = supplyChainState.Created;
    itemIndex++;
}

function triggerPayment(uint _itemIndex) public  payable{
    
    require(items[_itemIndex].itemPrice==msg.value,"Only full payment accepted");
    require(items[_itemIndex]._state == supplyChainState.Created,"item is further in chain");
        items[_itemIndex]._state = supplyChainState.Paid;

        emit supplyChainState(_itemIndex,uint(items[_itemIndex]._state));
    
}

function triggerDelivery(uint _itemIndex) public {

    require(items[_itemIndex]._state == supplyChainState.Paid,"item is further in chain");
    items[itemIndex]._state = supplyChainState.Delivered;
    
}
}
