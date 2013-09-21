AtomicJot.CurrentUserController = Ember.ObjectController.extend({

  isAdmin: function(){
    var roles = this.get('content.roles');
    if(roles && roles.get('length') > 0){
      return roles.any(function(role){
        return role.get('name') === 'admin';
      });
    }
    return false;
  }.property('content'),

  isSignedIn: function(){
    var token = $('meta[name="authentication-token"]').attr('content');
    if(token){
      return true;
    }
    return false;
  }.property('content')

});