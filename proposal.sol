pragma solidity ^0.4.24;

import './society.sol';

contract Proposals is Society {
    /** There will be an active list of proposals. Everybody can vote for one proposal.
    * 
    *
    */
    
    struct Proposal {
        uint id;
        string description;
        uint votes;
        uint32 dateStamp;
    }
    
    Proposal[] public allActiveProposals;
    
    function newProposal(string _description) external {
        uint citizenId = addressToCitizenId[msg.sender];
        require(citizens[citizenId - 1].lastProposal <= uint32(now - 1 weeks));
        // Only 1 proposal per week allowed
        allActiveProposals.length++;
        uint proposalId = allActiveProposals.length - 1;
        
        uint32 dateStamp = uint32(now);
        allActiveProposals[proposalId] = Proposal(proposalId, _description, 0, dateStamp);
        citizens[citizenId - 1].lastProposal = dateStamp;
    }
}
