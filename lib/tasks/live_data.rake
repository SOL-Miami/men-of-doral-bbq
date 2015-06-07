namespace :db do
  desc 'Import Emails'
  task :email_list_csv => :environment do
    Dir['lib/csv/*'].each do |file|
      csv_text = File.read(file)
      csv_text = csv_text.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each_with_index do |row|
        charity = Contact.new
        charity['email'] = row
        charity.save
      end
    end
  end
end