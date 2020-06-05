class View {
  constructor(HanoiGame, $el) {
    this.HanoiGame = HanoiGame;
    this.$el = $el;

    this.pileNum = null;
  
    this.$el.on("click", (event) => {
      if(this.pileNum === null) {  
        this.pileNum = $(event.target).data('pileNum');
      } else {
        this.HanoiGame.move(this.pileNum, $(event.target).data('pileNum'));
        this.pileNum = null;
        //perform the move;
      }
    })

    this.setupTowers();
    this.render();
  }

  setupTowers() {
    
    
    for(let i = 0; i < 3; i++){
      const $ul = $("<ul>");
      this.$el.append($ul);
      for(let j = 0; j < 3; j++) {
        $ul.data('pileNum', i+1);
        const $li = $("<li>");
        $li.data('number', j+1);
        if($ul.data('pileNum') === 1) {
          $ul.append($li);
       } //This is to fill the first list with the discs.
      }

    }

  }

  render() {

  }

}

module.exports = View;