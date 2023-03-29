// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "lib/v3-core/contracts/libraries/BitMath.sol";

interface MostSignificantBit {
    function mostSignificantBit(uint256 x) external pure returns (uint256);
}

contract MSB is Test {

    MostSignificantBit public msb;

    function setUp() public {
        msb = MostSignificantBit(HuffDeployer.deploy("MostSignificantBit"));
    }

    function testMSB() public  {
        uint a = msb.mostSignificantBit(1000000);
        console.logUint(a);
        uint b = BitMath.mostSignificantBit(1000000);
        console.logUint(b);
        assertEq(a,b);
    }
}
