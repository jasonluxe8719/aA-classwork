const APIUtil = require('./api_util');

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.render();
    this.handleClick();
  }

  render() {
    if(this.followState === false) {
      this.$el.html("Follow!");
    } else if(this.followState === true) {
      this.$el.html("Unfollow!");
    }
  }

  handleClick() {
    this.$el.on("click", event => {
      event.preventDefault();
      let that = this;
      if(that.followState === false) {
        // debugger;
        APIUtil.followUser(that.userId).then(resolve => {
          that.followState = false;
          that.render();
        });
        // $.ajax({                               
        //   method: 'POST',
        //   url: `/users/${that.userId}/follow`,
        //   dataType: 'JSON',
        //   success() {
        //     that.followState = true;
        //     that.render();
        //   }
        // });
      } else {
        // debugger;
        APIUtil.unfollowUser(that.userId).then(resolve => {
          that.followState = false;
          that.render();
        });
        // $.ajax({
        //   method: 'DELETE',
        //   url: `/users/${that.userId}/follow`, 
        //   dataType: 'JSON',
        //   success() {
        //     that.followState = false;
        //     that.render();
        //   }
        // })
      };
    });
  }


}

module.exports = FollowToggle;