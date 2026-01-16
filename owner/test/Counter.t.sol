// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Owner} from "../src/Owner.sol";

contract CounterTest is Test {
    Owner public owner;
    address public ownerAddress = address(0xA7BCD2a124B1D76e7dbE00eA9D887e69e37D2bae);
    address public newOwner = address(0x1234567890123456789012345678901234567890);

    function setUp() public {
        owner = new Owner(ownerAddress);
    }

    function test_owner()public{
        assertEq(ownerAddress,owner.owner());
    }

    function test_transferOwnership() public{
        vm.prank(ownerAddress);
        owner.transferOwnership(newOwner);

        assertEq(newOwner,owner.owner());
    }
}
