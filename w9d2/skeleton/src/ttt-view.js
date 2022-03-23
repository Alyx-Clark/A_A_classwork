class View {
  constructor(game, el) {
	  this.game = game;
	  this.el = el;
	this.setupBoard();
  }

  setupBoard() {
	let ul = document.createElement("ul");
	let i = 0;
	let j;
	while (i<3){
		j = 0;
		while (j<3){
		let li = document.createElement("li");
		li.setAttribute("data-pos",[i,j]);
			
		li.style.width = "300";
		ul.appendChild(li);
		j++;
		}
		i++;
	}
	
	ul.classList.add("ttt-board");
	this.el.appendChild(ul);
  }
  
  bindEvents() {
	  document.addEventListener("click",this.handleClick);
  } //add event listner to figure class element
// pass in handleClick as the callback

  handleClick(e) {
	  this.makeMove(e.target);
	// see where the click happened
	//invoke makeMove IF move is valid
	//e.target IS the "square" 
  }

  makeMove(square) {
	pos = square.getAttribute("data-pos");
	pos = pos.split(',');
	pos.map(element => parseInt(element));
	
	
  }
//Game.prototype.playMove
}// invoke in HandleClick

module.exports = View;
