pragma solidity >=0.7.0 <0.9.0;

contract voting {
    mapping (string => uint256) public votesreceived;

    string[] public candidatelist;

    constructor (string[] memory candidatenames){
        candidatelist = candidatenames;
    }

    function totalvotesfor (string memory candidate) view public returns (uint256){
        require(validcandidate(candidate));

        return votesreceived[candidate];
    }

    function votesforcandidate (string memory candidate) public {
        require(validcandidate(candidate));
        votesreceived[candidate] += 1;
    }

    function validcandidate(string memory candidate) view public returns(bool){
        for(uint i = 0; i < candidatelist.length;i++){
            if (keccak256(abi.encodePacked(candidatelist[i])) == keccak256(abi.encodePacked(candidate))){
                return true;
            }
        }
        return false;
    }
}