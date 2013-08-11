require 'spec_helper'

describe "registration_forms/edit.html.haml" do

  let(:organisation) {mock_model(Coop,
    :reg_form_timing_factors => nil,
    :reg_form_financial_year_end => nil,
    :reg_form_close_links => nil,
    :reg_form_signatories => nil,
    :reg_form_signatories_attributes= => nil,
    :reg_form_main_contact_name => nil,
    :reg_form_main_contact_organisation_name => nil,
    :reg_form_main_contact_address => nil,
    :reg_form_main_contact_phone => nil,
    :reg_form_main_contact_email => nil,
  )}
  let(:members) {[
    mock_model(Member, :id => 111, :name => 'Angie', :selected => nil),
    mock_model(Member, :id => 222, :name => 'Bob', :selected => nil),
    mock_model(Member, :id => 333, :name => 'Christine', :selected => nil)
  ]}

  before(:each) do
    assign(:members, members)
    assign(:registration_form, organisation)
  end

  it "renders checkboxes to select signatories from the founder members" do
    render

    rendered.should have_selector(:input, :type => 'checkbox', :name => 'registration_form[reg_form_signatories_attributes][0][selected]')
    rendered.should have_selector(:label, :for => 'registration_form_reg_form_signatories_attributes_0_selected')
    rendered.should have_selector(:input, :type => 'hidden', :name => 'registration_form[reg_form_signatories_attributes][0][id]', :value => '111')

    rendered.should have_selector(:input, :type => 'checkbox', :name => 'registration_form[reg_form_signatories_attributes][1][selected]')
    rendered.should have_selector(:label, :for => 'registration_form_reg_form_signatories_attributes_1_selected')
    rendered.should have_selector(:input, :type => 'hidden', :name => 'registration_form[reg_form_signatories_attributes][1][id]', :value => '222')

    rendered.should have_selector(:input, :type => 'checkbox', :name => 'registration_form[reg_form_signatories_attributes][2][selected]')
    rendered.should have_selector(:label, :for => 'registration_form_reg_form_signatories_attributes_2_selected')
    rendered.should have_selector(:input, :type => 'hidden', :name => 'registration_form[reg_form_signatories_attributes][2][id]', :value => '333')
  end

  it "renders text fields for the main Co-operatives UK contact" do
    render

    expect(rendered).to have_selector(:input, :type => 'text', :name => 'registration_form[reg_form_main_contact_organisation_name]')
    expect(rendered).to have_selector(:input, :type => 'text', :name => 'registration_form[reg_form_main_contact_name]')
    expect(rendered).to have_selector(:textarea, :name => 'registration_form[reg_form_main_contact_address]')
    expect(rendered).to have_selector(:input, :type => 'text', :name => 'registration_form[reg_form_main_contact_phone]')
    expect(rendered).to have_selector(:input, :type => 'text', :name => 'registration_form[reg_form_main_contact_email]')
  end

end
