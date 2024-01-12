// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate { //at least one struct
        string name;
        uint256 voteCount;
    }

    Candidate[] public candidates;
    address owner;
    mapping(address => bool) public voters; //at least one mapping

    uint256 public votingStart;
    uint256 public votingEnd;

    event VoteCasted(address indexed voter, uint256 indexed candidateIndex); //at least one event-driven functionality
    event CandidateAdded(string name); //at least one event-driven functionality

constructor(string[] memory _candidateNames, uint256 _durationInMinutes) {
    for (uint256 i = 0; i < _candidateNames.length; i++) {
        candidates.push(Candidate({
            name: _candidateNames[i],
            voteCount: 0
        }));
    }
    owner = msg.sender;
    votingStart = block.timestamp;
    votingEnd = block.timestamp + (_durationInMinutes * 1 minutes);
}

    //first type of user(project ruqirement)
    modifier onlyOwner { //access control modifier
        require(msg.sender == owner);
        _;
    }

    //second type of user (project requirement)
    modifier onlyVoter() { //access control modifier
    require(voters[msg.sender], "Not a voter");
    _;
    }

    modifier onlyDuringVotingPeriod() {  //a modifier not used for access control (project requirement)
    require(block.timestamp >= votingStart && block.timestamp < votingEnd, "Voting period has ended");
    _;
    }

    function addCandidate(string memory _name) public onlyOwner {
        candidates.push(Candidate({
                name: _name,
                voteCount: 0
        }));
        
    }

    function addVoter(address _voter) public onlyOwner {
    voters[_voter] = true;
    }

    function removeVoter(address _voter) public onlyOwner {
    voters[_voter] = false;
    }

    function vote(uint256 _candidateIndex) public  onlyVoter onlyDuringVotingPeriod {
        require(!voters[msg.sender], "You have already voted.");
        require(_candidateIndex < candidates.length, "Invalid candidate index.");

        candidates[_candidateIndex].voteCount++;
        voters[msg.sender] = true;

        emit VoteCasted(msg.sender, _candidateIndex);
    }

    function getAllVotesOfCandiates() public view returns (Candidate[] memory){
        return candidates;
    }

    function getVotingStatus() public view returns (bool) {
        return (block.timestamp >= votingStart && block.timestamp < votingEnd);
    }

    function getRemainingTime() public view returns (uint256) {
        require(block.timestamp >= votingStart, "Voting has not started yet.");
        if (block.timestamp >= votingEnd) {
            return 0;
    }
        return votingEnd - block.timestamp;
    }
}