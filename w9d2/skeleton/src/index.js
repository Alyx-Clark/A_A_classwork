const View = require("./ttt-view.js");// require appropriate file
const Game = require("../ttt_node/game.js");// require appropriate file

document.addEventListener("DOMContentLoaded", () => {
  // Your code here
  const game = new Game();
  let container_el = document.getElementsByClassName("ttt")[0];
  const view = new View(game, container_el);
	
});
