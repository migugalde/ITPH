class AddColumnToClient < ActiveRecord::Migration
  def change
    add_column :clients, :form_updated_at, :datetime
    add_column :clients, :date_of_birth, :datetime
    add_column :clients, :age, :string
    add_column :clients, :gender, :string
    add_column :clients, :address, :string
    add_column :clients, :does_phone_number_have_texting, :string
    add_column :clients, :alternate_phone_number, :string
    add_column :clients, :occupation, :string
    add_column :clients, :employer, :string
    add_column :clients, :length_of_employment, :string
    add_column :clients, :marital_status, :string
    add_column :clients, :length_of_marriage, :string
    add_column :clients, :spouses_name, :string
    add_column :clients, :spouses_dob, :datetime
    add_column :clients, :spouses_employed, :string
    add_column :clients, :emergency_contact_name, :string
    add_column :clients, :emergency_contact_relationship, :string
    add_column :clients, :emergency_contact_phone_number, :string
    add_column :clients, :emergency_contact_address, :string
    add_column :clients, :religious_affiliation, :string
    add_column :clients, :housemates, :string
    add_column :clients, :physician, :string
    add_column :clients, :date_of_last_physical_exam, :datetime
    add_column :clients, :illnesses_injuries_disabilities, :string
    add_column :clients, :medications, :string
    add_column :clients, :medication_prescriber, :string
    add_column :clients, :medication_prescriber_phone_number, :string
    add_column :clients, :has_been_hospitalized, :string
    add_column :clients, :hospitalization_info, :string
    add_column :clients, :has_family_member_with_abuse_problem, :string
    add_column :clients, :family_member_problem_explanation, :string
    add_column :clients, :problems, :string
    add_column :clients, :severity_of_problem, :string
    add_column :clients, :problem_start_time, :string
    add_column :clients, :has_received_counseling_before, :string
    add_column :clients, :prior_counselor, :string
    add_column :clients, :was_counseling_helpful, :string
    add_column :clients, :list_of_problems, :string
    add_column :clients, :how_they_heard_about_itph, :string
    add_column :clients, :may_send_appt_emails, :string
    add_column :clients, :may_send_general_emails, :string
  end
end