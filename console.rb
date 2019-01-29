require_relative('models/property.rb')

require('pry')

property_1 = Property.new({
  'address' => '10 Edinburgh',
  'value' => 100000,
  'year_built' => 2000,
  'buy_let_status' => 'let'
  }
)
property_2 = Property.new({
  'address' => '10 Glasgow',
  'value' => 200000,
  'year_built' => 2010,
  'buy_let_status' => 'buy'
  }
)

property_1.save()
property_2.save()

property_2.value = 300
property_2.update()
property_1.delete()

# property_found = Property.find()



binding.pry

nil
