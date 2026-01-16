// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract TipJar{

    address owner;

    constructor(address _owner){
        require(_owner != address(0),"Zero Address");
        owner = _owner;
    }

    receive() external  payable{}

    modifier onlyOwner() {
        require(msg.sender==owner,"Not Owner");
        _;
    }

    function withdraw(address _to,uint256 _amount)public onlyOwner {
        require(_amount<=address(this).balance,"Not Enough balance to withdraw");
        require(_amount>0,"Amount should be greater than zero");
        require(_to!=address(0),"Not Null Address");
        (bool success,)=payable(_to).call{value:_amount}("");
        require(success,"Transaction failed");
    }

    function data() public view returns (uint256,address){
        return (address(this).balance,owner);
    }
}
