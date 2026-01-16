// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Hello} from "../src/Hello.sol";

contract CounterTest is Test {
    Hello public hello;

    function setUp() public {
        hello = new Hello();
    }

    function test_hello() public {
      string memory result = hello.helloWorld();
      assertEq(result, "Hello");
    }
}
