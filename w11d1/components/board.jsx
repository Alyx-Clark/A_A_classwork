import React from 'react';
import Tile from './tile';
import * as MineSweeper from '../minesweeper'

export default class Board extends React.Component{
    constructor(props){
        super(props);
        // this.state ={
        //     tile : new MineSweeper.Tile()
        // }

    }
    render(){
        const grid = this.props.board.grid;
        // const updateGame = this.props.board.updateGame;

        return (
            <div>
                
                {grid.map((row, idx) => {
                    return(
                        <div key={idx}>
                        {row.map((tile, idx)=>{
                            return <Tile 
                            tile={tile}
                            key={idx}
                            updategame={this.updateGame}/>
                        })}
                    </div>
                    )
                })}
            </div>
        )
    }
}



