// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    //this is where we'll actaully deploy our contract
    FundMe fundMe;

    function setUp() external {
        fundMe = new FundMe();
        //fundMe varibale of type FundMe forms new contract named Fundme
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }
}
