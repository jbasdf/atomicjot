AtomicJot.User = DS.Model.extend({
  name: DS.attr('string'),
  email: DS.attr('string'),
  current_sign_in_at: DS.attr('date'),
  roles: DS.hasMany('AtomicJot.Role', {
    inverse: 'user'
  })
});
