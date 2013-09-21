AtomicJot.ApplicationController = Ember.Controller.extend({

  needs: ['current_user'],
  currentUser: null,
  currentUserBinding: "controllers.current_user",

  actions: {
    search: function(){
      this.transitionToRoute('/search/' + this.get('query'));
    }
  }

});
