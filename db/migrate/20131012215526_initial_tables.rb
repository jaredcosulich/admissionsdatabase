class InitialTables < ActiveRecord::Migration
  def change
  
    create_table :students do |t|
      t.string  :name
      t.string  :phone_number
      t.string  :email
      t.string  :gender
      t.date    :birthmonth
      t.boolean :graduated, :default => false
      t.date    :graduation_date
      t.integer :address_id
      t.integer :family_id
      t.text    :comments
      t.timestamps
    end
    
    create_table :families do |t|
      t.integer   :address_id
      t.string    :parent_1_name
      t.string    :parent_2_name
      t.string    :email
      t.string    :phone_number
      t.integer   :newsletter_option_id
    end
    
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :zipcode
      t.string :state, :default => "CA"
    end
    
    create_table :enrollments do |t|
      t.integer :student_id
      t.date    :start
      t.date    :end
      t.text    :comments
    end
    
    create_table :referrals do |t|
      t.integer :family_id
      t.string  :type
    end
    
    create_table  :point_of_contacts do |t|
      t.integer   :family_id
      t.integer   :point_of_contact_type_id
      t.date      :date
      t.string    :comments
    end
    
    create_table :point_of_contact_types do |t|
      t.string :name
    end
    
    create_table :newsletter_options do |t|
      t.string :name
    end

    create_table :referral_options do |t|
      t.string :name
    end
    
  end
end



# Student
#   ID
#   Name
#   Phone Number
#   Email
#   Gender
#   AddressId
#   Age / Birthdate (month/year only)
#   HasGraduated (y/n)
#   Graduate (date)
#   Comments
# 
# Address
#   Street1
#   Street2
#   City
#   Zip
#   State    
#   
# Student-Contact
#   StudentId
#   ContactId
#   
# Enrollment
#   StudentId
#   Start
#   End
#   Reason
#   
# ReferralSource
#   StudentId
#   Type
#   
# PointOfContact
#   Student Id
#   Types: (website form/call/email, open house, admission request, visiting week, family interview)
#   Date
#   Comments
#   
# Parent
#   StudentId
#   AddressId
#   Name
#   Newsletter (none, email, print)
#   
#   
# 
# 
# 
# 
# How many contacts do we get a year vs. how many students enroll?
#   
# select count(*) from point_of_contacts
# select count(distinct(student_id)) from point_of_contacts
# 
#   
#   
# At each stage how old (also gender) are the students (contact vs. visit vs. enroll)
# 
# select student.age, point_of_contacts.type from students, point_of_contacts group by point_of_contacts.type, students.age
# 
# 
# 
# 
# Referral source
# 
# select type, count(*) from referrals group by type
# 
# 
# 
# Where do they live
# 
# select zipcode, count(*) from addresses group by zipcode
#   
#   


