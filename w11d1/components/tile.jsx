import React from 'react';

export default class Tile extends React.Component{
    constructor(props){
        super(props)
        this.handleClick = this.handleClick.bind(this)
    }


    handleClick(e){
        let flagged = e.altKey ? true : false
        this.props.updateGame(this.props.tile, flagged)
    }


    render(){
        let tile; 
        if (this.props.tile.explored) {
           tile = this.props.tile.adjacentBombCount
        } else if (this.props.tile.bombed) {
            tile = '💣';
        } else if (this.props.tile.flagged) {
            tile = "🚩";
        } else{
            tile = "▢";
        }
        return(
            <span onClick={this.handleClick}>
                {tile}
            </span>
        );
    }
}