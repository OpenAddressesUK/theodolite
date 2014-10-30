class Address < ActiveRecord::Base

  ['street', 'locality', 'town', 'postcode'].each do |type|
    has_one type.to_sym

    define_method("#{type}_name=") do |val|
      self.send("#{type.to_sym}=", eval(type.classify).first_or_create(name: val))
    end

  end

end
