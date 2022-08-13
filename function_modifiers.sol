//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FunctionModifier {
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor(){
        //set the transaction sender as owner of the contract
        owner = msg.sender;
    }

    //contract modifier to check that call is the owner of the project. Define it here; Use it to modify function elsewhere.
    modifier onlyOwner() {
        require(msg.sender==owner,"Not owner");

        //underscore in a function modifier tells solidity to proceed with the rest of the code
        _;
    }

    modifier validAddress(address _addr){
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner){
        owner = _newOwner;
    }

    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}