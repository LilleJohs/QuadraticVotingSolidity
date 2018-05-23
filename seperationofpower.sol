pragma solidity ^0.4.24;
/**
 * @title SeperationOfPower
 * @dev The SeperationOfPower contract has an two "owner" addresses: dicator and charity.
 * Charity is the only one who has access to the ether associated with these contracts,
 * while dictator is the only one who can add new citizens or do any kind of changes
 * to the contracts.
 */
contract SeperationOfPower {
  address public dictator;
  address public charity;

  /**
   * @dev The SeperationOfPower constructor sets the original `owners` of the contract to the sender
   * account and a second address.
   */
  constructor(address _charity) public {
    dictator = msg.sender;
    charity = _charity;
  }


  /**
   * @dev Throws if called by any account other than the dictator.
   */
  modifier onlyDictator() {
    require(msg.sender == dictator);
    _;
  }
  
  /**
   * @dev Throws if called by any account other than the charity.
   */
  modifier onlyCharity() {
    require(msg.sender == charity);
    _;
  }
}
