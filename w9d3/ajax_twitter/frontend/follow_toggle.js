function FollowToggle(el){
    this.userId = el[user_id];
    this.followState = el[initial_follow_state];
    
}

FollowToggle.prototype.render = function(){
    if(this.followState === "unfollowed"){
        $text = $("value");
    }
}

module.exports = FollowToggle;



