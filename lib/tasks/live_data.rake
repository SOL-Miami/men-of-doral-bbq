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

  desc 'run through list'

    task :email_list1, [:num] => :environment do |t, args|
      Contact.order(:id).limit(1000).offset(args.message.to_i*1250).each do |contact| 
        ContactMailer.newsletter_1_email(contact).deliver_now
      end
    end
    task :email_list2, [:num] => :environment do |t, args|
      Contact.order(:id).limit(1000).offset(args.message.to_i*2250).each do |contact| 
        ContactMailer.newsletter_1_email(contact).deliver_now
      end
    end
    task :email_list3, [:num] => :environment do |t, args|
      Contact.order(:id).limit(1000).offset(args.message.to_i*3250).each do |contact| 
        ContactMailer.newsletter_1_email(contact).deliver_now
      end
    end
end