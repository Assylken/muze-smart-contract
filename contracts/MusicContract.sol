// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MusicContract {
    address payable owner;

    receive() external payable {}

    fallback() external payable {}

    constructor() {
        owner = payable(address(this));
    }

    function showmetheBalance() public view returns (uint) {
        return address(this).balance;
    }

    event TokensSent(uint maticToken, uint256 amount);

    function sendTokens(address payable artistWallet, uint256 amount) internal {
        artistWallet.transfer(amount);
    }

    function calculateAmount(
        uint256 totalPlays,
        uint256 currentPlays,
        address payable artistWallet
    ) external {
        uint256 amount;
        if (totalPlays >= 10000) {
            amount = currentPlays * 1e16;
        } else if (totalPlays >= 1000) {
            amount = currentPlays * 1e15;
        } else if (totalPlays >= 100) {
            amount = currentPlays * 1e14;
        }
        emit TokensSent(this.showmetheBalance(), amount);
        if (amount > 0) {
            sendTokens(artistWallet, amount);
        }
    }
}
