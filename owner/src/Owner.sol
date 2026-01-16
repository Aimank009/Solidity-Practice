// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


contract Owner{
    address public owner;

    constructor(address _owner){
        owner= _owner;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"Not Owner");
        _;
    }

    function transferOwnership(address  _newOwner) public onlyOwner{
        owner=_newOwner;
    }
}