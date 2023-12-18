// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

import {TokensChallenge} from "../src/Tokens.sol";
import "./Helpers.sol";

contract TokensTest is Helpers {
    TokensChallenge public tCha;

    address userA;
    address userB;

    uint256 privKeyA;
    uint256 privKeyB;

    function setUp() public {
        string memory name = "Token Challenge";
        string memory symbol = "TKC";
        uint256 totalSupply = 1000;
        tCha = new TokensChallenge(name, symbol, totalSupply);

        (userA, privKeyA) = mkaddr("USERA");
        (userB, privKeyB) = mkaddr("USERB");
    }

    function testMintOwnerIncrease() public {
        uint256 initialSupply = tCha.totalSupply();
        uint256 mintAmount = 100;

        vm.prank(userA); // Set msg.sender to owner for mint

        tCha.mint(mintAmount);

        assertEq(tCha.totalSupply(), initialSupply + mintAmount * 10e18);
        assertEq(tCha.balanceOf(userA), mintAmount * 10e18);
    }

    function testMintNonOwnerRevert() public {
        uint256 mintAmount = 10;

        vm.expectRevert("Only owner can mint tokens");

        tCha.mint(mintAmount);
    }

    function testSuccessfulTransfer() public {
        uint256 initialSenderBalance = tCha.balanceOf(userA);
        uint256 transferAmount = 100;

        tCha.transfer(address(this), transferAmount);

        assertEq(
            tCha.balanceOf(userA),
            initialSenderBalance - transferAmount * 10e18
        );
        assertEq(tCha.balanceOf(address(this)), transferAmount * 10e18);
    }

    function testInsufficientBalanceRevert() public {
        uint256 transferAmount = 10000; // Exceeds owner's balance

        vm.expectRevert("Not enough balance");

        tCha.transfer(address(this), transferAmount);
    }

    function testZeroTransferAmountRevert() public {
        uint256 transferAmount = 0;

        vm.expectRevert("Transfer amount cannot be zero");

        tCha.transfer(address(this), transferAmount);
    }

    function testTransferToZeroAddressRevert() public {
        uint256 transferAmount = 100;

        vm.expectRevert("To address cannot be zero");

        tCha.transfer(address(0), transferAmount);
    }

    function testSuccessfulBurn() public {
        uint256 initialSupply = tCha.totalSupply();
        uint256 initialBalance = tCha.balanceOf(userA);
        uint256 burnAmount = 100;

        tCha.burn(burnAmount);

        assertEq(tCha.totalSupply(), initialSupply - burnAmount * 10e18);
        assertEq(tCha.balanceOf(userA), initialBalance - burnAmount * 10e18);
    }

    function testZeroBurnAmountRevert() public {
        uint256 burnAmount = 0;

        vm.expectRevert("Burn amount cannot be zero");

        tCha.burn(burnAmount);
    }
}
