pragma solidity ^0.4.24;

import './seperationofpower.sol';

contract Society is SeperationOfPower {
    constructor() public {
        newCitizen("Dictator", msg.sender);
    }
    
    struct Law {
        uint id;
        string description;
    }
    
    struct Citizen {
        address citizenAddress;
        string name;
        uint id;
        uint32 dateOfBirth;
        uint32 lastProposal;
    }
    
    Law[] public laws;
    Citizen[] public citizens;
    
    mapping (address => uint) public addressToCitizenId;
    
    function newCitizen(string _newName, address _newAddress) public onlyDictator {
        /** Only dictator can add new citizens. The new citizen must 
        * send her/his address to the dicator for approval. Otherwise people from other
        * societies can join. This is the only allowed centralization of the contract.
        */
        require(addressToCitizenId[_newAddress] == 0);
        citizens.length++;
        uint id = citizens.length;
        addressToCitizenId[_newAddress] = id;
        uint32 dateOfBirth = uint32(now);
        citizens[id - 1] = Citizen(_newAddress, _newName, id, dateOfBirth, dateOfBirth);
    }
}
