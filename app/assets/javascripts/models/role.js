AtomicJot.Role = DS.Model.extend({
  name: DS.attr('string'),
  user: DS.belongsTo('AtomicJot.User')
});
