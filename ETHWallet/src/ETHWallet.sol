// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ETHWallet{

    address owner;
    uint256 balance;

    constructor(address _owner){
        owner= _owner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        _;
    }

    receive() external payable{}

    function withdraw(uint256 _amount)public onlyOwner{
        require(_amount<=address(this).balance,"Not Sufficient Amount");
        require(_amount>0,"Amount should be greater than 0");
        
        (bool success,)=payable(msg.sender).call{value:_amount}("");
        require(success,"Withdraw Failed");
    }

    function withdrawTo(address _to,uint256 _amount) public onlyOwner{
        require(_amount<=address(this).balance,"Not sufficient Balance");
        require(_amount>0,"Amount should be greater than 0");
        require(_to != address(0), "Invalid address");

        (bool success,)=_to.call{value:_amount}("");
        require(success,"Withdraw To Failed");
    }
    
    function checkBalance()public view returns (uint256){
        return address(this).balance;
    }


}
