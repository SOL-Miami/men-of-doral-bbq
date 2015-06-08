class Contact < ActiveRecord::Base
 attr_accessor :counter_cc

  def hacky
    self.order(:id).limit(5).offset(@counterc) do |c|
      if !Contact.count >= @counterc
        puts c.email
        @counterc += 1
        puts "current count #{@counterc}"
      end
    end
  end

end
