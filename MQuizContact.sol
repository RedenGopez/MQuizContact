// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract MQuizContract {

uint public age;
uint public hoursWorked;
uint public hourlyRate;
uint public totalSalary;

function setAge(uint _age) public {
age = _age;
}

function setHoursWorked(uint _hoursWorked) public {
hoursWorked = _hoursWorked;
}

function setRate(uint _hourlyRate) public onlyOwner {
require(_hourlyRate > 0, "Hourly rate must be greater than zero.");
hourlyRate = _hourlyRate;
}

function calculateTotalSale() public onlyOwner {
require(hourlyRate > 0 && hoursWorked > 0, "Cannot calculate salary with zero values.");
totalSalary = hourlyRate * hoursWorked;
}

modifier onlyOwner() {
require(msg.sender == tx.origin, "Only the contract owner can call this function.");
_;
}
}