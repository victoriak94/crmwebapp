
gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{first_name} #{last_name}"
  end

end

Contact.auto_upgrade!

at_exit do
  ActiveRecord::Base.connection.close
end

Contact.destroy_all

p victoria = Contact.create(
  first_name: "Victoria",
  last_name:  "Kamila",
  email:      "vkamila6@gmail.com",
  note:       "Is a libra sun, taurus moon, and libra rising."
)

p william = Contact.create(
  first_name: "William",
  last_name:  "Selviz",
  email:      "willselviz@gmail.com",
  note:       "Virgo king."
)

p marina = Contact.create(
  first_name: "Marina",
  last_name:  "Sinko",
  email:      "marinasinko@gmail.com",
  note:       "libra rising GANGGGG."
)

p gabi = Contact.create(
  first_name: "Gabriella",
  last_name:  "Cuello",
  email:      "gabi@gmail.com",
  note:       "aint nothin like the libra/sag bond."
)

puts victoria.inspect
