class RegistrationsController < Devise::RegistrationsController
  def edit
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.email}",
      amount: 15_00
    }
    super
  end
end
