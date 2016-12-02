# == Schema Information
#
# Table name: clients
#
#  id                                   :integer          not null, primary key
#  name                                 :string
#  counselor                            :string
#  email                                :string
#  phone_number                         :string
#  created_at                           :datetime
#  updated_at                           :datetime
#  form_updated_at                      :string
#  date_of_birth                        :string
#  age                                  :string
#  gender                               :string
#  address                              :string
#  does_phone_number_have_texting       :string
#  alternate_phone_number               :string
#  occupation                           :string
#  employer                             :string
#  length_of_employment                 :string
#  marital_status                       :string
#  length_of_marriage                   :string
#  spouses_name                         :string
#  spouses_dob                          :string
#  spouses_employed                     :string
#  emergency_contact_name               :string
#  emergency_contact_relationship       :string
#  emergency_contact_phone_number       :string
#  emergency_contact_address            :string
#  religious_affiliation                :string
#  housemates                           :string
#  physician                            :string
#  date_of_last_physical_exam           :string
#  illnesses_injuries_disabilities      :string
#  medications                          :string
#  medication_prescriber                :string
#  medication_prescriber_phone_number   :string
#  has_been_hospitalized                :string
#  hospitalization_info                 :string
#  has_family_member_with_abuse_problem :string
#  family_member_problem_explanation    :string
#  problems                             :string
#  severity_of_problem                  :string
#  problem_start_time                   :string
#  has_received_counseling_before       :string
#  prior_counselor                      :string
#  was_counseling_helpful               :string
#  list_of_problems                     :string
#  how_they_heard_about_itph            :string
#  may_send_appt_emails                 :string
#  may_send_general_emails              :string
#

class Client < ActiveRecord::Base
  has_and_belongs_to_many :events, :uniq => true
  has_many :users
  validates :name, presence: { message: "Client must have a name." }
  validates :email, presence: { message: "Client must have a valid email." }
  validates_format_of :email, :with => Devise::email_regexp
  
  def update_variables(current_user)
    if current_user.name == self.counselor and not self.users.include?(current_user)
      self.users << current_user
    end
    
    drive = GoogleDrive::Session.from_config("config.json")
    spreadsheet = drive.spreadsheet_by_key("1JCqPMgGr1UEHYwWtQp1c2E0HnuEHMJ68i2xSdDgYQw0").worksheets[0]
    client_index = -1
    spreadsheet.num_rows.downto(2) do |row|
	    if spreadsheet[row, 2] == self.name
		    client_index = row
		    break
		  end
		end
	
    if client_index != -1 and (self.form_updated_at.nil? or spreadsheet[client_index, 1] != self.form_updated_at)
        self.form_updated_at = spreadsheet[client_index, 1]
        self.date_of_birth = spreadsheet[client_index, 3]
        self.age = spreadsheet[client_index, 18]
        self.gender = spreadsheet[client_index, 4]
        self.email = spreadsheet[client_index, 5]
        self.address = spreadsheet[client_index, 6]
        self.phone_number = spreadsheet[client_index, 7]
        self.does_phone_number_have_texting = spreadsheet[client_index, 8]
        self.alternate_phone_number = spreadsheet[client_index, 9]
        self.occupation = spreadsheet[client_index, 10]
        self.employer = spreadsheet[client_index, 19]
        self.length_of_employment = spreadsheet[client_index, 20]
        self.marital_status = spreadsheet[client_index, 21]
        self.length_of_marriage = spreadsheet[client_index, 22]
        self.spouses_name = spreadsheet[client_index, 23]
        self.spouses_dob = spreadsheet[client_index, 24]
        self.spouses_employed = spreadsheet[client_index, 25]
        self.emergency_contact_name = spreadsheet[client_index, 11]
        self.emergency_contact_relationship = spreadsheet[client_index, 13]
        self.emergency_contact_phone_number = spreadsheet[client_index, 12]
        self.emergency_contact_address = spreadsheet[client_index, 26]
        self.religious_affiliation = spreadsheet[client_index, 27]
        self.housemates = spreadsheet[client_index, 28]
        self.physician = spreadsheet[client_index, 14]
        self.date_of_last_physical_exam = spreadsheet[client_index, 29]
        self.illnesses_injuries_disabilities = spreadsheet[client_index, 30]
        self.medications = spreadsheet[client_index, 31]
        self.medication_prescriber = spreadsheet[client_index, 32]
        self.medication_prescriber_phone_number = spreadsheet[client_index, 33]
        self.has_been_hospitalized = spreadsheet[client_index, 34]
        self.hospitalization_info = spreadsheet[client_index, 35]
        self.has_family_member_with_abuse_problem = spreadsheet[client_index, 36]
        self.family_member_problem_explanation = spreadsheet[client_index, 37]
        self.problems = spreadsheet[client_index, 38]
        self.severity_of_problem = spreadsheet[client_index, 39]
        self.problem_start_time = spreadsheet[client_index, 40]
        self.has_received_counseling_before = spreadsheet[client_index, 41]
        self.prior_counselor = spreadsheet[client_index, 42]
        self.was_counseling_helpful = spreadsheet[client_index, 43]
        self.list_of_problems = spreadsheet[client_index, 44]
        self.how_they_heard_about_itph = spreadsheet[client_index, 15]
        self.may_send_appt_emails = spreadsheet[client_index, 16]
        self.may_send_general_emails = spreadsheet[client_index, 17]
        self.save
    end
  end
end
