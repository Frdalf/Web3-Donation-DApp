// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Donation {
    address public owner;
    uint256 public totalDonations;

    event Donated(address indexed donor, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    function donate() external payable {
        require(msg.value > 0, "Donation must be > 0");
        totalDonations += msg.value;
        emit Donated(msg.sender, msg.value);
    }

    function contractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
