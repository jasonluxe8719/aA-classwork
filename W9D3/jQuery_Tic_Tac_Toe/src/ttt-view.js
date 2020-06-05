class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", (event) => {

      const $square = $(event.target);
      this.makeMove($square);
      
      $(event.target).html(this.game.currentPlayer).addClass('mark');
      if(this.game.isOver()) {
        alert('Game is over');
      }
    } );
  }
  
  makeMove($square) {
    const pos = $square.data('pos');
    this.game.playMove(pos);
  }

  setupBoard() {
    const $ul = $('<ul>');

    this.$el.append($ul);

    for(let i = 0; i < 3; i++){
      for(let j = 0; j < 3; j++){
        const $li = $('<li>');
        $li.data('pos', [i, j]);
        $ul.append($li);
      }
    }

  }
}

module.exports = View;
