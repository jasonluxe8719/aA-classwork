const FollowToggle = require('./follow_toggle');

$(document).ready( function () {
    $('button.follow-toggle').each( (i, button) => new FollowToggle(button));
    $('nav.users-search').each ( (i, search) => new UsersSearch(search));

});