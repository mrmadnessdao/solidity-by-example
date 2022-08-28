//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Event {
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "This is the sender's address");
        emit AnotherLog();
    }


}