// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

Todo[] public todos;

function create(string calldata _text) public {
        todos.push(Todo({
            text: _text, 
            completed: false}));        
    }

function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

 function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

 function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}

//0xD062c9C0E426cFB1ae56999Ef84E5d5Ba531a11e is my contract on Rinkeby