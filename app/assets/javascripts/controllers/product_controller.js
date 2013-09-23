AtomicJot.ProductController = Ember.ObjectController.extend({

  needs: ['search'],

  isSelected: false,

  actions: {

    select: function(){
      this.set('isSelected', !this.get('isSelected'));
    }
  }

});
