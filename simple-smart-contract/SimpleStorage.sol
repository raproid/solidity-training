// SPDX-License-Identifier: MIT
pragma solidity 0.8.19; // state solidity version

// A simple smart contract
contract SimpleStorage {
    // Declare basic data types
    bool hasFavouriteNumber = true;
    uint256 public myFavouriteNumber;
    uint256[] listOfFavouriteNumbers;

    // Declare special data types
    string favouriteNumberInText = "eightyfour";
    address myAddress = 0xB9a0c7a92fbf81400E242D28C135B47BFBa72C8B;
    bytes32 favouriteBytes = "cat";

    // Create a reference types
    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person[] public listOfPeople; //declare empty dynamic array

    mapping(string => uint256) public nameToFavouriteNumber;

    // Person public myFriend = Person({favouriteNumber: 0, name: "test"});

   // Access and modify the myFavouriteNumber state var
    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }

    // Get the curr myFavouriteNumber value
    function retrieve() public view returns(uint256) {
        return myFavouriteNumber;
    }

    // Add people to an array of people and get their fav number by their name
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push( Person(_favouriteNumber, _name) );
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}