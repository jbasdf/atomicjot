Ember.Application.initializer({
  name: 'currentUser',

  initialize: function(container) {
    var attributes = $('meta[name="current-user"]').attr('content');
    if(attributes){
      var parsed = JSON.parse(attributes);
      var id = parsed['user']['id'];
      var store = DS.get("defaultStore");
      var adapter = store.adapterForType(AtomicJot.User);
      adapter.didFindRecord(store, AtomicJot.User, parsed, id);
      var user = AtomicJot.User.find(id);
      container.lookup('controller:currentUser').set('content', user);
    }
  }
});