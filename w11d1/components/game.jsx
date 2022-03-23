import React from 'react';
import Board from './board';
import Tile from './tile';
import * as MineSweeper from '../minesweeper'

export default class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            board : new MineSweeper.Board(10, 25)
        }
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame(){

    }

    render(){
        return(
                <Board 
                board={this.state.board} 
                updateGame={this.updateGame}/>

        );

    }
}

// array.map(num).fill().map( ()=> array(num).fill())
